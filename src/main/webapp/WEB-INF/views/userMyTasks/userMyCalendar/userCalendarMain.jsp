<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/calendar.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userMyTasks/dropdown.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">

</head>
<body>
    <%@ include file="../../common/nav.jsp" %>
    <div id="content-nav-only">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2"><b id="projectName">
				<c:out value="${ myTaskList.get(0).member.userName }" /></b>님 오늘도 화이팅!</div>
            <div id="menuTitle">개인일정관리</div>
        </div>
<!--         
    --------------------------------------------------------------------------------------------------           	
    설문 초대 모달창
	<form action="mailSender.sv" method="post">
		<div id="sendSurvey" class="modal">
			<div class="modal-content mytaskDeletecontent">
				<p align="left" class="modaltitle">📬 설문 전송</p>
				<p class="modalcontent">※ 설문 발송 대상 메일과 성함을 입력해주세요.</p>
				<table align="center" class="MyTaskDeleteModalTable">
					<thead align="center">
						<tr align="center">
							<td><b>이름</b></td>
							<td><b>이메일</b></td>
						</tr>
					</thead>	
					<tbody id="surveyPersonAdd">
						<tr>
							<td><input type="text" class="surveyInput2" value="" id="userName1" autocomplete="off"></td>
							<td><input type="text" class="surveyInput1" value="" id="userEmail1" autocomplete="off"></td>
						</tr>	
					</tbody>
				</table>
				<div class="modalButtonArea">
					<div class="surveyAddBtn" id="rectangle7">추가</div>
					<button class="rectangle6" onclick="startAdd()" type="button">보내기</button>
					<div class="surveyClose" id="rectangle7">취소</div>
				</div>
				<input type="hidden" id="surveyCode" class="" value="2"> 
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
		
		//보내기모달열기
	    function surveySend() {
	    	$('#sendSurvey').fadeIn(300); 
	    	$('#sendSurvey').css('display','block');
		}
		
		//카운팅용	
		var cnt = 1;
		
		//닫기누르면 창 닫으면서 안에 추가되어있던것들 리셋
	    $(document).on('click', '.surveyClose', function(){
	    	$('#sendSurvey').css('display','none');
	    	$('#surveyPersonAdd').children().remove();
	    	$('#surveyPersonAdd').append('<tr>'
					+'<td><input type="text" class="surveyInput2" value="" id="userName' + cnt + '" autocomplete="off"></td>'
					+'<td><input type="text" class="surveyInput1" value="" id="userEmail' + cnt + '" autocomplete="off"></td>'
					+'</tr>');
	    });	
		
		//추가하기
	    $(document).on('click', '.surveyAddBtn', function(){
	    	cnt++;
	    	console.log('cnt : ' + cnt);
	    	$('#surveyPersonAdd').append('<tr>'
				+'<td><input type="text" class="surveyInput2" value="" id="userName' + cnt + '" autocomplete="off"></td>'
				+'<td><input type="text" class="surveyInput1" value="" id="userEmail' + cnt + '" autocomplete="off"></td>'
				+'</tr>');
	    });	
		
		function startAdd() {
			
			//입력된 내용가져오기
			//totData는 객체로 선언, dataList는 Array로 선언
			var totData2 = new Object();
			var dataList2 = new Array();
			
			//사람별로 data라는 객체에 값을 넣고 각 data객체들을 dataList에 push해줌
			for(var i=1; i<cnt+1; i++){
				var data = new Object();
				data["surveyJoinEmail"] = $('#userEmail' + i).val();
				data["surveyJoinReply"] = 'N';
				data["surveyCode"] = $('#surveyCode').val();
				data["surveyJoinName"] = $('#userName' + i).val();
				dataList2.push(data);
			}
			
			//dataList를 voList객체로 다시한번 넣어줌. (totData는 객체로 선언, dataList는 Array로 선언)
			totData2["surveyJoinVOList"] = dataList2;
			console.log(totData2);
			//메일발송하기
		     $.ajax({
		    	type : 'post',
				url: "mailSender.sv",
				contentType:'application/json',
				dataType: 'json',
				data : JSON.stringify(totData2),
				success : function(data) {  
					alert('총 ' + data.size + '명에게 설문지 전송을 성공적으로 완료하였습니다!');
				},
				error : function () {
					console.log('설문대상자 추가실패!');
				},
				beforeSend : function(){
			        $('.wrap-loading').removeClass('display-none');
					document.getElementsByClassName("surveyClose")[0].click();
				},
				complete : function(){
				    $('.wrap-loading').addClass('display-none');
				}
	  	    }); 
			
		}
	</script>
    --------------------------------------------------------------------------------------------------   
      -->
        <!-- 캘린더영역 -->
        <div id="contentBox">
			<div id="calendar">			
				<!-- 캘린더상단영역 -->
				 <div class="all_cal-func">
					<div class="cal_top">
						<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img src="/agile/resources/icon/common/icon_left_chevron.png"></span></a>
						<span id="cal_top_year"></span>.
						<span id="cal_top_month"></span>
						<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img src="/agile/resources/icon/common/icon_right_chevron.png"></span></a>
						<span class="goToday" onclick="initDate(); drawDays(); drawSche('A');">🌈TODAY</span>
						
						<!----------------- 설문임시버튼 ---------------->
						<!-- <form action="surveyReply.sv" method="post"> -->
<!-- 						<button type="button" onclick="surveySend();">설문응답발송</button> -->
						<!-- <input type="hidden" value="2" name="surveyCode"> -->
						<!-- ----------------------------------- -->
						
						<div id="calendarbtn">
							<div class="cal-func" onclick="drawSche('N')">공유되지않은 일정</div>
							<div class="cal-func" onclick="drawSche('Y')">공유된 일정</div>
							<div class="cal-func" onclick="drawSche('A')">전체 개인 일정</div>
						</div>
					</div>
				</div>	
  
				<!-- 캘린더영역 -->
				<div id="cal_tab" class="cal"></div>				   		
				
				<!-- 우측영역 -->
				<div class="checkList">
					<div id="toDoList">
						<div class="checkListToday">
							<div id="todayDay"></div>
							<input type="hidden" id="todayDay2" value="">
							<div id="todayDate"></div>
							<span id="allTasks"><img id="switchToDo" onclick="drawTodo('A')" src="/agile/resources/icon/indiv/icon_switch_today.png"></span>
							<p id="thingsTodo">내  미해결 업무 ${countN}개 남음</p>
							<hr>
						</div>
						
						<div id="checkListTodayTableDiv">
							<!-- 체크리스트영역 -->
							<table class="checkListTodayTable"></table>
						</div>
						
						<div id="plusMyTaskDiv">
							<img id="plusMyTask" onclick="newTask()" src="/agile/resources/icon/common/icon_circle_plus_red.png">
						</div>
					</div>
					
					<div id="sharedList">
						<div class="checkListToday">
							<div id="todayDay">오늘 공유한 일정</div>
							
							<!-- 체크리스트영역 -->
							<p>진행 한 일</p><hr>
							<div id="shareDoneTableDiv">
							<table class="shareDoneTable"></table>
							</div>
							
							<!-- 체크리스트영역 -->
							<p>진행 할 일</p><hr>
							<div id="shareTodoTableDiv">
							<table class="shareTodoTable"></table>
							</div>
							
							<!-- 체크리스트영역 -->
							<p>변경/취소/미달성 된 일</p><hr>
							<div id="shareNotTableDiv">
							<table class="shareNotTable"></table>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    <!-- 내 업무 수정 모달창 -->
	<form action="update.mt" method="post">
		<div id="updateMyTask" class="modal">
			<div class="modal-content mytaskupdatecontent">
				<p align="left" class="modaltitle">💻 내 업무 수정하기</p>
				<table align="center" class="MyTaskUpdateModalTable">
					<tbody>
						<tr>
							<td><b>내 업무 명 : </b></td>
							<td><input type="text" class="updateInput updateMyTaskName" name="myTaskscontents" value="" autocomplete="off"></td>
						</tr>
						<tr>
							<td><b>업무 실행 일자 : </b></td>
							<td><input type="date" class="updateInput updateMyTaskStartDate" name="myTasksstartDate" value=""></td>
						</tr>
						<tr>
							<td><b>업무 실행 시간 : </b></td>
							<td><input type="time" class="updateInput updateMyTaskStartTime" name="myTasksstartTime" value="" ></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="myTaskUpdateClose" id="rectangle7">취소</div>
				</div>
				<input type="hidden" class="updateMyTasksCode" name="myTasksCode" value=""> 
			</div>
		</div>
	</form>
	
    <!-- 내 업무 추가 모달창 -->
	<form action="insert.mt" method="post">
		<div id="insertMyTask" class="modal">
			<div class="modal-content mytaskInsertcontent">
				<p align="left" class="modaltitle">💻 내 업무 추가하기</p>
				<table align="center" class="MyTaskInsertModalTable">
					<tbody>
						<tr>
							<td><b>내 업무 명 : </b></td>
							<td><input type="text" class="updateInput insertMyTaskName" name="myTaskscontents" value="" autocomplete="off"></td>
						</tr>
						<tr>
							<td><b>업무 실행 일자 : </b></td>
							<td><input type="date" class="updateInput insertMyTaskStartDate" name="myTasksstartDate" value=""></td>
						</tr>
						<tr>
							<td><b>업무 실행 시간 : </b></td>
							<td><input type="time" class="updateInput insertMyTaskStartTime" name="myTasksstartTime" value="" ></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="myTaskInsertClose" id="rectangle7">취소</div>
				</div>
				<input type="hidden" name="userProjectCode" value="${ myTaskList.get(0).userProjectCode }"> 
			</div>
		</div>
	</form>
	
    <!-- 내 업무 삭제 모달창 -->
	<form action="delete.mt" method="post">
		<div id="deleteMyTask" class="modal">
			<div class="modal-content mytaskDeletecontent">
				<p align="left" class="modaltitle">🗑 정말 삭제하시겠습니까?</p>
				<table align="center" class="MyTaskDeleteModalTable">
					<tbody>
						<tr>
							<td><b>업무 명 : </b></td>
							<td><input type="text" class="updateInput deleteMyTaskName" name="myTaskscontents" value="" readonly="readonly" autocomplete="off"></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">삭제</button>
					<div class="myTaskDeleteClose" id="rectangle7">취소</div>
				</div>
				<input type="hidden" name="myTasksCode" class="deleteTaskCode" value=""> 
			</div>
		</div>
	</form>
	
    <!-- 내 업무 공유 모달창 -->
	<form action="share.mt" method="post">
		<div id="shareMyTask" class="modal">
			<div class="modal-content mytaskSharecontent">
				<p align="left" class="modaltitle">📣 내 업무 공유하기</p>
				<p style="text-align: center;">※ 업무 공유 후에는 공유를 철회 할  수 없습니다.<br>시작일과 종료일을 확인해주세요! </p>
				<table align="center" class="MyTaskShareModalTable">
					<tbody>
						<tr>
							<td><b>업무 명 : </b></td>
							<td><input type="text" class="updateInput shareMyTaskName" name="myTaskscontents" value="" readonly="readonly" autocomplete="off"></td>
						</tr>
						<tr>
							<td><b>공유 구분 : </b></td>
							<td>
							 <select class="updateInput" name="mytasksShareType">
							 	<option value="01">진행 한 일</option>
							 	<option value="02">진행 할 일</option>
							 	<option value="03">미달성 한 일</option>
							 </select>
							</td>
						</tr>
						<tr>
							<td><b>공유 할 프로젝트 : </b></td>
							<td>
							 <select class="updateInput" name="userProjectCode">
							<c:if test="${not empty userProjectSelect}">
								<c:forEach var="i" begin="0" end="${fn:length(userProjectSelect)-1}">
								 	<option value="${userProjectSelect.get(i).userProjectCode}">${userProjectSelect.get(i).projectName}</option>
								 </c:forEach>
							 </c:if>
							 </select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">공유하기</button>
					<div class="myTaskShareClose" id="rectangle7">취소</div>
				</div>
				<input type="hidden" name="myTasksCode" class="shareTaskCode" value=""> 
			</div>
		</div>
	</form>
    
    <div class="wrap-loading display-none">
   		<div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
	</div>   
    
    <script type="text/javascript">
	    var today = null;
	    var year = null;
	    var month = null;
	    var firstDay = null;
	    var lastDay = null;
	    var $tdDay = null;
	    var $tdSche = null;
	    var day = null;
	
	    window.onload = function(){
	        drawCalendar();
	        initDate();
	        drawDays();
	        drawSche('A');
	        drawTodo('T');
	        drawShare();
	        $("#movePrevMonth").on("click", function(){movePrevMonth();});
	        $("#moveNextMonth").on("click", function(){moveNextMonth();});
	    };
	    
	    //공유하기 모달
	    function shareTask(myTasksCode, myTaskscontents) {
			var myTasksCode = myTasksCode;
			var myTaskscontents = myTaskscontents;
			
	    	$('.shareMyTaskName').val(myTaskscontents);
	    	$('.shareTaskCode').val(myTasksCode);

	    	$('#shareMyTask').fadeIn(300); 
	    	$('#shareMyTask').css('display','block');
	    	
		}
		
	    //삭제하기
	    function deleteTask(myTasksCode, myTaskscontents) {
			var myTasksCode = myTasksCode;
			var myTaskscontents = myTaskscontents;
			
	    	$('.deleteMyTaskName').val(myTaskscontents);
	    	$('.deleteTaskCode').val(myTasksCode);

	    	$('#deleteMyTask').fadeIn(300); 
	    	$('#deleteMyTask').css('display','block');
	    	
		}
	    
	    //업데이트하기
	    function updateTask(myTasksCode, myTaskscontents,myTasksstartDate,myTasksstartTime) {
			var myTasksCode = myTasksCode;
			var myTaskscontents = myTaskscontents;
			var myTasksstartDate = myTasksstartDate;
	    	var myTasksstartTime = myTasksstartTime.substring(0,5);
	    	$('.updateMyTaskName').val(myTaskscontents);
	    	$('.updateMyTaskStartDate').val(myTasksstartDate);
	    	$('.updateMyTaskStartTime').val(myTasksstartTime);
	    	$('.updateMyTasksCode').val(myTasksCode);
			
	    	$('#updateMyTask').fadeIn(300); 
	    	$('#updateMyTask').css('display','block');
	    	
		}
	    
	    //테스크 추가하기
	    function newTask() {
	    	
	    	$('#insertMyTask').fadeIn(300); 
	    	$('#insertMyTask').css('display','block');
		}
	    
	    //모달닫기 
	    $(document).on('click', '.myTaskUpdateClose', function(){
	    	$('#updateMyTask').css('display','none');
	    });
	    
	    $(document).on('click', '.myTaskInsertClose', function(){
	    	$('#insertMyTask').css('display','none');
	    });
	    
	    $(document).on('click', '.myTaskDeleteClose', function(){
	    	$('#deleteMyTask').css('display','none');
	    });
	    $(document).on('click', '.myTaskShareClose', function(){
	    	$('#shareMyTask').css('display','none');
	    });

	    
	  	//드롭다운
	    $(document).on('click', '.dropdown', function(){
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
	
	    $(document).on('focusout', '.dropdown', function(){
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
	
	    $(document).on('click', '.dropdown .dropdown-menu li', function(){
			$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
		});
	
	    $(document).on('click', '.dropdown-menu li', function(){
				var input = $(this).parents('.dropdown').find('input').val()
		});
	
	    //calendar 그리기
	    function drawCalendar() {
	    	
	        var setTableHTML = "";
	        setTableHTML+='<table class="calendar" style="table-layout: fixed">';
	        setTableHTML+='<tr id="cal-tr"><th style="color: #a30000;">Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th style="color:#1e019e;">Sat</th></tr>';
	        for(var i=0;i<6;i++){
	            setTableHTML+='<tr id="cal-daytr" height="120">';
	            for(var j=0;j<7;j++){
	                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:10%">';
	                setTableHTML+='    <div class="cal-day" style="width:10%; "></div>';
	                setTableHTML+='    <div class="cal-schedule" style="width:10%"></div>';
	                setTableHTML+='</td>';
	            }
	            setTableHTML+='</tr>';
	        }
	        setTableHTML+='</table>';
	        $("#cal_tab").html(setTableHTML);
	        
	    }
	
	    //날짜 초기화
	    function initDate() {
	    	
	        $tdDay = $("td div.cal-day")
	        $tdSche = $("td div.cal-schedule")
	        dayCount = 0;
	        today = new Date();
	        year = today.getFullYear();
	        month = (today.getMonth()+1);
	        firstDay = new Date(year,month-1,1);
	        lastDay = new Date(year,month,0);
	        
	        switch(today.getDay()){
	        case 1 : day ='월요일'; break;
	        case 2 : day ='화요일'; break;
	        case 3 : day ='수요일'; break;
	        case 4 : day ='목요일'; break;
	        case 5 : day ='금요일'; break;
	        case 6 : day ='토요일'; break;
	        case 0 : day ='일요일'; break;
	        }
	    }
	
	    //calendar 날짜표시
	    function drawDays() {
	        $("#cal_top_year").text(year);
	        $("#cal_top_month").text(month);
	        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
	            $tdDay.eq(i).text(++dayCount);
	            $tdDay.eq(i).attr('id', (year + '_' + month + '_' + dayCount));
	            
	        }
	        for(var i=0;i<42;i+=7) {
	            $tdDay.eq(i).css("color","#a30000");
	        }
	        for(var i=6;i<42;i+=7) {
	            $tdDay.eq(i).css("color","#1e019e");
	        }
	        
	        	
	    }
	    
	    //스케줄표시
	    function drawSche(sendShareYN) {
	    	
	    	var temp;
	    	var sendShareYN = sendShareYN;
	    	switch(sendShareYN){
	    	case 'Y' : temp='N'; break;
	    	case 'N' : temp='Y'; break;
	    	case 'A' : temp='A'; break;
	    	}
	    	
	    	$.ajax({
	    		type : 'post',
				url: "MyTaskCalendar.mt",
				data : {
				},
				dataType: 'json',
				success : function(data) {
					
					$tdSche.children().remove();
					$('#todayDay').html(today.getFullYear()+'년 '+ (today.getMonth()+1) +'월 '+today.getDate()+'일');
					$('#todayDate').html(day);

					//날짜 꺼내기
					for(var i=0; i<data.myTaskCalendar.length; i++){
						
						if(data.myTaskCalendar[i].myTasksShareYN != temp){
							
							var startDateArr = data.myTaskCalendar[i].myTasksstartDate.split('-');
							var startYear = Number(startDateArr[0]);
							var startMonth = Number(startDateArr[1]);
							var startDate = Number(startDateArr[2]);
							
							//시작일자 캘린더에 넣어주기
							if($('#cal_top_month').html() == startMonth){
							    var myTaskscontents = ('<li style="list-style-type:none" draggable="true"><input type=checkbox id="'+data.myTaskCalendar[i].myTasksCode 
							    		+'" onclick="chkTask('+data.myTaskCalendar[i].myTasksCode+')" class="chkTask"><label for="'
							    		+ data.myTaskCalendar[i].myTasksCode + '" id="label' + data.myTaskCalendar[i].myTasksCode+'">' 
							    		+ data.myTaskCalendar[i].myTaskscontents + '</label></li>');
							    
								$tdSche.eq(startDate + firstDay.getDay()-1).append(myTaskscontents);
							}
							
							//TODO 체크하기
							var myTasksTodoYN = data.myTaskCalendar[i].myTasksTodoYN;
							if(myTasksTodoYN =='Y'){
								$('#'+data.myTaskCalendar[i].myTasksCode).prop("checked", true);
							}
						
						}
						
					}
					
					
				},
				error : function () {
					console.log('스케줄 불러오기 실패함');
				},
				beforeSend : function(){
			        $('.wrap-loading').removeClass('display-none');
				},
				complete : function(){
				    $('.wrap-loading').addClass('display-none');
				}
	    		
	    	})
	    	
	    	
		}
	    
	    
	    // todo
	    var count1 = 0;
	    function drawTodo(todoType) {
	    	
	    	var todoType = todoType;
	    	var todoTitle = '오늘 해야 할 업무 ';
	    	
	    	//버튼이미지 바꿔주기
	    	if(count1 != 0){
		    	if(todoType =='A'){
			    	document.getElementById('switchToDo').src="/agile/resources/icon/indiv/icon_switch_all.png";
			    	document.getElementById("switchToDo").setAttribute("onclick", "drawTodo('T')");
			    	todoTitle = '전체 미완료 업무 ';
		    	}else if (todoType=='T'){
			    	document.getElementById('switchToDo').src="/agile/resources/icon/indiv/icon_switch_today.png";
			    	document.getElementById("switchToDo").setAttribute("onclick", "drawTodo('A')");
			    	todoTitle = '오늘 해야 할 업무 ';
		    	}
	    	}
	    	
	    	count1++;
	    	
		      $.ajax({
		    		type : 'post',
					url: "MyTaskListReset.mt",
					data : {
					},
					dataType: 'json',
					success : function(data) {  
						
						var thingsTodo = 0;
						var forMaxValue;
						
						//todolist
						$('.checkListTodayTable').children().remove();
						var checklistcontent;
						checklistcontent += '<tbody>';
						
						if(todoType =='T'){
							forMaxValue = (data.myTaskList.length-${future}-1);
						}else if(todoType == 'A'){
							forMaxValue = data.myTaskList.length;
						}
						
						for(var i=0; i<forMaxValue; i++) {
							
							if(data.myTaskList[i].myTasksTodoYN == 'N'){
								var myTaskscontents = "'" + data.myTaskList[i].myTaskscontents + "'";
								var myTasksstartDate = "'" + data.myTaskList[i].myTasksstartDate + "'";
								var myTasksstartTime = "'" + data.myTaskList[i].myTasksstartTime + "'";
								
								
								checklistcontent += ('<tr><td class="toDoCheckBox"><input id="' + data.myTaskList[i].myTasksCode + '" type="checkbox" onclick="chkTask('+data.myTaskList[i].myTasksCode+')"></td><td class="toDoToday"><label for="'
													+  data.myTaskList[i].myTasksCode + '" id="label2'+ data.myTaskList[i].myTasksCode +' " >' + data.myTaskList[i].myTaskscontents +
													'</label></td><td class="more2"><div class="dropdown"><div class="select"><span id="more">...</span><i class="fa fa-chevron-left"></i>'+
								                    '</div><ul class="dropdown-menu"><li id="updateTask" onclick="updateTask(' + data.myTaskList[i].myTasksCode + ',' + myTaskscontents + ',' 
								                    		+ myTasksstartDate +',' + myTasksstartTime + ');">수정</li><li id="taskShare" onclick="shareTask('+ data.myTaskList[i].myTasksCode + ',' + myTaskscontents +')">공유</li>'
								                    		+'<li id="taskDelete" onclick="deleteTask('+ data.myTaskList[i].myTasksCode + ',' + myTaskscontents +')">삭제</li></ul></div></td></tr>');
								thingsTodo++;
							}
						}
						checklistcontent += '</tbody>';
						$('.checkListTodayTable').append(checklistcontent);
						
						//미해결업무 몇개남음
						$('#thingsTodo').html(todoTitle + thingsTodo + '개 남음');
						
					},
					error : function () {
						console.log('새로고침 실패');
					},
					beforeSend : function(){
				        $('.wrap-loading').removeClass('display-none');
					},
					complete : function(){
					    $('.wrap-loading').addClass('display-none');
					}
		      }); 
		}
	    

		//체크박스
		function chkTask(taskCode) {
			var myTasksCode = Number(taskCode);
			var taskContent = $("#label"+ myTasksCode).html();
			var myTasksTodoYN;
			
			if(taskContent != null){
				
		      if($("#"+ myTasksCode).is(":checked")){
		    	  myTasksTodoYN = 'Y';
		          alert("[" + taskContent + "] 업무를 끝냈습니다!!😁😁" );
		      }else{
		    	  myTasksTodoYN = 'N';
		          alert("[" + taskContent + "] 업무를 끝내지 못했습니다😂  ");
		      }
		   
		      $.ajax({
		    		type : 'post',
					url: "UpdateMyTaskYN.mt",
					data : {
						myTasksCode : myTasksCode,
						myTasksTodoYN : myTasksTodoYN
					},
					dataType: 'json',
					success : function(data) {   
						drawTodo('T');
					},
					error : function () {
						console.log('스케줄 불러오기 실패함');
					},
					beforeSend : function(){
				        $('.wrap-loading').removeClass('display-none');
					},
					complete : function(){
					    $('.wrap-loading').addClass('display-none');
					}
		      }); 
		      
			}else{
				alert('현재 월의 업무가 아닙니다! 해당 업무의 월로 이동하여 다시 시도하세요!');
				$("#"+ myTasksCode).prop('checked', false);
			}  
		}
		
		//공유된 업무 내역 
		function drawShare() {
			  $.ajax({
		    		type : 'post',
					url: "shareMyTasks.mt",
					data : {
					},
					dataType: 'json',
					success : function(data) {   
						
						var shareDoneTable;
						var shareToDoTable;
						var shareNotTable;
						
						for(var i=0; i<data.sharedTaskList.length; i++){
							
							var startDateArr = data.sharedTaskList[i].myTaskShare.mytasksShareDate.split('-');
							console.log(startDateArr);
							var startYear = Number(startDateArr[0]);
							var startMonth = Number(startDateArr[1]);
							var startDate = Number(startDateArr[2]);
							if((startMonth==(today.getMonth()+1))&&(startDate==today.getDate())){
								
								var shareType = data.sharedTaskList[i].myTaskShare.mytasksShareType;
								switch(shareType){
								case '01' :  
									shareDoneTable += ('<tr><td class="shareTableTd tooltip">'+ data.sharedTaskList[i].myTaskscontents 
											 +'<span class="tooltiptext">이 일정이 공유된 프로젝트는 <br><b>[' + data.sharedTaskList[i].project.projectName + '] </b>입니다.<br>' 
					                         + "■ 일정 시작일 : " + data.sharedTaskList[i].myTasksstartDate + "<br>"		                       
					                         + "■ 일정 종료일 : " + data.sharedTaskList[i].myTasksendDate 
					                         + '</span></td></tr>');
									console.log('한일');  break;
								case '02' : 
									shareToDoTable += ('<tr><td class="shareTableTd tooltip">'+ data.sharedTaskList[i].myTaskscontents 
											 +'<span class="tooltiptext">이 일정이 공유된 프로젝트는 <br><b>[' + data.sharedTaskList[i].project.projectName + '] </b>입니다.<br>' 
					                         + "■ 일정 시작일 : " + data.sharedTaskList[i].myTasksstartDate + "<br>"
					                         + "■ 일정 종료일 : " + data.sharedTaskList[i].myTasksendDate 
					                         + '</span></td></tr>');
									console.log('할일'); break;
								case '03' : 
									shareNotTable += ('<tr><td class="shareTableTd tooltip">'+ data.sharedTaskList[i].myTaskscontents 
											 +'<span class="tooltiptext">이 일정이 공유된 프로젝트는 <br><b>[' + data.sharedTaskList[i].project.projectName + '] </b>입니다.<br>' 
					                         + "■ 일정 시작일 : " + data.sharedTaskList[i].myTasksstartDate + "<br>"
					                         + "■ 일정 종료일 : " + data.sharedTaskList[i].myTasksendDate 
					                         + '</span></td></tr>');
									console.log('못한일'); break;
								}
							}
						}
						
						$('.shareDoneTable').html(shareDoneTable);
						$('.shareTodoTable').html(shareToDoTable);
						$('.shareNotTable').html(shareNotTable);
						
					},
					error : function () {
						console.log('공유내역 불러오기 실패함');
					}
			
			  });
			
		}
	
	    //calendar 월 이동 -이전
	    function movePrevMonth() {
	    	month--;
	        if(month<=0) {
	            month=12;
	            year--;
	        }
	        if(month<10) {
	            month=String("0"+month);
	        }
	        getNewInfo();
	    }
		
	    //calendar 월 이동 -이후
	    function moveNextMonth() {
	    	month++;
	        if(month>12) {
	            month=1;
	            year++;
	        }
	
	        if(month<10) {
	            month=String("0"+month);
	        }
	        getNewInfo();
	    }
		
	    //새로고침
	    function getNewInfo() {
	    	
	        for(var i=0;i<42;i++) {
	            $tdDay.eq(i).text("");
	            $tdSche.eq(i).text("");
	        }
	        dayCount=0;
	        firstDay = new Date(year,month-1,1);
	        lastDay = new Date(year,month,0);
	        drawDays();
	        drawSche();
	    }

    </script>

</body>
</html>