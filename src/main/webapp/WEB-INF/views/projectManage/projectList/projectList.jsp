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
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectList/projectList.css">
    <!-- 버튼 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

  <!-- 왼쪽 메뉴바 필요 없는 경우 id를 content 대신에 content-nav-only 로 변경하고 nav.jsp include  -->
  <!--%@ include file="../../common/menubar.jsp"--> 
  <%@ include file="../../common/nav.jsp" %>
   <div id="content-nav-only">
   <!-- div id="content-nav-only"-->
   
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
           <div id="menuTitle">전체 프로젝트</div>
       </div>

       <!-- content 영역 -->
       <div id="contentBox">
			<div id="contentBox1">
				<div id="contentBox1-title">최근 진행한 프로젝트</div>
				<div id="contentBox1-content">
					<table id="contentBox1-content-table">
						<tr>
							<!-- 프로젝트 리스트 -->
							<c:forEach var="item" items="${selectedProjectHistoryList}" begin="0" end="3" step="1" varStatus="status">
								<td>
									<div class="contentBox1-content-table-tr-td" id="project-top-list-code${item.project.projectCode}"
									onclick="projectClick(${item.project.projectCode})">
										<div class="left-padding-gray${status.index}">
											<div class="project-name">
												${item.project.projectName}
											</div>
											<div class="project-participants">
												참여인원<div class="pink-btn">${item.project.projectParticipantCnt}</div>
											</div>
											<div class="project-progress-rate">
												진행률 <div class="pink-btn">${item.project.projectProceedingRate}%</div>
											</div>
										</div>
									</div>
								</td>
							</c:forEach>	
							<!-- 프로젝트 추가 -->
							<td>
								<div class="contentBox1-content-table-tr-td pointer createBtn">
									<div class="new-project-add">
										<img class="icon_circle_plus_red" src="/agile/resources/icon/common/icon_circle_plus_red.png">
										<div class="new-project-add-text">새 프로젝트 추가</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
       		<div id="contentBox2">
       			<span id="contentBox2-title">전체 프로젝트 목록</span>
       			<div id="contentBox2-btn" class="createBtn">
       				<div class="icon_file_plus">
       					<img id="icon_file_plus" src="/agile/resources/icon/common/icon_file_plus.png">
       				</div>
       				새 프로젝트 추가
       			</div>
       			<!-- 오늘 날짜 now 변수에 담아두기 -->
				<div id="contentBox2-content"><input type="hidden" value="<c:set var="now" value="<%=new java.util.Date()%>"/>">
				<!-- 날짜 -->
				<input type="hidden" id="sysdate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
				<!-- 시간 -->
				<input type="hidden" id="systime" value="<fmt:formatDate value="${now}" pattern="hh:mm:ss"/>">
					<table id="contentBox2-content-table">
						<thead>
							<tr>
								<th>프로젝트명</th>
								<th colspan="2">프로젝트 참여자</th>
								<th>프로젝트 시작일</th>
								<th>프로젝트 종료일</th>
								<th>프로젝트 진행상태</th>
								<th>프로젝트 마스터</th>
								<th>설정</th>
							</tr>
						</thead>
						<tbody>
							<!-- 프로젝트 관련정보 반복문 -->
							<!-- begin, end, step 생략시 collection 크기만큼 반복  -->
							<!-- < var="item2" items="${selectedProjectHistoryList}" varStatus="status"> -->
							<c:forEach var="i" begin="0" end="${fn:length(selectedProjectHistoryList)-1}">
								<tr>
									<td id="project-list-code${selectedProjectHistoryList.get(i).project.projectCode}"
									onclick="projectClick(${selectedProjectHistoryList.get(i).project.projectCode})">
										<div>
											${selectedProjectHistoryList.get(i).project.projectName}
											<input type="hidden" class="miPojectCode${i}" value="${selectedProjectHistoryList.get(i).project.projectCode}">
										</div>
									</td>
									
									<td>
									<!-- 프로젝트 코드 같은거 찾아서 멤버 넣어주기 -->
										<c:set var="num" value="0"/><!-- color class 이름 변경해줄 변수 하나 만들어주기 -->
										<c:forEach var="j" begin="0" end="${fn:length(userProjectList)-1}">
											<c:if test="${userProjectList.get(j).project.projectCode == selectedProjectHistoryList.get(i).project.projectCode}">
												<!-- 이름 두자리만 가져오기 -->
												<!-- <div class="project-participant">${userProjectList.get(j).member.userName}</div>  -->
												<div class="project-participant color${num}">
													${fn:substring(userProjectList.get(j).member.userName, fn:length(userProjectList.get(j).member.userName)-2, fn:length(userProjectList.get(j).member.userName))}
													<!-- color class 이름 변경해줄 변수 값 1 증가시키기 -->
													<c:set var="num" value="${num+1}"/>
												</div> 
											</c:if>
										</c:forEach>
									</td>
									
									<td><div class="project-participant-add"><img class="icon_user_plus" src="/agile/resources/icon/common/icon_user_plus.png"></div></td>
									<!-- 시작일과 시작 시간 -->
									<td>
										${selectedProjectHistoryList.get(i).projectStartDate}
										<input type="hidden" class="projectStartDate" value="${selectedProjectHistoryList.get(i).projectStartDate}">
										<input type="hidden" class="projectStartTime" value="${selectedProjectHistoryList.get(i).projectStartTime}">
									</td>
									<!-- 종료일과 종료 시간 -->
									<td>
										${selectedProjectHistoryList.get(i).projectEndDate}
										<input type="hidden" class="projectEndDate" value="${selectedProjectHistoryList.get(i).projectEndDate}">
										<input type="hidden" class="projectEndTime" value="${selectedProjectHistoryList.get(i).projectEndTime}">
									<td>
								            <!--  <div class="incompleteBox">미완료 ${item.projectHistory.projectStartDate} - ${item.projectHistory.projectEndDate}</div> -->
								            <!-- <div class="incompleteBox">미진행</div>  -->
								            <!-- <div class="completeBox">완료</div> -->
								        <div class="projectIngStatus"></div>
<!-- 								        <div class="proceedingBox">진행중</div> -->
									</td>
									<!-- 프로젝트 마스터 -->
									<td>
										<c:forEach var="k" begin="0" end="${fn:length(userProjectList)-1}">
											<c:if test="${userProjectList.get(k).project.projectCode == selectedProjectHistoryList.get(i).project.projectCode && userProjectList.get(k).userProjectAuthority == '01'}">
												<!-- 권한 확인한 후 01번 마스터 권한인 경우에만 이름 두자리만 가져오기 -->
												<div class="project-master color999">
													${fn:substring(userProjectList.get(k).member.userName, fn:length(userProjectList.get(k).member.userName)-2, fn:length(userProjectList.get(k).member.userName))}
													<!-- color class 이름 변경해줄 변수 값 1 증가시키기 -->
												</div> 
											</c:if>
										</c:forEach>										
										
										
										
										
										
									</td>
									<!-- <td><div class="deleteBtn">· · ·</div></td> -->
									<!-- 드래그 앤 드롭 ---------------------->    
									<td><div class="dropdown"><!--  id="${status.index}" -->
											<div class="select">
												<span class="user-list">· · ·</span>
											 </div>
											 <input type="hidden" name="optionType" value="">
											 <ul class="dropdown-menu">
											 		<!-- 프로젝트 코드랑 index 같이 넣어줌 : 모달 띄울때 몇번째 class인지 번호 사용하기 위해서 -->	
											 		<li class="updateBtn" onclick="updateProjectClick(${selectedProjectHistoryList.get(i).project.projectCode},${i})">수정</li>
											     	<li class="deleteBtn">삭제</li>
											 </ul>
										</div>
									</td>	 
								</tr>
							</c:forEach>	
						</tbody>
					</table>
					<div></div>
				</div>
       		</div>
       </div>
    </div>
    
<!-- 모달창 관련 html ------------------------------------------------------->


<!-- 프로젝트 생성 모달-------------------------------------------------------->

 <div id="myModal0" class="modal0">
   <!-- Modal content -->
   <div class="modal-content0">
   
     <p align="left" class ="modaltitle0" style="font-size:30px;">새 프로젝트</p>
     	<form action="insert.pj" method="post">
	     <table align="center" class="modalTable0">
	     <!-- 내용-->
		     	<tr><td colspan="2">프로젝트명<div class="red-star">*</div></td></tr>
		     	<tr><td colspan="2"><input type="text" name="projectName"/></td></tr>
		     	<tr>
		     		<td>프로젝트 시작일자<div class="red-star">*</div></td>
		     		<td>프로젝트 시작시간<div class="red-star">*</div></td>
		     	</tr>
		     	<tr>
		     		<td><input type="date" name="projectStartDate"></td>
		     		<td><input type="time" name="projectStartTime"></td>
		     	</tr>
		     	<tr>
		     		<td>프로젝트 종료일자<div class="red-star">*</div></td>
		     		<td>프로젝트 종료시간<div class="red-star">*</div></td>
		     	</tr>
		     	<tr>
		     		<td><input type="date" name="projectEndDate"></td>
		     		<td><input type="time" name="projectEndTime"></td>
		     	</tr>
		     	<tr><td>프로젝트 소개<div class="red-star">*</div></td></tr>
		     	<tr>
		     		<td colspan="2">
		     		<input type="text" name="projectIntro"/>
		     		<div class="red-star">* 프로젝트 생성시 프로젝트 스크럼 마스터 권한이 부여 됩니다.</div>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td colspan="2">
			     		<div class="btn-box"><input type="submit" class="rectangle6 modal0-ok" value="추가"><input type="reset" class="rectangle7 modal0-close" value="닫기"/></div>
		     		</td>
		     	</tr>
	     </table>
	   </form>
   </div>
 </div>

 
 
<!-- 프로젝트 생성 모달-------------------------------------------------------->


<!-- 프로젝트 삭제 모달-------------------------------------------------------->

 <div id="myModal1" class="modal1">
   <!-- Modal content -->
   <div class="modal-content1">
     <p align="left" class ="modaltitle" style="font-size:30px;"><!-- 제목 --></p>
     <table align="center" class="modalTable1">
     <!-- 내용-->
	     	<tr>
	     		<td>
	     			<div class="delete-modal-content">삭제 권한이 없는 사용자입니다. 관리자에게 문의하세요.</div>
		     		<div><button class="modal1-ok rectangle6">문의</button><button class="modal1-close rectangle7">취소</button></div>
	     		</td>
	     	</tr>
     </table>
   </div>
 </div>
<!-- 프로젝트 삭제 모달-------------------------------------------------------->

    


<!-- 프로젝트 수정 모달-------------------------------------------------------->

 <div id="myModal2" class="modal2">
   <!-- Modal content -->
   <div class="modal-content2">
   
     <p align="left" class ="modaltitle2" style="font-size:30px;">프로젝트 수정</p>
     	<form action="update.pj" method="post">
	     <table align="center" class="modalTable2">
	     <!-- 내용-->
		     	<tr><td colspan="2">프로젝트명<div class="red-star">*</div></td></tr>
		     	<tr><td colspan="2"><input type="text" name="projectName"/></td></tr>
		     	<tr>
		     		<td>프로젝트 시작일자<div class="red-star">*</div></td>
		     		<td>프로젝트 시작시간<div class="red-star">*</div></td>
		     	</tr>
		     	<tr>
		     		<td><input type="date" name="projectStartDate"></td>
		     		<td><input type="time" name="projectStartTime"></td>
		     	</tr>
		     	<tr>
		     		<td>프로젝트 종료일자<div class="red-star">*</div></td>
		     		<td>프로젝트 종료시간<div class="red-star">*</div></td>
		     	</tr>
		     	<tr>
		     		<td><input type="date" name="projectEndDate"></td>
		     		<td><input type="time" name="projectEndTime"></td>
		     	</tr>
		     	<tr><td>프로젝트 소개<div class="red-star">*</div></td></tr>
		     	<tr>
		     		<td colspan="2">
		     		<input type="text" name="projectIntro"/>
		     		<div class="red-star">* 프로젝트 스크럼 마스터만 프로젝트 정보를 수정할 수 있습니다. </div>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td colspan="2">
			     		<div class="btn-box"><input type="submit" class="rectangle6 modal2-ok" value="수정"><input type="reset" class="rectangle7 modal2-close" value="닫기"/></div>
		     		</td>
		     	</tr>
	     </table>
	   </form>
   </div>
 </div>

 
 
<!-- 프로젝트 수정 모달-------------------------------------------------------->

    

<script>
//추가 설정 버튼 드롭다운 ------------------------------------------------------------------------
$('.dropdown').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$('.dropdown').focusout(function() {
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

/* li 태그 클래스 값 input에 담아주기  id > class로 변경 */
$('.dropdown .dropdown-menu li').click(
	function() {
		/* $(this).parents('.dropdown').find('span').text($(this).text()); */
		$(this).parents('.dropdown').find('input').attr('value',$(this).attr('class'));
});
//선택 내용 글자 넣어주는 것 빼기
 $('.dropdown-menu li').click(function() {
		var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
}); 
//추가 설정 버튼 드롭다운 끝----------------------------------------------------------------------


/* 프로젝트 생성 모달창 관련 스크립트 ----------------------------------------------*/
//Get the modal
var modal0 = document.getElementById("myModal0");

//Get the button that opens the modal
/* 모달창 띄워줄 버튼 */
var btn00 = document.getElementsByClassName("createBtn")[0];
var btn01 = document.getElementsByClassName("createBtn")[1];
//Get the <span> element that closes the modal
var span0 = document.getElementsByClassName("modal0-close")[0];

//When the user clicks on the button, open the modal
btn00.onclick = function() {
    $(modal0).fadeIn(300); 
    $(modal0).css('display','block');
}
btn01.onclick = function() {
    $(modal0).fadeIn(300); 
    $(modal0).css('display','block');
}
//When the user clicks on <span> (x), close the modal
span0.onclick = function() {
    $(modal0).css('display','none');
}


//모달창 내용 입력 후 닫기 버튼 클릭시 내용 초기화 해주는 코드
$('.modal0-close').click(function(){
	var i = 0;
	while(i < 6){
 		$('.modalTable0 input')[i].val('');
  		i++;
	};
});
/* 프로젝트 생성 모달창 관련 스크립트 ----------------------------------------------*/




/* $(‘s’).each(function(index,item){ } ) */
/* 선택자로 선택한 요소를 index순번으로 item에 요소 값을 수정시 사용하는 메소드 */
 
/* 프로젝트 삭제 모달창 관련 스크립트 ----------------------------------------------*/
//Get the modal
var modal1 = document.getElementById("myModal1");
var deleteBtn = document.getElementsByClassName("deleteBtn");
var modal1Cclose = document.getElementsByClassName("modal1-close");

for(var i = 0; i < modal1Cclose.length; i++) {
	modal1Cclose[i].onclick = function() {
	    $(modal1).css('display','none');
	}
}

for(var i = 0; i < deleteBtn.length; i++) {
	deleteBtn[i].onclick = function() {
  	    $(modal1).fadeIn(300); 
  	    $(modal1).css('display','block');
  	}
}
/* 프로젝트 삭제 모달창 관련 스크립트 ----------------------------------------------*/



/* 프로젝트 수정 모달창 관련 스크립트 ----------------------------------------------------------------------------------------------------------------*/

/* 업데이트할 프로젝트의 수정 버튼 클릭시 함수 실행 */
function updateProjectClick(c, i) {
	// 수정 모달 띄우기 
    $("#myModal2").fadeIn(300); 
    $("#myModal2").css('display','block');
    
	//클릭한 프로젝트의 코드 (수정할 것이라 필요함)
	var projectCode = c;
	console.log("projectCode : " + projectCode);	
	
	
	
	
    //닫기 버튼 클릭시 수정 모달 닫아주기
    var span2 = document.getElementsByClassName("modal2-close")[i];
    span2.onclick = function() {
    	//모달 닫고
	    $("#myModal2").css('display','none');
	    //input 상자 초기화
	    for(var j = 0 ; j < 6; j++){
	    	$('.modalTable2 input')[j].val('');
	    }
	}
}	


/* 프로젝트 수정 모달창 관련 스크립트 끝 ----------------------------------------------------------------------------------------------------------------*/





/* 오늘 날짜 계산 하여 프로젝트 진행상태 계산  --------------------------------------------*/
	/* 오늘 날짜  */
	var sysdate = $('#sysdate').val();
	var systime = $('#systime').val();
	
	/* 조회한 projectList 의 개수 구하기 = table id=contentBox2-content-table 의 tr 개수 구하기 및 확인*/
	var listLength = $('#contentBox2-content-table tbody tr').length;
	//console.log("가져온 Project list 개수 " + listLength);
	
	//projectEndDate, projectEndTime, projectStartDate, projectStartTime 담을 배열 만들기 ( 배열 크기는 조회한 projectList  개수만큼 )
	var projectEndDate = new Array(listLength);
	var projectEndTime = new Array(listLength);
	var projectStartDate = new Array(listLength);
	var projectStartTime = new Array(listLength);
	projectEndDate =  $('.projectEndDate').get();
	projectEndTime =  $('.projectEndTime').get();
	projectStartDate =  $('.projectStartDate').get();
	projectStartTime =  $('.projectStartTime').get();
	
	//프로젝트 진행 상태에따라서 다르게 보여줄 div 가져오기
	//자바스크립트 clasName 으로 요소 가져오기
	var projectIngStatus = document.getElementsByClassName('projectIngStatus');
	//projectIngStatus = $('.projectIngStatus').get();

	//현재 날짜와 프로젝트 종료일 비교하기
	for(var i = 0; i < listLength; i++){
		
		//현재 날짜가 프로젝트 종료일보다 크다면 프로젝트 진행 상태가 완료(종료)상태로 뜸 ( task 미진행 여부는 )
		//자바스크립트 class 속성 추가 및 html 내용 추가
		if($('#sysdate').val() > projectEndDate[i].value){
			projectIngStatus[i].innerHTML = "완료";
			projectIngStatus[i].classList.add("projectIngStatus","completeBox");
		}else{
			//종료일이 아직 남아있다면 진행중 OR 미진행 구분하기
			
			//( 현재 날짜와 시작일 비교 )
			//프로젝트가 아직 시작하지 않았다면 
			if($('#sysdate').val() < projectStartDate[i].value){
				projectIngStatus[i].innerHTML = "미진행";
				projectIngStatus[i].classList.add("projectIngStatus","incompleteBox");
				
			}else if($('#sysdate').val() > projectStartDate[i].value){
				//프로젝트가 시작했으나 아직 종료되지 않음 -> 진행중
				projectIngStatus[i].innerHTML = "진행중";
				projectIngStatus[i].classList.add("projectIngStatus","proceedingBox");
				
			}else if(($('#sysdate').val() == projectStartDate[i].value) && ($('#systime').val() >= projectStartTime[i].value)){
				projectIngStatus[i].innerHTML = "진행중";
				projectIngStatus[i].classList.add("projectIngStatus","proceedingBox");
			}else if(($('#sysdate').val() == projectStartDate[i].value) && ($('#systime').val() < projectStartTime[i].value)){
				projectIngStatus[i].innerHTML = "미진행";
				projectIngStatus[i].classList.add("projectIngStatus","incompleteBox");
			}
		}
	}
/* 오늘 날짜 계산 하여 프로젝트 진행상태 계산  --------------------------------------------*/	

/* 클릭한 프로젝트 코드 받아서 페이지 넘겨주기 ----------------------------------------------------*/	
 function projectClick(c) {
	//클릭한 프로젝트의 코드 
	var projectCode = c;
	//클릭한 것 출력
	console.log(projectCode);	
/* 	$.ajax({
		type: "post",
		url: "showTaskBoard.tb",
		data : {
			projectCode : projectCode
		},
		dataType: 'json',
		success : function(data) {
			
		},
		error : function(data) {
			
		} 
	}); */
	
	
	
}


/* 클릭한 프로젝트 코드 받아서 페이지 넘겨주기----------------------------------------------------*/

</script>
   
</body>
</html>