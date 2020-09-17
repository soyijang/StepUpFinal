<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userMyTasks/userStandupMeeting/userStandupMeeting.css">
    <!-- 소이모달용,버튼용CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/modal.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">
    
      <!-- CDN -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2"><a href="showProjectMain.pj">🚀내 프로젝트 </a>  / <c:out value="${ sessionScope.projectName }"/></div>
           <div id="menuTitle">Stand Up Meeting</div>
       </div>

       <!-- content 영역 -->
       <div id="contentBox">
             <!-- 헤더 -->
         <div id="content-box-header">
            <table id="content-box-header-table">
               <tr>
                  <td></td>
                  <td>
                     <!-- <div id="search">
                        <input class="input" type="text"/>
                        <img id="icon_searchicon" src="/agile/resources/icon/common/icon_searchicon.png">
                     </div> -->
                  </td>
                  <td onclick="updateRss();"><img id="icon_settings" src="/agile/resources/icon/common/icon_settings.png"></td>
                  <td id="today-box-td">
                     <div id="today-box-wrapper">
                        <img id="icon_double_left_chevron" src="/agile/resources/icon/common/icon_double_left_chevron.png">
                           <div id="today-box"></div>
                           <!-- 오늘 날짜 저장하는 곳 -->
                           <input type="hidden" id="today" value=""/>
                           <input type="hidden" id="focus" value=""/>
                           <input type="hidden" id="start" value=""/>
                        <img id="icon_double-right_chevron" src="/agile/resources/icon/common/icon_double _right_chevron.png">
                     </div>
                  </td>
                  <td id="rssBtn" onclick="closeRss();">열려라달력스!</td>
                  <td id="rssBtn" onclick="openRss();"><img id="icon_rss_feed" src="/agile/resources/icon/common/icon_rss_feed.png">팀 rss 구독하기</td>
                  <td width="30px;"></td>
               </tr>
            </table>
         </div>
         
         <!-- -----------------------------------------rss 목록보기------------------------------------ -->
         <form action="updateRss.mt" method="post">
            <div id="selectRss" class="modal">
               <div class="modal-content-big rssSelectcontent">
                  <p align="left" class="modaltitle">📳 우리 팀 RSS 목록</p>
                  <table class="rssSelectModalTable" width="90%" align="center">
                     <colgroup>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="*"/>
                        <col width="15%"/>
                     </colgroup>
                        <tr align="center">
                           <td><b>구독명칭</b></td>
                           <td><b>RSS키워드</b></td>
                           <td><b>URL</b></td>
                           <td><b>RSS사이트명</b></td>
                        </tr>
                        <c:if test="${not empty rssList}">
                        <c:forEach var="i" begin="0" end="${fn:length(rssList)-1}">
                            <tr class="rsslistout">
                              <td><input type="text" class="updateInput" id="rssModifyNickname" name="rssModifyNickname" value="${rssList.get(0).rssModifyNickname}" autocomplete="off"></td>
                              <td><input type="text" class="updateInput" id="rssModifyKeyword" name="rssModifyKeyword" value="${rssList.get(0).rssModifyKeyword}" ></td>
                              <td><input type="text" class="updateInput" id="rssurlget" name="rssModifyUrl" value="${rssList.get(0).rssModifyUrl}" ></td>
                              <td><input type="text" class="updateInput" id="rssModifySite" name="rssModifySite" value="${rssList.get(0).rssModifySite}" ></td>
                              <td><input type="hidden" name="rssProjectCode" value="${rssList.get(0).rssProjectCode}" ></td>
                           </tr> 
                        </c:forEach>
                        </c:if>
                        
                        <c:if test="${empty rssList}">
                            <tr class="rsslistout">
                              <td><input type="text" class="updateInput" id="rssModifyNickname" name="rssModifyNickname" value=""></td>
                              <td><input type="text" class="updateInput" id="rssModifyKeyword" name="rssModifyKeyword" value="" ></td>
                              <td><input type="text" class="updateInput" id="rssurlget" name="rssModifyUrl" value="" ></td>
                              <td><input type="text" class="updateInput" id="rssModifySite" name="rssModifySite" value="" ></td>
                              <td><input type="hidden" name="rssProjectCode" value="0" ></td>
                           </tr> 
                        </c:if>
                        
                  </table>
                  <div class="modalButtonArea">
                     <button class="rectangle6" type="submit">저장</button>
                     <div class="rssSelectClose" id="rectangle7">취소</div>
                  </div>
               </div>
            </div>
	        <input type="hidden" name="userProjectCode" value="${sessionScope.userProjectCodeNew}">
         </form>
         <!-- ----------------------------소이js-------------------------- -->
         <script type="text/javascript">
            //목록모달끄기
             $(document).on('click', '.rssSelectClose', function(){
                $('#selectRss').css('display','none');
                
             });
            
            
            //rss설정 모달열기
            function updateRss() {
                $('#selectRss').fadeIn(300); 
                $('#selectRss').css('display','block');
            }
            
            
            //rss로 바꾸기
             function openRss() {
                $('#rssbox').css('display','block');
                $('#calender-box').css('display','none');
                
                var url = $('#rssurlget').val();
                
                $.ajax({
                  url:"showRssContent.mt",
                  type:"post",
                  data: {url:url},
                  dataType : "json",
                  success: function(data){
                     
                     //하위요소 비우고시작
                     $('#rssbox').children().remove();
                     
                     //rss컨텐츠들의 갯수가 50개 이상이면 50개까지만 보이고 아니면 다보이게
                     var maxAmount;
                     if(data.rssContent.length > 50){
                        maxAmount = 50;
                     }else{
                        maxAmount = data.rssContent.length;
                     }
                     
                     //반복해서 카드형태로 넣어줌
                     for(var i = 0; i < maxAmount; i++){
                        
                        //제목 길면 자르기
                        var maxTitle;
                        if(data.rssContent[i].title.length > 18){
                           maxTitle = data.rssContent[i].title.substring(0,18) + '...';
                        }else{
                           maxTitle = data.rssContent[i].title;
                        }
                     
                        var rsslink = "'" +  data.rssContent[i].link + "'";
                        $('#rssbox').append(
                           '<table class="rssContent" onclick="window.open('+ rsslink + ')" style="table-layout: fixed"><tr>'
                           + '<td class="rssimg" rowspan="3"><img class="rssCountentImg" src="/agile/resources/images/logo/logo_stepup.png"></td><td class="rssauthor">'
                           + data.rssContent[i].author +'</td>'
                           + '<td class="rsstitle" nowrap>'+ maxTitle +'</td></tr><tr>'
                           + '<td class="rssdescription" colspan="2">'+ data.rssContent[i].description +'</td></tr><tr>'
                           + '<td class="rsspubdate" colspan="2">'+ data.rssContent[i].pubdate +'</td></tr></table>'
                        );   
                     }
                     
                  },
                  error : function () {
                     console.log('rss 못가져옴');
                  },
                  beforeSend : function(){
                       $('.wrap-loading').removeClass('display-none');
                  },
                  complete : function(){
                      $('.wrap-loading').addClass('display-none');
                  }
               })
                
            }
            
            //열려라달력스
            function closeRss() {
                $('#calender-box').css('display','block');
                $('#rssbox').css('display','none');
                
            }
         </script>
         
         
         
             <div id="calender-box">
                <!-- 헤더 테이블 -------------------------------------------------------------------------------------------------------->
                <table id="calender-box-table">
                   <tr id="calender-box-table-tr-1">
                      <td id="category"><div class="space"></div></td>
                      <td class="sun"><div class="date">SUN</div></td>
                      <td class="mon"><div class="date">MON</div></td>
                      <td class="tue"><div class="date">TUE</div></td>
                      <td class="wed"><div class="date">WED</div></td>
                      <td class="thur"><div class="date">THUR</div></td>
                      <td class="fri"><div class="date">FRI</div></td>
                      <td class="sat"><div class="date">SAT</div></td>
                   </tr>
                   <!-- 날짜 표시하는 곳 -->
                   <tr id="calender-box-table-tr-2" class="date">
                      <td class="category"><div class="space"></div></td>
                      <td class="sun"><input type="hidden" id="monthNow0"><input type="hidden" id="yearNow0"><input type="hidden" id="dayNow0"><div class="day"></div></td>
                      <td class="mon"><input type="hidden" id="monthNow1"><input type="hidden" id="yearNow1"><input type="hidden" id="dayNow1"><div class="day"></div></td>
                      <td class="tue"><input type="hidden" id="monthNow2"><input type="hidden" id="yearNow2"><input type="hidden" id="dayNow2"><div class="day"></div></td>
                      <td class="wed"><input type="hidden" id="monthNow3"><input type="hidden" id="yearNow3"><input type="hidden" id="dayNow3"><div class="day"></div></td>
                      <td class="thur"><input type="hidden" id="monthNow4"><input type="hidden" id="yearNow4"><input type="hidden" id="dayNow4"><div class="day"></div></td>
                      <td class="fri"><input type="hidden" id="monthNow5"><input type="hidden" id="yearNow5"><input type="hidden" id="dayNow5"><div class="day"></div></td>
                      <td class="sat"><input type="hidden" id="monthNow6"><input type="hidden" id="yearNow6"><input type="hidden" id="dayNow6"><div class="day"></div></td>
                   </tr>
                </table>
                
 
 
 
                <!-- 미진행 테이블 -------------------------------------------------------------------------------------------------------->
              <div id="i">
                      <div id="iName">
                    미진행
                   </div>
                   <div class="i0">
                   </div>
                    <div class="i1">
                   </div>
                    <div class="i2">
                   </div>
                    <div class="i3">
                   </div>
                    <div class="i4">
                   </div>
                    <div class="i5">
                   </div>
                    <div class="i6">
                   </div>
                </div>            
                   
                <!-- 진행중 테이블 -------------------------------------------------------------------------------------------------------->
                <div id="p">
                      <div id="pName">
                    진행중
                   </div>
                   <div class="p0">
                   </div>
                    <div class="p1">
                   </div>
                    <div class="p2">
                   </div>
                    <div class="p3">
                   </div>
                    <div class="p4">
                   </div>
                    <div class="p5">
                   </div>
                    <div class="p6">
                   </div>
                </div>
                
                <!-- 완료 테이블 -------------------------------------------------------------------------------------------------------->
                <div id="c">
                      <div id="cName">
                    완료
                   </div>
                   <div class="c0">
                   </div>
                    <div class="c1">
                   </div>
                    <div class="c2">
                   </div>
                    <div class="c3">
                   </div>
                    <div class="c4">
                   </div>
                    <div class="c5">
                   </div>
                    <div class="c6">
                   </div>
                </div>
             </div>      

             
             <!-- --------------------------바뀐창------------------------- -->
             <div id="rssbox" style="display: none">
         <!-- ajax append구역 -->
             </div>
   
         <div class="wrap-loading display-none">
               <div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
         </div>   
                
      </div>   
    
    </div>
   
</body>


<script>

//컨트롤러에서 보낸 리스트 가져오기
var selectMytaskShareList = JSON.parse('${selectMytaskShareList}');
console.log("공유된 일정 조회");
console.log(selectMytaskShareList);

//오늘 날짜 확인
var today = new Date();
//오늘 날짜 저장하는 곳 : input hidden에 #today 저장 
$("#today").val(today);
//요일 : 주간 시작 일자 계산을 위해 필요함
var day = today.getDay();

/* ------------------------------------------------------------------------------------- */
//캘린더 제목에 오늘날짜 다시 써주기
var title = $('#today-box');
title.html(today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 ");

//주간 캘린더 시작 날짜 및 종료날짜 계산 :
//일자가 m일이고 요일이 n인경우 주간 캘린더 일자 시작은 m-n, 종료일은 m+6-n
var start = new Date(today.getFullYear(), today.getMonth(), today.getDate(), today.getHours());//오늘 날짜에서 계산 시작
start.setDate(start.getDate() - day);//setDate로 변경. 기존 날짜에서 getDate 한 후 요일값 만큼 빼주면 주간 캘린더 시작일 나옴
console.log("주간 시작일" + start);
$('#start').val(start);

var end = new Date(today.getFullYear(), today.getMonth(), today.getDate(), today.getHours());
end.setDate(end.getDate() + 6 - day);
console.log("주간 종료일" + end);

//캘린더에 일자 그리기
$(".date .day").each(function(index, item){
   //왼쪽부터 일자 하나 그린 후
   $(item).html(start.getDate());
   // input type="hidden" monthNow, yearNow id에 해당 날짜 숨겨두기
   $('#yearNow' + index).val(start.getFullYear());
   $('#monthNow' + index).val(start.getMonth() + 1);
   $('#dayNow' + index).val(start.getDate());
   //왼쪽 부터 값을 하나씩 올려주기 위해 반복문 돌때마다 시작 일자를 변경해간다
   start.setDate(start.getDate() + 1);
});


if(selectMytaskShareList.length > 0){
   //공유 내용 그려주기
   for(var i = 0; i < selectMytaskShareList.length; i++){   
      //공유한 일자 Date로 변환
      var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
      var mytasksShareDateY = mytasksShareDate.getFullYear();
      var mytasksShareDateM = mytasksShareDate.getMonth() + 1;
      var mytasksShareDateD = mytasksShareDate.getDate();
      var mytasksShareType = selectMytaskShareList[i].myTaskShare.mytasksShareType
      console.log("년" + mytasksShareDateY);
      console.log("월" + mytasksShareDateM);
      console.log("일" + mytasksShareDateD);
      console.log("타입" + mytasksShareType);

      
      
      for(var j = 0; j < 7; j++){   
         if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
            $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='01'){
               var target = $('.i' + j);
               target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                      + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                      + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                      + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                      + "</span></div>");
         }
      }
      
      for(var j = 0; j < 7; j++){   
         if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
            $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='02'){
               var target = $('.p' + j);
               target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                      + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                      + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                      + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                      + "</span></div>");
         }
      }      
      
      
      for(var j = 0; j < 7; j++){   
         if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
            $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='03'){
               var target = $('.c' + j);
               target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
               + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
               + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
               + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
               + "</span></div>");
         }
      }   
      
      
   }
}   

/* ------------------------------------------------------------------------------------- */

//왼쪽으로 가기 아이콘 클릭시
$(document).on('click','#icon_double_left_chevron', function(){
   //안에 내용 초기화 해주기
   for(var i = 0; i < 7; i++){
      $('.i' + i).html('');
      $('.p' + i).html('');
      $('.c' + i).html('');
   }
   
   var start = new Date($('#start').val());
   //7일 빼줌
   start.setDate(start.getDate() - 7);
   //input hidden에 다시 저장
   $("#start").val(start)


   //캘린더에 일자 그리기
   $(".date .day").each(function(index, item){
      //왼쪽부터 일자 하나 그린 후
      $(item).html(start.getDate());
      // input type="hidden" monthNow, yearNow id에 해당 날짜 숨겨두기
      $('#yearNow' + index).val(start.getFullYear());
      $('#monthNow' + index).val(start.getMonth() + 1);
      $('#dayNow' + index).val(start.getDate());
      //왼쪽 부터 값을 하나씩 올려주기 위해 반복문 돌때마다 시작 일자를 변경해간다
      start.setDate(start.getDate() + 1);
   });


   if(selectMytaskShareList.length > 0){
      //공유 내용 그려주기
      for(var i = 0; i < selectMytaskShareList.length; i++){   
         //공유한 일자 Date로 변환
         var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
         var mytasksShareDateY = mytasksShareDate.getFullYear();
         var mytasksShareDateM = mytasksShareDate.getMonth() + 1;
         var mytasksShareDateD = mytasksShareDate.getDate();
         var mytasksShareType = selectMytaskShareList[i].myTaskShare.mytasksShareType
         console.log("년" + mytasksShareDateY);
         console.log("월" + mytasksShareDateM);
         console.log("일" + mytasksShareDateD);
         console.log("타입" + mytasksShareType);

         
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='01'){
                  var target = $('.i' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='02'){
                  var target = $('.p' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }      
         
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='03'){
                  var target = $('.c' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }   
      }
   }   
});


//오른쪽으로 가기 아이콘 클릭시
$(document).on('click','#icon_double-right_chevron', function(){
   //안에 내용 초기화 해주기
   for(var i = 0; i < 7; i++){
      $('.i' + i).html('');
      $('.p' + i).html('');
      $('.c' + i).html('');
   }
   
   /* ------------------------------------------------------------------------------------- */
   var start = new Date($('#start').val());
   //7일 빼줌
   start.setDate(start.getDate() + 7);
   //input hidden에 다시 저장
   $("#start").val(start)


   //캘린더에 일자 그리기
   $(".date .day").each(function(index, item){
      //왼쪽부터 일자 하나 그린 후
      $(item).html(start.getDate());
      // input type="hidden" monthNow, yearNow id에 해당 날짜 숨겨두기
      $('#yearNow' + index).val(start.getFullYear());
      $('#monthNow' + index).val(start.getMonth() + 1);
      $('#dayNow' + index).val(start.getDate());
      //왼쪽 부터 값을 하나씩 올려주기 위해 반복문 돌때마다 시작 일자를 변경해간다
      start.setDate(start.getDate() + 1);
   });


   if(selectMytaskShareList.length > 0){
      //공유 내용 그려주기
      for(var i = 0; i < selectMytaskShareList.length; i++){   
         //공유한 일자 Date로 변환
         var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
         var mytasksShareDateY = mytasksShareDate.getFullYear();
         var mytasksShareDateM = mytasksShareDate.getMonth() + 1;
         var mytasksShareDateD = mytasksShareDate.getDate();
         var mytasksShareType = selectMytaskShareList[i].myTaskShare.mytasksShareType
         console.log("년" + mytasksShareDateY);
         console.log("월" + mytasksShareDateM);
         console.log("일" + mytasksShareDateD);
         console.log("타입" + mytasksShareType);

         
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='01'){
                  var target = $('.i' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='02'){
                  var target = $('.p' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }      
         
         
         for(var j = 0; j < 7; j++){   
            if($('#yearNow' + j).val() == mytasksShareDateY && $('#monthNow' + j).val() == mytasksShareDateM &&
               $('#dayNow' + j).val() == mytasksShareDateD && mytasksShareType =='03'){
                  var target = $('.c' + j);
                  target.append("<div class='one tooltip'>" + "<c>" + "* " + "</c>" + selectMytaskShareList[i].myTaskscontents + "<span class='tooltiptext'>" + selectMytaskShareList[i].member.userName + "님의 공유 일정 공유 내용" + "<br>" 
                         + "일정 시작일 : " + selectMytaskShareList[i].myTasksstartDate + "<br>"
                         + "일정 종료일 : " + selectMytaskShareList[i].myTasksendDate + "<br>"
                         + "일정 내용 : " + selectMytaskShareList[i].myTaskscontents
                         + "</span></div>");
            }
         }   
         
         
      }
   }   
   
});


</script>


</html>