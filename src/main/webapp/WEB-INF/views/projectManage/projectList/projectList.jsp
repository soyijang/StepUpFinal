<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
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
									<div class="contentBox1-content-table-tr-td">
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
								<th>프로젝트 관리</th>
							</tr>
						</thead>
						<tbody>
							<!-- 프로젝트 관련정보 반복문 -->
							<!-- begin, end, step 생략시 collection 크기만큼 반복  -->
							<c:forEach var="item2" items="${selectedProjectHistoryList}">
								<tr>
									<td>
										<div class="">
											${item2.project.projectName}
										</div>
									</td>
									<td>
										<div class="project-participant"></div> 
										<div class="project-participant"></div>
										<div class="project-participant"></div>
										<div class="project-participant"></div>
									</td>
									<td><div class="project-participant-add"><img class="icon_user_plus" src="/agile/resources/icon/common/icon_user_plus.png"></div></td>
									<!-- 시작일과 시작 시간 -->
									<td>
										${item2.projectStartDate}
										<input type="hidden" class="projectStartDate" value="${item2.projectStartDate}">
										<input type="hidden" class="projectStartTime" value="${item2.projectStartTime}">
									</td>
									<!-- 종료일과 종료 시간 -->
									<td>
										${item2.projectEndDate}
										<input type="hidden" class="projectEndDate" value="${item2.projectEndDate}">
										<input type="hidden" class="projectEndTime" value="${item2.projectEndTime}">
									<td>
								            <!--  <div class="incompleteBox">미완료 ${item.projectHistory.projectStartDate} - ${item.projectHistory.projectEndDate}</div> -->
								            <!-- <div class="incompleteBox">미진행</div>  -->
								            <!-- <div class="completeBox">완료</div> -->
								        <div class="projectIngStatus"></div>
<!-- 								        <div class="proceedingBox">진행중</div> -->
									</td>
									<td>
										<div class="project-master"></div>
									</td>
									<td><div class="deleteBtn">· · ·</div></td>
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
		     	<tr><td colspan="2">이름<div class="red-star">*</div></td></tr>
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
		     		<div><button class="modal1-ok">문의</button><button class="modal1-close">취소</button></div>
	     		</td>
	     	</tr>
     </table>
   </div>
 </div>
<!-- 프로젝트 삭제 모달-------------------------------------------------------->

    
    
    
    

<script>


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





/* 프로젝트 삭제 모달창 관련 스크립트 ----------------------------------------------*/
/* 몇번째 삭제 버튼인지 확인해야함 */
//Get the modal
var modal1 = document.getElementById("myModal1");

//Get the button that opens the modal
/* 삭제 요청할 버튼  */
var btn1 = document.getElementsByClassName("deleteBtn")[0];

//Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("modal1-close")[0];

//When the user clicks on the button, open the modal
btn1.onclick = function() {
    $(modal1).fadeIn(300); 
    $(modal1).css('display','block');
}

//When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    $(modal1).css('display','none');
}
/* 프로젝트 삭제 모달창 관련 스크립트 ----------------------------------------------*/







/* 오늘 날짜 계산 하여 프로젝트 진행상태 계산  --------------------------------------------*/
	/* 오늘 날짜  */
	var sysdate = $('#sysdate').val();
	var systime = $('#systime').val();
	
	/* 조회한 projectList 의 개수 구하기 = table id=contentBox2-content-table 의 tr 개수 구하기 및 확인*/
	var listLength = $('#contentBox2-content-table tbody tr').length;
	console.log("가져온 Project list 개수 " + listLength);
	
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
		console.log(sysdate);
		console.log(i + "번째" + projectEndDate[i].value);
		
		//현재 날짜가 프로젝트 종료일보다 크다면 프로젝트 진행 상태가 완료(종료)상태로 뜸 ( task 미진행 여부는 )
		//자바스크립트 class 속성 추가 및 html 내용 추가
		if($('#sysdate').val() > projectEndDate[i].value){
			console.log($('#sysdate').val() + " > " + projectEndDate[i].value);
			projectIngStatus[i].innerHTML = "완료";
			projectIngStatus[i].classList.add("projectIngStatus","completeBox");
		}else{
			//종료일이 아직 남아있다면 진행중 OR 미진행 구분하기
			
			//( 현재 날짜와 시작일 비교 )
			//프로젝트가 아직 시작하지 않았다면 
			if($('#sysdate').val() < projectStartDate[i].value && $('#systime').val() < projectStartTime[i].value){
				projectIngStatus[i].innerHTML = "미진행";
				projectIngStatus[i].classList.add("projectIngStatus","incompleteBox");
				
			}else{
				//프로젝트가 시작했으나 아직 종료되지 않음 -> 진행중
				projectIngStatus[i].innerHTML = "진행중";
				projectIngStatus[i].classList.add("projectIngStatus","proceedingBox");
			}
		}
	}
/* 오늘 날짜 계산 하여 프로젝트 진행상태 계산  --------------------------------------------*/	


</script>
   
</body>
</html>