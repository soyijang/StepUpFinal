<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/sprintBacklog.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/dropdown.css">

</head>
<body >
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />

	<%@ include file="../common/menubar.jsp"%>
	<div id="content">
		<!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
		<div id="contentTitle">
			<div id="projectTitle2"><a href="showProjectMain.pj">🚀내 프로젝트 </a> /
			<c:if test="${not empty sprintList}">
				<input type="hidden" id="clickName" value="${sprintList.get(0).sprintName }">
				<input type="hidden" id="clickSprintCode" value="${sprintList.get(0).sprintCode}">
				<c id="projectName"><c:out value="${ sprintList.get(0).project.projectName }" /></c>
			</c:if>
			<c:if test="${empty sprintList}">
				<c:out value="${ sessionScope.projectName }"/>
			</c:if>
			</div>
			<div id="menuTitle">ProjectBacklog</div>
		</div>

		<!-- 상단검색,팀원 -->
		<div id="topArea">
			<!-- 검색 -->
			<div id="searchSprint">
				<input type="text" id="sprintName" onkeyup="searchSprint();" placeholder="Search or jump to ..." autocomplete="off">
				
			</div>

			<div></div>
		</div>

		<!-- 아래쪽영역 -->

		<div id="bottomArea">
			<!-- 좌측영역 -->
			<div id="sprint">
				<div id="ListState">
					<button id="rectangle2" class="btnIng">진행/예정</button>
					<button id="rectangle3" class="btnFin">종료</button>
				</div>
				
				<!-- 진행중인 목록 -->
				<div id="sprintList" class="sprintListIng">
					<table id="sprintListIngTable">
						<c:if test="${not empty sprintList}">
						<c:forEach var="i" begin="0" end="${fn:length(sprintList)-1}">
							<tbody class="sprinttbody" id="tbody${sprintList.get(i).sprintCode}"
								onclick="tbodyClick(${sprintList.get(i).sprintCode},'${ sprintList.get(i).sprintName }')">
								<c:if test="${sprintList.get(i).sprintType != '03'}">
									<tr>
										<td id="progressPercent${i}" class="progressPercent" rowspan="2">${ sprintList.get(i).sprintTaskCount }%</td>
										<td class="sprintName" colspan="2"><c:out value="${ sprintList.get(i).sprintName }" /></td>
									</tr>
									<tr>
										<td class="progressLine" colspan="2">
										<progress value="${ sprintList.get(i).sprintTaskCount }" max="100"></progress>
										</td>
										<td><input type="hidden" name="sendSprintCode" id="sendSprintCode" value="${sprintList.get(i).sprint.sprintCode}"></td>
									</tr>
								</c:if>
							</tbody>
						</c:forEach>
						</c:if>
						<c:if test="${empty sprintList}">
							<p style="font-size: small;"><br><br><c:out value="${ sessionScope.projectName }"/> 프로젝트에 <br>진행중인 스프린트가 없습니다!</p>
						</c:if>
					</table>
				</div>
				
				<!-- 종료된 목록 -->
				<div id="sprintList" class="sprintListFin" style="display: none;">
					<table id="sprintListFinTable">
						<c:if test="${not empty sprintList}">
						<c:forEach var="i" begin="0" end="${fn:length(sprintList)-1}">
							<tbody class="sprinttbody" id="tbody${sprintList.get(i).sprintCode}"
								onclick="tbodyClick(${sprintList.get(i).sprintCode},'${ sprintList.get(i).sprintName }')">
								<c:if test="${sprintList.get(i).sprintType == '03'}">
									<tr>
										<td id="progressPercent${i}" class="progressPercent" rowspan="2">${ sprintList.get(i).sprintTaskCount }%</td>
										<td class="sprintName" colspan="2"><c:out value="${ sprintList.get(i).sprintName }" /></td>
									</tr>
									<tr>
										<td class="progressLine" colspan="2">
										<progress value="${ sprintList.get(i).sprintTaskCount }" max="100"></progress>
										</td>
										<td><input type="hidden" name="sendSprintCode" id="sendSprintCode" value="${sprintList.get(i).sprint.sprintCode}"></td>
									</tr>
								</c:if>
							</tbody>
						</c:forEach>
						</c:if>
					</table>
				</div>
				<button class="SprintButtonArea" id="sprintapply">새 스프린트 생성</button>
			</div>

			<!-- ---------------------오른쪽------------------------- -->
			<div id="taskListArea">
			
			 
				<jsp:include page="../projectTask/MainTask/taskDetail.jsp"/>
				
				<c:if test="${not empty sprintList}">
				<div class="taskButtonArea">
					<button class='taskapply' id='rectangle5' style='width: 100px;'>Task 추가</button>
					<button id='rectangle5' class='updatebtn' style='width: 100px;'>스프린트 편집</button> 
					<!-- 버튼주입장소 -->
					<div class="sprintBtnF" style="display: none;"></div>
					<div class="sprintBtnS" style="display: none;"></div>
				</div>
				
				<!-- 스프린트정보 주입장소 -->
				<div id="addPostPart"></div>
				<div id="sprintTaskList">
					<table>
						<thead>
							<tr>
								<td width="10%">Task코드</td>
								<td width="35%">Task명</td>
								<td width="13%">실제소요시간</td>
								<td width="13%">예상소요시간</td>
								<td width="6%">Point</td>
								<td width="8%">진행상태</td>
								<td width="8%">담당자</td>
								<td width="5%">설정</td>
							</tr>
						</thead>
						
						<!-- 테스크리스트 주입장소 -->
						<tbody id="addTaskList">
						</tbody>
					</table>
				</div>
				</c:if>
				<c:if test="${empty sprintList}">
					<img src="/agile/resources/images/indiv/main/mainpage/img_timeline3.jpg" style="width:500px; height:350px; margin-left:130px; margin-top:100px;">
				</c:if>
			</div>
		</div>
	</div>

	<!-- 스프린트추가 모달창 -->
	<form action="insert.st" method="post">
		<div id="newSprintModal" class="modal">
			<div class="modal-content">
				<p align="left" class="modaltitle">🎁 새 스프린트 생성</p>
				<table align="center" class="modalTable">
					<tbody>
						<c:if test="${not empty sprintList}">
						<tr>
							<td><b>[<c:out value="${ sprintList.get(0).project.projectName }" />]
							</b>(프로젝트)에 새로운 스프린트를 추가하시겠습니까?</td>
						</tr>
						</c:if>
						<tr>
							<td>※초기 스프린트명은 스프린트 코드로 자동지정됩니다.</td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="sprintclose" id="rectangle7">취소</div>
				</div>
			</div>
		</div>
	</form>
	
	<!-- 스프린트수정 모달창 -->
	<form action="update.st" method="post">
		<div id="updateSprint" class="modal">
			<div class="modal-content updatecontent">
				<p align="left" class="modaltitle">🎁 스프린트 수정하기</p>
				<table align="center" class="SprintUpdateModalTable">
					<tbody>
						<tr>
							<td><b>스프린트 명 : </b></td>
							<td><input type="text" class="updateInput updateSprintName" name="sprintName" value=""></td>
						</tr>
						<tr>
							<td><b>스프린트 코드 : </b></td>
							<td><input type="text" class="updateInput updateSprintCode" name="sprintCode" value="" readonly></td>
						</tr>
						<tr style="height: 10px;">
							<td colspan="2">      ※이미 생성된 스프린트 코드는 변경할 수 없습니다.</td>
						</tr>
						<tr>
							<td><b>스프린트 시작일 : </b></td>
							<td><input type="date" class="updateInput updateSprintStart" name="sprintHistUpdateTime" value="" ></td>
						</tr>
						<tr>
							<td><b>스프린트 예상소요시간 : </b></td>
							<td><input type="text" class="updateInput updateSprintExpect" name="sprintExpectPeriod" value="" ></td>
						</tr>
						<tr>
							<td><b>스프린트 설명 : </b></td>
							<td><input type="text" class="updateInput updateSprintIntro" name="sprintIntro" value="" ></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="sprintupdateclose" id="rectangle7">취소</div>
				</div>
				
				<c:if test="${not empty sprintList}">
				<input style="display: none" name="userProjectCode"
					value="${ sprintList.get(0).userProjectList.userProjectCode }">
					</c:if>
			</div>
		</div>
	</form>
	
	<!-- 스프린트종료 모달창 -->
	<form action="updateFinish.st" method="post">
		<div id="updateFinishModal" class="modal">
			<div class="modal-content">
				<p align="left" class="modaltitle">🎁 스프린트 종료</p>
				<table align="center" class="modalTable">
					<tbody>
						<tr>
							<td><span id="updateFinishName" name="updateFinishName"></span></td>
						</tr>
						<tr>
							<td>※종료된 스프린트는 다시 시작할 수 없습니다!</td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="updateFinishClose" id="rectangle7">취소</div>
				</div>
				
				<!-- 데이터넘기기용영역 -->
				<input type="hidden" class="updateInput updateSprintCode" name="sprintCode" value="" >
				<input type="hidden" class="updateInput updateSprintName" name="sprintName" value="">
				<input type="hidden" class="updateInput updateSprintStart" name="sprintHistUpdateTime" value="" >
				<input type="hidden" class="updateInput updateSprintExpect" name="sprintExpectPeriod" value="" >
				<input type="hidden" class="updateInput updateSprintIntro" name="sprintIntro" value="" >
				<c:if test="${not empty sprintList}">
					<input type="hidden" name="userProjectCode" value="${ sprintList.get(0).userProjectList.userProjectCode }">
				</c:if>
			</div>
		</div>
	</form>
	
	<!-- 스프린트시작 모달창 -->
	<form action="updateStart.st" method="post">
		<div id="updateStartModal" class="modal">
			<div class="modal-content">
				<p align="left" class="modaltitle">🎁 스프린트 시작</p>
				<table align="center" class="modalTable">
					<tbody>
						<tr>
							<td><span id="updateStartName" name="updateStartName"></span></td>
						</tr>
						<tr>
							<td>※스프린트는 프로젝트에서 1개만 시작 가능합니다!</td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="updateStartClose" id="rectangle7">취소</div>
				</div>
				<!-- 데이터넘기기용영역 -->
				<input type="hidden" class="updateInput updateSprintCode" name="sprintCode" value="" >
				<input type="hidden" class="updateInput updateSprintName" name="sprintName" value="">
				<input type="hidden" class="updateInput updateSprintStart" name="sprintHistUpdateTime" value="" >
				<input type="hidden" class="updateInput updateSprintExpect" name="sprintExpectPeriod" value="" >
				<input type="hidden" class="updateInput updateSprintIntro" name="sprintIntro" value="" >
				<c:if test="${not empty sprintList}">
				<input type="hidden" name="userProjectCode" value="${ sprintList.get(0).userProjectList.userProjectCode }">
				</c:if>
			</div>
		</div>
	</form>
	
	<!--  Task 종료 모달창 -->
	<form action="finishTask.st" method="post">
		<div id="finishTaskModal" class="modal">
			<div class="modal-content">
				<p align="left" class="modaltitle">🎉 Task 완료!</p>
				<table align="center" class="modalTable">
					<tbody>
						<tr>
							<td><span id="finishTask" name="finishTask"></span></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="finishTaskClose" id="rectangle7">취소</div>
				</div>
				<!-- 데이터넘기기용영역 -->
				<input type="hidden" id="updateTaskCode" name="taskCode" value="">
			</div>
		</div>
	</form>
	
	
	<!--  Task 삭제 모달창 -->
	<form action="insertTaskHistoryTaskDelete2.tk" method="post">
		<div id="deleteTaskModal" class="modal">
			<div class="modal-content">
				<p align="left" class="modaltitle">🎃 Task 삭제</p>
				<table align="center" class="modalTable">
					<tbody>
						<tr>
							<td><span id="deleteTask" name="deleteTask"></span></td>
						</tr>
					</tbody>
				</table>
				<div class="modalButtonArea">
					<button class="rectangle6" type="submit">저장</button>
					<div class="deleteTaskClose" id="rectangle7">취소</div>
				</div>
				<!-- 데이터넘기기용영역 -->
				<input type="hidden" id="deleteTaskCode" name="taskCode" value="">
			</div>
		</div>
	</form>
	
	
	
	<div class="wrap-loading display-none">
   		<div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
	</div>   
	

<script type="text/javascript">
	
	var temp = $('#clickName').val();
	var temp2 =  $('#clickSprintCode').val();
	console.log("temp들어갓니? " + temp );
	console.log("temp2들어갓니? " + temp2 );
	
	window.onload = function () {
		
		if(temp!=null && temp2 !=null){
			tbodyClick(temp2,temp);
		}
	}

	function tbodyClick(i, name) {
		
		/* 선택된 스프린트 코드 및 정보 알려주고 ajax에 넘겨주기 */
		var sprintCode = i;
		$('#sendSprintCode').val(sprintCode);
		$('.updateSprintCode').val(sprintCode);
		
		/* 선택된 스프린트정보 모달에 알려주기 */
		var sprintName = name;
		$('.updateSprintName').val(sprintName);
		$('#updateFinishName').html('스프린트 "<b>' + sprintName + '</b>" 을(를) 정말 종료하시겠습니까?');
		$('#updateStartName').html('스프린트 "<b>' + sprintName + '</b>" 을(를) 시작하시겠습니까?');
		
		/* 주입할 장소 */
		var addPostPart = $('#addPostPart');
		var addPostPart2 = $('#addTaskList');
		
		/* 스프린트 종료버튼 삽입장소 */
		var sprintBtnF = $('.sprintBtnF');
		var sprintBtnS = $('.sprintBtnS');
		
		/* 스프린트 상세정보 상단 표시 */
		$.ajax({
			type : 'post',
			url: "showSprintDetail.st",
			data : {
				sprintCode : sprintCode
			},
			dataType: 'json',
			success : function(data) {
				addPostPart.children().remove();
				sprintBtnF.children().remove();
				sprintBtnS.children().remove();
				
				/* --------------------------------첫번째 성공구문시작------------------------------- */
				if(data!=null){
					
					/* 스프린트 진행상태에 따라 div스타일 변경 */
					var sprintType = data.sprint.sprintType;
					var sprintType2 = 'sprintCodeNon'; /* bar내부 버튼 색 */
					//스프린트가 시작중일때는 종료버튼, 진행중일때는 완료버튼, 완료되었을때는 버튼 없음.
					var sprintButton ='';
					var sprintBtnText = '';
					switch (sprintType) {
						case '01': sprintType2='sprintCodeNon'; sprintButton='sprintStartBtn'; sprintBtnText='스프린트 시작'; 
									$(sprintBtnS).css('display','block'); $(sprintBtnF).css('display','none'); 
									$('.taskapply').css('display','inline-block');
									sprintBtnS.prepend(
									"<button class='" + sprintButton + "' id='rectangle5' style='width: 100px;'>"+ sprintBtnText +"</button>"		
									)
									break;
						case '02': sprintType2='sprintCodeStarted'; sprintButton='sprintFinishBtn'; sprintBtnText='스프린트 종료'; 
									$(sprintBtnF).css('display','block'); $(sprintBtnS).css('display','none'); 
									$('.taskapply').css('display','inline-block');
									/* 버튼주입 */
									sprintBtnF.prepend(
									"<button class='" + sprintButton + "' id='rectangle5' style='width: 100px;'>"+ sprintBtnText +"</button>"		
									)
									break;
						case '03': sprintType2='sprintCodeFinished'; 
									$(sprintBtnF).css('display','none'); $(sprintBtnS).css('display','none'); 
									$('.taskapply').css('display','none');
						break;
					}
					
					
					/* 스프린트정보 주입 */
					addPostPart.prepend(
						"<div id='sprintInfoNon'><div id='" + sprintType2 + "'>" + data.sprint.sprintCode + "</div><div id='sprintInfomation'><table><tbody><tr><td>스프린트명 : " +
						data.sprint.sprintName + "</td></tr><tr><td>스프린트 시작일 :" +  data.sprint.sprint.sprintCreateDate  + " / 예상소요시간 : " + data.sprint.sprintExpectPeriod + 
						"m<td></tr></tbody></table></div><div id='sprintCounting'><table><tbody><tr><td><span class='pointAverage'>0pts</span></td><td>미완료</td><td><span class='tasknonFinish'>0</span></td><td>완료</td><td><span class='taskFinish'>1</span></td><td>진행중</td><td><span class='taskIng'>1</span></td><td class='taskTotal'>총 2개</td></tr></tbody></table></div>"+
						"</div><div id='sprintIntro'>스프린트 설명 : " + data.sprint.sprintIntro + "</div>"
					);
					
					
					/* 편집모달에 알려주기 */
					$('.updateSprintStart').val(data.sprint.sprint.sprintCreateDate);
					$('.updateSprintExpect').val(data.sprint.sprintExpectPeriod);
					$('.updateSprintIntro').val(data.sprint.sprintIntro);
					
					
					/* 해당 스프린트에 포함된 task리스트 조회 */
					$.ajax({
						type : 'post',
						url: "showTaskDetail.st",
						data : {
							sprintCode : sprintCode
						},
						dataType: 'json',
						success : function(data) {
							
							addPostPart2.children().remove();
							if(data!=null){
								
								//횟수 누적할 변수	
								var tasknonFinish = 0;
								var taskFinish = 0;	
								var taskIng = 0;
								var taskTotal = 0;
								var pointAverage = 0;
							
								if(data.sprintTaskList.length > 0){
									var taskCode = [];
									taskCode[0] =  data.sprintTaskList[0].taskCode;
									var count = 0;
									
									for(var i = 1 ; i<data.sprintTaskList.length; i++){
										
										//이미 앞 배열에 들어있는거랑 같지 않을때만 저장
										if(data.sprintTaskList[i].taskCode != taskCode[count]){
											//taskcode 저장
											taskCode[count+1] = data.sprintTaskList[i].taskCode;
											count++;
										}
									}
									
									//포인트구하기
									for(var i = 0 ; i<data.sprintTaskList.length-1; i++){
										if(data.sprintTaskList[i].taskCategoryCode== 'D'){
											pointAverage += Number(data.sprintTaskList[i].taskHistValue);
										}
									}
									/* pointAverage = (pointAverage/data.sprintTaskList.length) ; */
									$('.pointAverage').html('총' + pointAverage+'pts');
									
									//같은 taskCode끼리 묶어서
									for(var i = 0; i<taskCode.length; i++){
										//꺼내서 행 구분하는 작업
											var taskName = '이름없는 테스크';
											var realTime = '미지정';
											var expectTime = '미지정';
											var point = '미지정';
											var taskStatus = '미진행';
											var bug = 'N';
											var deleteyn = 'N';
											var statusButton = 'taskStatus3';
											var userCode ;
											var taskUser = '미지정';
								
										for(var j = 0; j<data.sprintTaskList.length; j++){
											//taskCode같으면 한 행으로 나오게!
											userCode = data.sprintTaskList[j].userCode;	
											if(taskCode[i] == data.sprintTaskList[j].taskCode){
												
												switch(data.sprintTaskList[j].taskCategoryCode){
												case 'J' : taskName = data.sprintTaskList[j].taskHistValue; break;
												case 'I' : taskStatus = data.sprintTaskList[j].taskHistValue; 
															/* 스타일다른 버튼 적용하기 위해 clss명 다르게 지정해주기 */
															if(taskStatus =='미진행'){
																statusButton = 'taskStatus3';
																tasknonFinish++;
															}else if(taskStatus =='진행중'){
																statusButton = 'taskStatus2';
																taskIng++;
															}else if(taskStatus =='완료'){
																statusButton = 'taskStatus1';
																taskFinish++;
															}
															break;
												case 'A' : expectTime = data.sprintTaskList[j].taskHistValue; break;
												case 'B' : realTime = data.sprintTaskList[j].taskHistValue; break;
												case 'D' : point = data.sprintTaskList[j].taskHistValue; break;
												case 'F' : deleteyn = data.sprintTaskList[j].taskHistValue; break;
												case 'G' : bug = data.sprintTaskList[j].taskHistValue; break;
												case 'L' : taskUser =  data.sprintTaskList[j].taskHistValue; break;
												} 
											}
										}
										
										
										var givetaskName = '"' + taskName +'"';
										addPostPart2.prepend(
										"<tr><td class='taskCode'>"+ taskCode[i]+ "</td><td class='taskName'>" + taskName + "</td><td class='realTime'>" + realTime + "</td><td class='expectTime'>" + expectTime + "</td><td class='storyPoint'>" + 
											point + "</td><td><span class='" +  statusButton + "'>" +  taskStatus + "</td><td class='person'><div class='participant'>" + taskUser 
											+ "</div></td><td class='more2'><div class='dropdown'><div class='select'><span id='more'>...</span><i class='fa fa-chevron-left'></i>"+
					                    "</div><ul class='dropdown-menu'><li id='taskFinish' onclick='taskFinish(" + taskCode[i] + "," + givetaskName + ");'>종료</li><li id='taskUpdate'>수정</li><li id='taskDelete' onclick='taskDelete("+taskCode[i] +"," + givetaskName +");'>삭제</li></ul></div></td></tr>"
					                    
										);
									}
									taskTotal = tasknonFinish + taskIng + taskFinish;
									
									if (taskCode.length - taskTotal >0){
										tasknonFinish += taskCode.length - taskTotal;
										taskTotal = tasknonFinish + taskIng + taskFinish;
									}
								}
								
								$('.taskTotal').html('총 ' + taskTotal+ '개');
								$('.tasknonFinish').html(tasknonFinish);
								$('.taskIng').html(taskIng);
								$('.taskFinish').html(taskFinish);
							
							}

							$('.dropdown').click(function() {
								$(this).attr('tabindex', 1).focus();
								$(this).toggleClass('active');
								$(this).find('.dropdown-menu').slideToggle(300);
							});
						
							$('.dropdown').focusout(function() {
								$(this).removeClass('active');
								$(this).find('.dropdown-menu').slideUp(300);
							});
						
							$('.dropdown .dropdown-menu li').click(
								function() {
									$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
							});
						
							$('.dropdown-menu li').click(
								function() {
									var input = $(this).parents('.dropdown').find('input').val()
									
							});
							
						},
						error : function () {
							addPostPart2.children().remove();
							console.log('테스크 못가져옴');
						},
						beforeSend : function(){
					        $('.wrap-loading').removeClass('display-none');
						},
						complete : function(){
						    $('.wrap-loading').addClass('display-none');
						}
					})
				}
			},
			error : function() {
				 addPostPart.children().remove();
				 console.log("실패");
			}
			
		});
	}
	
	/* 테스크종료 모달 */
    var finishTaskModal = document.getElementById("finishTaskModal");
    var span5 = document.getElementsByClassName("finishTaskClose")[0];
	
	function taskFinish(taskCode, taskName) {
		var taskName = taskName;
		console.log(taskName );
		$('#updateTaskCode').val(taskCode);
		$('#finishTask').html('<b>' + taskName + '</b> Task를 종료 하시겠습니까?');
		$(finishTaskModal).css('display','block');
	}
	
	span5.onclick = function() {
	    $(finishTaskModal).css('display','none');
	}
	
	
	/* 테스크삭제 */
	var deleteTaskModal = document.getElementById("deleteTaskModal");
    var span6 = document.getElementsByClassName("deleteTaskClose")[0];
    
	function taskDelete(taskCode, taskName) {
		var taskCode = taskCode;
		var taskName = taskName;
		
		$('#deleteTaskCode').val(taskCode);
		$('#deleteTask').html('<b>' + taskName + '</b> Task를 종료 하시겠습니까?');
		$(deleteTaskModal).css('display','block');
	}
	span6.onclick = function() {
	    $(deleteTaskModal).css('display','none');
	}
	
	
	
</script>

	<script type="text/javascript">
	
		/* task Detail 모달관련 설정 */
	    var taskModalYn = document.getElementById("taskModalYn");
	    var taskDetailModal = document.getElementById("taskDetailModal");
	    var taskspan = document.getElementsByClassName("taskclose")[0];
	    var taskspan2 = document.getElementsByClassName("taskCancel")[0];
	    
	    taskspan.onclick = function() {
	        $(taskDetailModal).css('display','none');
	    }
	    taskspan2.onclick = function() {
	        $(taskModalYn).css('display','none');
	    } 
	    
	     $('.taskapply').click(function(){
	       $(taskModalYn).fadeIn(300); 
	       $(taskModalYn).css('display','block');
	    }); 
	     
	    var taskCode = $('#taskCode').val();
		
		/* 좌측목록 */
	  	var sprintListFin = document.getElementsByClassName("sprintListFin")[0];
	  	var sprintListIng = document.getElementsByClassName("sprintListIng")[0];
	  	var btnFin = document.getElementsByClassName("btnFin")[0];
	  	var btnIng = document.getElementsByClassName("btnIng")[0];
	    
	  	btnFin.onclick = function() {
	  		$(btnIng).css('background','#C4C4C4');
	  		$(btnFin).css('background','#2B2B49');
		    $(sprintListFin).css('display','block');
		    $(sprintListIng).css('display','none');
		}
	  	btnIng.onclick = function() {
	  		$(btnIng).css('background','#2B2B49');
	  		$(btnFin).css('background','#C4C4C4');
		    $(sprintListIng).css('display','block');
		    $(sprintListFin).css('display','none');
		}
	  	
	   /* 모달창 */
		var newSprintModal = document.getElementById("newSprintModal");
		var updateSprint = document.getElementById("updateSprint");
		var taskmodal = document.getElementById("taskmyModal");
		var updateFinishModal = document.getElementById("updateFinishModal");
		var updateStartModal = document.getElementById("updateStartModal");
		 
		/* 스프린트생성/편집창 열기 */
		var btn = document.getElementById("sprintapply");
		var btn2 = document.getElementsByClassName("updatebtn")[0];
		
		/* 스프린트 생성/편집창 닫기 */
	    var span = document.getElementsByClassName("sprintclose")[0];
	    var span2 = document.getElementsByClassName("sprintupdateclose")[0];
	    var span3 = document.getElementsByClassName("updateFinishClose")[0];
	    var span4 = document.getElementsByClassName("updateStartClose")[0];
	    
	    /* 스프린트 종료창 열기 */
	    var sprintBtnF = document.getElementsByClassName("sprintBtnF")[0];
	    /* 스프린트시작창 열기 */
	    var sprintBtnS = document.getElementsByClassName("sprintBtnS")[0];
		
		btn.onclick = function() {
		    $(newSprintModal).fadeIn(100); 
		    $(newSprintModal).css('display','block');
		}
		
		btn2.onclick = function() {
		    $(updateSprint).fadeIn(100); 
		    $(updateSprint).css('display','block');
		}
		
		sprintBtnF.onclick = function() {
		    $(updateFinishModal).fadeIn(100); 
		    $(updateFinishModal).css('display','block');
		}
		
		sprintBtnS.onclick = function() {
		    $(updateStartModal).fadeIn(100); 
		    $(updateStartModal).css('display','block');
		}
		
		span.onclick = function() {
		    $(newSprintModal).css('display','none');
		}
		
		span2.onclick = function() {
		    $(updateSprint).css('display','none');
		}
		
		span3.onclick = function() {
		    $(updateFinishModal).css('display','none');
		}
		
		span4.onclick = function() {
		    $(updateStartModal).css('display','none');
		}
		
		window.onclick = function(event) {
		  if (event.target == newSprintModal) {
			  newSprintModal.style.display = "none";
		  }else if (event.target == updateSprint) {
			  updateSprint.style.display = "none";
		  }else if (event.target == taskmodal) {
		        taskmodal.style.display = "none";
		  }else if (event.target == updateFinishModal) {
			  updateFinishModal.style.display = "none";
		  }else if (event.target == updateStartModal) {
			  updateStartModal.style.display = "none";
		  }     
		};
		
		$('.taskapply').click(function(){
			$(taskmodal).fadeIn(300); 
			$(taskmodal).css('display','block');
		});

		/* 검색 */
		function searchSprint() {
			
			var sprintName = $("#sprintName").val();
			
			$.ajax({
				url:"searchSprint.st",
				type:"post",
				data:{"sprintName" : sprintName},
				dataType : "json",
				success: function(data){
					
					var sprintListIngTable = $('#sprintListIngTable');
					var sprintListFinTable = $('#sprintListFinTable');
					sprintListIngTable.children().remove();
					sprintListFinTable.children().remove();
					
					for(var i=0; i<data.searchSprint.length; i++){
						var tbodyName = 'tbody' + data.searchSprint[i].sprintCode ;
						var tbodyOnclick = '"' + data.searchSprint[i].sprintName + '"' ;
						
						if(data.searchSprint[i].sprintType != '03'){
							
							sprintListIngTable.append("<tbody class='sprinttbody' id='" + tbodyName 
									 + "' onclick='tbodyClick(" + data.searchSprint[i].sprintCode + "," + tbodyOnclick + ")'><tr>"
									 + "<td id='progressPercent" + i +"' class='progressPercent' rowspan='2'> " + data.searchSprint[i].sprintTaskCount 
									 + "%</td><td class='sprintName' colspan='2'>" + data.searchSprint[i].sprintName + "</td></tr>"
									 + "<tr><td class='progressLine' colspan='2'><progress value='" + data.searchSprint[i].sprintTaskCount + "' max='100'></progress></td>"
									 + "<td><input type='hidden' name='sendSprintCode' id='sendSprintCode' value='" + data.searchSprint[i].sprint.sprintCode +"'></td></tr></tbody>"
							)
							 
						}else if(data.searchSprint[i].sprintType == '03'){
							sprintListFinTable.append("<tbody class='sprinttbody' id='" + tbodyName 
									 + "' onclick='tbodyClick(" + data.searchSprint[i].sprintCode + "," + tbodyOnclick + ")'><tr>"
									 + "<td id='progressPercent" + i +"' class='progressPercent' rowspan='2'> " + data.searchSprint[i].sprintTaskCount 
									 + "%</td><td class='sprintName' colspan='2'>" + data.searchSprint[i].sprintName + "</td></tr>"
									 + "<tr><td class='progressLine' colspan='2'><progress value='" + data.searchSprint[i].sprintTaskCount + "' max='100'></progress></td>"
									 + "<td><input type='hidden' name='sendSprintCode' id='sendSprintCode' value='" + data.searchSprint[i].sprint.sprintCode +"'></td></tr></tbody>"
							)
						}
					}
					
				},
				error: function(data){
					console.log("실패");
				}
			});
			
		}
	</script>
	
</html>














