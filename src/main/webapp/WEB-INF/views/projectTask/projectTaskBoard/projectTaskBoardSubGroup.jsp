<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/projectTaskBoard/projectTaskBoard.css">
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2"><a href="showProjectMain.pj">프로젝트 </a>/ <b>이름땡땡땡!!</b></div>
           <div id="menuTitle">Task Board</div>
       </div>

       <!-- content 영역 -->
       <div id="contentBox">
			<div id="contentBox1">
				<div id="contentBox1-title">스프린트명</div>
				<div id="sprint-finish">스프린트 완료</div>
				<div id="contentBox1-subtitle">스프린트 상세 설명</div>
				<!-- 기본 기능 버튼 table -->
				<table id="contentBox1-table">
					<tr>
						<td id="contentBox1-table-td1"><div id="searchBox"><input id="searchBoxInput" type="text"/><img id="icon-searchicon" src="/agile/resources/icon/common/icon_searchicon.png"></div></td>
						<td id="contentBox1-table-td2">사람 추가</td>
						<td id="contentBox1-table-td3"><!-- <div id="sprint-finish">스프린트 완료</div> --></td>
						<td id="contentBox1-table-td4"><div>검색색 필터</div></td>
						<td id="contentBox1-table-td5"><div id="group-standard">그룹화 기준</div></td>
						<td id="contentBox1-table-td6">
							<div class="dropdown1">
						        <div class="select">
						            <span id="groupbyCategory">하위작업</span>
						        </div>
						        <ul class="dropdown1-menu">
						          <li class="groupByNone" id="groupByNone">없음</li>
						          <li class="groupBySub" id="groupBySub">하위작업</li>
						        </ul>
							 </div>
						</td>
					</tr>
				</table>
       		</div>
       		<div id="contentBox2">
       			<div id="contentBox2-title">
       				<div id="incomplete-title">미진행</div>
					<div id="proceeding-title">진행중</div>	
					<div id="complete-title">완료</div>	
       			</div>
       			<div id="contentBox2-board">
       							
<!-- 보드 내용 시작----------------------------------------------------------------------------------------------------------->	
	       			
<!-- 보드 내용 끝 끝----------------------------------------------------------------------------------------------------------->	
       			</div>
       		</div>
		</div>
	</div>
	
	
	
<!-- 레이블 추가 모달 시작----------------------------------------------------------------------------------------------------------->	
 <div id="myModal3" class="modal3">
   <!-- Modal content -->
   <div class="modal-content3">
   <!-- 모달의 제목 부분 -->
     <p align="left" class ="modaltitle3" style="font-size:30px;"></p>
	     <table align="center" class="modalTable3">
	     <!-- 내용-->
		     	<tr><td>레이블 입력<div class="red-star">*</div></td></tr>
		     	<tr>
		     		<td>
						<!-- 목록 상자 datalist 이용하기 input 의 list 속성 값과 datalist 의 id 속성의 값과 일치해야 함 -->
	     				<input type="text" list="searchLabelList" name="searchLabel" id="searchLabel" onkeyup="searchLabel();" autocomplete="off"/> 
		     			<!-- 현재 프로젝트의 프로젝트 코드, 프로젝트 내에서 사용중인 모든 레이블 list를 조회해오기 위해 필요함 -->
		     			<input type="hidden" id="labelProjectCode" name="labelProjectCode" value="" >
	     				<datalist id="searchLabelList">
						  <!-- <option value="레이블이름"> -->
						</datalist>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td>
			     		<div class="red-star">* 기존에 사용중인 레이블도 등록할 수 있습니다.</div>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td>
			     		<div class="btn-box">
			     			<!-- 레이블 등록 정보 전송할 폼 -->
			     			<form id="LabelYesForm" action="insertTaskHistoryLabelYes.tk" method="post">
				     			<input type="hidden" id="labelName" name="labelName" value="" ><!-- 추가할 레이블 이름 -->
				     			<input type="hidden" id="labelTaskCode" name="labelTaskCode" value="" ><!-- 레이블을 추가할 테스크 코드 -->
				     			<!-- submit대신 button에다가 함수를 넣어서 클릭시 폼내용을 다채웠는지 확인한뒤 내용을 보냄-->
				     			<button type="button" class="rectangle6 modal3-ok" id="formContentCheck3">추가</button>
			     			</form>
				     			<button class="rectangle7 modal3-close" onclick="closeModal3();" >닫기</button>
			     		</div>
		     		</td>
		     	</tr>
	     </table>
	</div>
 </div>	
	
<!-- 레이블 추가 모달 끝----------------------------------------------------------------------------------------------------------->	
	
	
	
<!-- 상위 항목 변경 모달 시작----------------------------------------------------------------------------------------------------------->	
 <div id="myModal2" class="modal2">
   <!-- Modal content -->
   <div class="modal-content2">
   <!-- 모달의 제목 부분 -->
     <p align="left" class ="modaltitle2" style="font-size:30px;"></p>
	     <table align="center" class="modalTable2">
	     <!-- 내용-->
		     	<tr><td>상위 항목 변경<div class="red-star">*</div></td></tr>
		     	<tr>
		     		<td>
						<!-- 목록 상자 datalist 이용하기 input 의 list 속성 값과 datalist 의 id 속성의 값과 일치해야 함 -->
	     				<input type="text" list="searchSprintList" name="searchSprint" id="searchSprint" onkeyup="searchSprint();" autocomplete="off"/> 
		     			<!-- 현재 프로젝트의 프로젝트 코드, 프로젝트 내에서 사용중인 모든 레이블 list를 조회해오기 위해 필요함 -->
		     			<input type="hidden" id="modal2ProjectCode" name="modal2ProjectCode" value="" >
	     				<datalist id="searchSprintList">
						  <!-- <option value="레이블이름"> -->
						</datalist>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td>
			     		<div class="red-star">* 미진행중인 스프린트로 테스크를 이동시킬 수 있습니다.</div>
		     		</td>
		     	</tr>
		     	<tr>
		     		<td>
			     		<div class="btn-box">
			     			<!-- 레이블 등록 정보 전송할 폼 -->
			     			<form id="updateTaskSprintCodeForm" action="updateTaskSprintCodeForm.tk" method="post">
				     			<input type="hidden" id="modal2SprintCode" name="modal2SprintCode" value="" ><!-- 추가할 레이블 이름 -->
				     			<input type="hidden" id="modal2TaskCode" name="modal2TaskCode" value="" ><!-- 레이블을 추가할 테스크 코드 -->
				     			<!-- submit대신 button에다가 함수를 넣어서 클릭시 폼내용을 다채웠는지 확인한뒤 내용을 보냄-->
				     			<button type="button" class="rectangle6 modal2-ok" id="formContentCheck2">변경</button>
			     			</form>
				     			<button class="rectangle7 modal2-close" onclick="closeModal2();" >닫기</button>
			     		</div>
		     		</td>
		     	</tr>
	     </table>
	</div>
 </div>	
	
<!-- 상위 항목 변경 모달 끝----------------------------------------------------------------------------------------------------------->	
		
	
</body>


<script>

//task list 관련 코딩----------------------------------------------------------------------
//메뉴 -> taskBoard 클릭 -> 리스트 조회 -> view 

//전체 리스트 출력
var taskList = JSON.parse('${taskList}');
console.log("전체 리스트")
console.log(taskList);

//전체 상위테스크 리스트
var mainTaskList = JSON.parse('${mainTaskList}');
console.log("전체 상위테스크 리스트")
console.log(mainTaskList);
//전체 하위테스크 리스트
var subTaskList = JSON.parse('${subTaskList}');
console.log("전체 하위테스크 리스트")
console.log(subTaskList);

//중복 제거 리스트 출력
var selectedTaskList = JSON.parse('${selectedTaskList}');
console.log("중복제거 테스크 리스트");
console.log(selectedTaskList);
//중복 제거 상위 리스트 출력
var selectedMainTaskList = JSON.parse('${selectedMainTaskList}');
console.log("중복제거 상위 테스크 리스트");
console.log(selectedMainTaskList);
//중복 제거 하위 리스트 출력
var selectedSubTaskList = JSON.parse('${selectedSubTaskList}');
console.log("중복제거 하위 테스크 리스트");
console.log(selectedSubTaskList);


//상위 테스크  리스트 출력
//object랑 문자랑 같이 출력하면 출력 안됨
var mainTaskList1 = JSON.parse('${mainTaskList1}');
var mainTaskList2 = JSON.parse('${mainTaskList2}');
var mainTaskList3 = JSON.parse('${mainTaskList3}');
console.log("중복제거 상위 테스크");
console.log("중복제거 상위 테스크 미진행");
console.log(mainTaskList1); //미진행
console.log(mainTaskList1); //미진행
console.log("중복제거 상위 테스크 진행중");
console.log(mainTaskList2); //진행중
console.log("중복제거 상위 테스크 완료");
console.log(mainTaskList3); //완료


//하위 테스크 리스트 출력
console.log("중복제거 하위 테스크");
console.log("중복제거 하위 테스크 미진행");
var subTaskList1 = JSON.parse('${subTaskList1}');
console.log(subTaskList1); //미진행
console.log("중복제거 하위 테스크 진행중");
console.log(subTaskList2); //진행중
var subTaskList2 = JSON.parse('${subTaskList2}');
console.log("중복제거 하위 테스크 완료");
var subTaskList3 = JSON.parse('${subTaskList3}');
console.log(subTaskList3); //완료

//리스트에 있는 현재 진행중인 스프린트명과 스프린트 설명 view페이지에 넣어주기
var sprintTitle =  $('#contentBox1-title');
var sprintSubTitle = $('#contentBox1-subtitle');
//html 안에 있는 기본값 지우기
sprintTitle.text('');
sprintSubTitle.text('');
//list에 담긴 값 넣어주기
sprintTitle.text(taskList[0].sprintHistory.sprintName);
sprintSubTitle.text(taskList[0].sprintHistory.sprintIntro);

//프로젝트명 변경
var projectTitle = $("#projectTitle2").find('b');
projectTitle.text('');
projectTitle.text(taskList[0].taskList.project.projectName);	    
	    
//task list 관련 코딩 끝--------------------------------------------------------------------------------------------------------------------------------------------


//하위 작업 기본 view-------------------------------------------------------------------------------------------------------------------------------------------- */
//(1) 각 상위 테스크별 제목 상자를 만들어준다.
//리스트 길이만큼 반복
for(var i = 0; i < selectedMainTaskList.length; i++){
	
	//진행상태에 따른 css 색상 주기
	var color = "";
	if(selectedMainTaskList[i].taskHistValue == "미진행"){
		color = "sGray";
	}else if(selectedMainTaskList[i].taskHistValue == "진행중"){
		color = "sNavy";
	}else if(selectedMainTaskList[i].taskHistValue == "완료"){
		color = "sPink";
	}else{
		console.log("상위 테스크 진행상태 데이터 입력오류");
	}
	
	
	//각각의 상위 테스크별 최상위 div에 s + 상위 테스크 코드를 붙여준다.
	var sContentBox = $('#contentBox2-board');
		sContentBox.append("<div id='s" + selectedMainTaskList[i].taskCode + "' class='outerBox' ><div class='sTitle'><div></div><div class='micon'>T</div><div class='stcode'>" 
		    + 'TASK - ' + selectedMainTaskList[i].taskCode + "</div><span class='nameBox'>" 
			+ '이름 없는 테스크' + "</span><span class='taskProceedingStatus " + color + "'>" + selectedMainTaskList[i].taskHistValue + "</span>" 
			+ "</div><div class='wrapper'><div class='dropzone' id='iboard" + selectedMainTaskList[i].taskCode + "' >" 
			+ "</div><div class='dropzone' id='pboard" + selectedMainTaskList[i].taskCode + "' ></div>" 
			+ "<div class='dropzone' id='cboard" + selectedMainTaskList[i].taskCode + "' ></div></div></div>");
		//기존 미진행 박스 안에 내용 지우기
		//siboard.children().remove();

	//하위테스크 미진행 그려주기------------------------------------------------------------------------------------------------------------------
		if(subTaskList1 != null){
			for(var j = 0; j < subTaskList1.length; j++){

			//하위 테크스 리스트에서 headTaskCode 정보가 현재 반복문 실행중인 상위 테스크 코드와 같은 것이 있다면 
				if(subTaskList1[j].taskList.headTaskCode == selectedMainTaskList[i].taskCode){
					
					//현재 선택한 메인 테스크 outer 상자를 가져온다..			
					var target1 = $('#s' + selectedMainTaskList[i].taskCode);
					//console.log("하위에 테스크 있음");
				
					//미진행이기 때문에 해당 target 바로 하위에있는 siboard보드에 그려줘야한다.
					var targetSpecific = target1.find('#iboard' + selectedMainTaskList[i].taskCode);
					//하위에 요소를 추가해준다.
					//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
					//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
					targetSpecific.append("<div class='mini-box t" + subTaskList1[j].taskCode + "' id='t" + subTaskList1[j].taskCode + "' draggable='true'><input type='hidden' value='" + subTaskList1[j].taskCode + "'/>"
							+ "<div class='i-div1'><div class='i-div1-div1 nameBox'>" 
							+ '이름 없는 테스크' + "</div><div class='dropdown2'><div class='select'><span id='user-list'></span>"
							+ "</div><ul class='dropdown2-menu'><li class='flagY'>"
							+ '플래그 추가' + "</li><li class='labelAdd'>" 
							+ '레이블 추가' + "</li><li class='taskDelete'>"
				            + '삭제' + "</li></ul></div></div><div class='i-div2 labelBox'></div><div class='i-div3'>"
						    + "<div class='i-div3-inner-left'><div class='sicon'>"
						    + 'S' + "</div><div class='i-div3-div-tcode'>" 
						    + 'TASK - ' + subTaskList1[j].taskCode + "</div></div><div class='i-div3-inner-right'><span class='i-div3-span-per'>"
						    + "</span><span class='i-div3-span-arrow important'></span><span class='i-div3-span-person'></span>"
						    + "</div></div></div></div>"
					)
				}	
			}
		}
	//하위테스크 미진행 그려주기 끝------------------------------------------------------------------------------------------------------------------
		
	//하위테스크 진행중 그려주기------------------------------------------------------------------------------------------------------------------
	if(subTaskList2 != null){
		for(var k = 0; k < subTaskList2.length; k++){

		//하위 테크스 리스트에서 headTaskCode 정보가 현재 반복문 실행중인 상위 테스크 코드와 같은 것이 있다면 
			if(subTaskList2[k].taskList.headTaskCode == selectedMainTaskList[i].taskCode){
				
				//현재 선택한 메인 테스크 outer 상자를 가져온다..			
				var target2 = $('#s' + selectedMainTaskList[i].taskCode);
				//console.log("하위에 테스크 있음");
			
				//진행중이기 때문에 해당 target 바로 하위에있는 piboard보드에 그려줘야한다.
				var targetSpecific = target2.find('#pboard'+ selectedMainTaskList[i].taskCode);
				
				//하위에 요소를 추가해준다.
				//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
				//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
				targetSpecific.append("<div class='mini-box t" + subTaskList2[k].taskCode + "' id='t" + subTaskList2[k].taskCode + "' draggable='true'><input type='hidden' value='" + subTaskList2[k].taskCode + "'/>"
						+ "<div class='p-div1'><div class='p-div1-div1 nameBox'>" 
						+ '이름 없는 테스크' + "</div><div class='dropdown2'><div class='select'><span id='user-list'></span>"
						+ "</div><ul class='dropdown2-menu'><li class='flagY'>"
						+ '플래그 추가' + "</li><li class='labelAdd'>" 
						+ '레이블 추가' + "</li><li class='taskDelete'>"
			            + '삭제' + "</li></ul></div></div><div class='p-div2 labelBox'></div><div class='p-div3'>"
					    + "<div class='p-div3-inner-left'><div class='sicon'>"
					    + 'S' + "</div><div class='p-div3-div-tcode'>" 
					    + 'TASK - ' + subTaskList2[k].taskCode + "</div></div><div class='p-div3-inner-right'><span class='p-div3-span-per'>"
					    + "</span><span class='p-div3-span-arrow important'></span><span class='p-div3-span-person'></span>"
					    + "</div></div></div></div>"
				)
			}	
		}
	}
	//하위테스크 미진행 그려주기 끝------------------------------------------------------------------------------------------------------------------
		
	//하위테스크 완료 그려주기------------------------------------------------------------------------------------------------------------------
	if(subTaskList3 != null){
		for(var l = 0; l < subTaskList3.length; l++){

		//하위 테크스 리스트에서 headTaskCode 정보가 현재 반복문 실행중인 상위 테스크 코드와 같은 것이 있다면 
			if(subTaskList3[l].taskList.headTaskCode == selectedMainTaskList[i].taskCode){
				
				//현재 선택한 메인 테스크 outer 상자를 가져온다..			
				var target3 = $('#s' + selectedMainTaskList[i].taskCode);
				//console.log("하위에 테스크 있음");
			
				//진행중이기 때문에 해당 target 바로 하위에있는 ciboard보드에 그려줘야한다.
				var targetSpecific = target3.find('#cboard'+ selectedMainTaskList[i].taskCode);
				
				//하위에 요소를 추가해준다.
				//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
				//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
				targetSpecific.append("<div class='mini-box t" + subTaskList3[l].taskCode + "' id='t" + subTaskList3[l].taskCode + "' draggable='true'><input type='hidden' value='" + subTaskList3[l].taskCode + "'/>"
						+ "<div class='c-div1'><div class='c-div1-div1 nameBox'>" 
						+ '이름 없는 테스크' + "</div><div class='dropdown2'><div class='select'><span id='user-list'></span>"
						+ "</div><ul class='dropdown2-menu'><li class='flagY'>"
						+ '플래그 추가' + "</li><li class='labelAdd'>" 
						+ '레이블 추가' + "</li><li class='taskDelete'>"
			            + '삭제' + "</li></ul></div></div><div class='c-div2 labelBox'></div><div class='c-div3'>"
					    + "<div class='c-div3-inner-left'><div class='sicon'>"
					    + 'S' + "</div><div class='c-div3-div-tcode'>" 
					    + 'TASK - ' + subTaskList3[l].taskCode + "</div></div><div class='c-div3-inner-right'><span class='c-div3-span-per'>"
					    + "</span><span class='c-div3-span-arrow important'></span><span class='c-div3-span-person'></span>"
					    + "</div></div></div></div>"
				)
			}	
		}
	}
	
	/* 만약 특정 메인 테스크에 관련 하위 테스크가 없다면 진행 상태 박스을 모두 제거해준다. */	
/* 	var cnt = 0;
	for(var a = 0; a < selectedSubTaskList.length; a ++){
		if(selectedMainTaskList[i].taskCode == selectedSubTaskList[a].taskList.headTaskCode){
			//하위테스크에 현재 상위 테스크 코드가 있다면 cnt 증가시켜준다.
			cnt += 1;
		}
	}
	//하위 테스크 리스트에 현재 상위 테스크가 하나도 없는 경우
	if(cnt == 0){
		//회색 진행 상태 상자 없애준다.
		//현재 선택한 메인 테스크 outer 상자를 오고	
		//바로 하위에있는 siboard보드 찾아서 지워준다.
		 $('#s' + selectedMainTaskList[i].taskCode).find('.wrapper').remove();
	} */
/* 만약 특정 메인 테스크에 관련 하위 테스크가 없다면 진행 상태 박스을 모두 제거해준다. 끝 */	
 
 
 
}
//하위 작업 기본 view 끝------------------------------------------------------------------------------------------------------------------


//2.하위테스크 세부 정보 입력 ------------------------------------------------------------------------------------------------------------------
if(subTaskList != null){
	
	//(1) 테스크명 가져오기 : 
	//테스크명 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//반복문으로  테스크 카테고리 코드가 J(테스크명 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < subTaskList.length; i++){
		var taskCode1 = 0;
		if(subTaskList[i].taskCategoryCode == 'J'){
			
			//테스크명 정보가 있는 행의 테스크 코드를 변수 taskCode1에 담는다.
			taskCode1 = subTaskList[i].taskCode;
			console.log("테스크명 표시할 테스크 코드 : " + taskCode1);
			
			//find()는 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용한다.
			//테스크명 정보를 가진 테스크코드(taskCode1)를 찾아놓았다.
			//테스트코드와 일치하는 '상자'에 테스크 명을 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode1 ); 
  		    //테스크 상자 안에 테스크명이 입력되는 요소를 찾고
  		    //<div class='nameBox'>이름 없는 테스크</div> 해당 요소 태그 사이에 이름을 넣어준다.
  		    taskBox.find('.nameBox').text(subTaskList[i].taskHistValue);
		}
	}
	
	
	//(2) 테스크우선순위(중요 표시) 가져오기 : 
	//상위테스크 전체 리스트(mainTaskList)에서 테스크우선순위(중요 표시) 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//테스크우선순위(중요 표시)는 high, medium, low로 나뉘어지며 화살표 아이콘으로 뷰페이지에 보여진다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 C(테스크우선순위 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < subTaskList.length; i++){
		var taskCode2 = 0;
		if(subTaskList[i].taskCategoryCode == 'C'){
			
			//테스크우선순위(중요 표시) 정보가 있는 행의 테스크 코드를 변수 taskCode2에 담는다.
			taskCode2 = subTaskList[i].taskCode;
			console.log("테스크우선순위 표시할 테스크 코드 : " + taskCode2);
			
			//찾은 테스트코드와 일치하는 '상자'에 테스크우선순위 정보를 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode2 ); 
		    
		    //테스크 상자 안에 테스크우선순위 정보가 입력되는 요소를 찾고
		    //<span class='important'>화살표 이미지 태그</span> 해당 요소 태그 사이에 중요도에 따른 화살표 이미지를 넣어준다.
            //중요도 확인
            //이미지의 경우 draggable 기본 값이 true라서 테스크 박스 드래그시 이미지가 따로 드래그 되는 현상이 발생하여
            //draggable false로 바꿔주고 테스크 박스와 함께 움직이도록 한다.
            if(subTaskList[i].taskHistValue == 'high'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_upward_red.png' draggable='false'>");
            }else if(subTaskList[i].taskHistValue == 'medium'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_upward_orange.png' draggable='false'>");
            }else if(subTaskList[i].taskHistValue == 'low'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_downward_green.png' draggable='false'>");
            }else{
            	console.log("테스크우선순위 데이터 잘못 입력함 DB 데이터 확인 필요, high, medium, low 외에 다른 값 있음")
            }
		}
	}
	
	
	//(3) 레이블 가져오기 : 
	//레이블 전체 리스트(mainTaskList)에서 레이블 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 N(레이블 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < subTaskList.length; i++){
		var taskCode3 = 0;
		if(subTaskList[i].taskCategoryCode == 'N'){
			
			//레이블 정보가 있는 행의 테스크 코드를 변수 taskCode4에 담는다.
			taskCode3 = subTaskList[i].taskCode;
			console.log("레이블 표시할 테스크 코드 : " + taskCode3);
			
			//찾은 테스트코드와 일치하는 '상자'에 레이블 정보를 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode3 ); 
		    
			//카테고리 코드가 N인것은 레이블인데, 레이블을 생성했다가 삭제한 경우
			//taskCategoryCode에는 "N"이 taskHistValue에는 null값이 들어가고
			//조회해보면 null은 "" 빈 문자열로 조회된다.
			//taskCategoryCode가 N이면서 레이블을 삭제하지 않는 경우에만 레이블을 표시해줘야 하므로
			//if 조건을 달아준다.
			if(subTaskList[i].taskHistValue != ""){
	  		    //테스크 상자 안에 레이블이 입력되야하는 요소를 찾고
	  		    //<div class='labelBox'></div> 해당 요소 태그 사이에 <span></span>태그 형태의 레이블을 넣어준다.
	  		    //span 회색 배경 css 양쪽에 약간 여백 주기 위해 &nbsp; 추가함
	  		    taskBox.find('.labelBox').html("<span class='label-css'>&nbsp;" + subTaskList[i].taskHistValue + "&nbsp;</span>");
		
				//기본 드롭다운 상자는 플래그 추가, 레이블 추가, 상위항목 변경, 이슈링크 복사, 삭제로 구성되어있다.
				//만약 해당 테스크에 레이블이 존재하여 레이블을 테스크 상자에 추가했다면,
				//테스크 상자 상세 설정에 있는 레이블 추가 기능을 레이블 제거 기능으로 바꾸어줘야한다. (추가가 이미 되었으니, 제거할 수 있어야 하기 때문에)
				//현재 테스크 상자의 하위 드롭다운리스트 중에서 레이블 추가기능 <li>태그 요소를 가져온다. 
				var label = taskBox.find('.labelAdd');
				//클래스 변경의 경우 attr 메소드를 활용한다.
				//예시 $(this).attr('class','변경할 클래스이름');
				//추가 삭제의 경우엔
				//$(this).addClass("클래스이름");
				//$(this).removeClass("클래스이름");
				label.attr('class', 'labelDelete');
				
				//<li></li>태그 안의 내용도 레이블 추가에서 레이블 삭제로 변경해준다.
				label.text("레이블 제거");
			}
		}
	}
	
	
	//(4) 플래그여부 가져오기 : 
	//플래그는 전체 리스트(mainTaskList)에서 플래그 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 E(플래그 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < subTaskList.length; i++){
		var taskCode4 = 0;
		if(subTaskList[i].taskCategoryCode == 'E'){
			
			//플래그 정보가 있는 행의 테스크 코드를 변수 taskCode3에 담는다.
			taskCode4 = subTaskList[i].taskCode;
			console.log("플래그여부 표시할 테스크 코드 : " + taskCode4);
			
			//찾은 테스트코드와 일치하는 '상자'에 플래그 정보를 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode4 ); 
		    
		    //플래그 정보가 있는경우 테스크 상자 class에 flag-true 클래스를 넣어준다.
		    //플래그 정보가 'Y'인 경우에만 표시해준다. 카테고리 코드가 E여도 플래그 여부가 N인 경우도 있기 때문에 꼭 if 조건으로 확인
		    if(subTaskList[i].taskHistValue == 'Y'){
		    	//플래그css 적용가능한 클래스 속성을 부여한다.
			    taskBox.addClass("flag-true");
				//기본 드롭다운 상자는 플래그 추가, 레이블 추가, 상위항목 변경, 이슈링크 복사, 삭제로 구성되어있다.
				//만약 해당 테스크에 플래그가 존재하여 플래그를 테스크 상자에 추가했다면,
				//테스크 상자 상세 설정에 있는 플래그 추가 기능을 플래그 제거 기능으로 바꾸어줘야한다. (추가가 이미 되었으니, 제거할 수 있어야 하기 때문에)
				//현재 테스크 상자의 하위 드롭다운리스트 중에서 플래그 추가기능 <li>태그 요소를 가져온다. 
				var flag = taskBox.find('.flagY');
				//클래스 변경의 경우 attr 메소드를 활용한다.
				//예시 $(this).attr('class','변경할 클래스이름');
				//추가 삭제의 경우엔
				//$(this).addClass("클래스이름");
				//$(this).removeClass("클래스이름");
				flag.attr('class', 'flagN');
				
				//<li></li>태그 안의 내용도 플래그 추가에서 플래그 삭제로 변경해준다.
				flag.text("플래그 제거");
		    }
		    
		}
	}
	//(5) 하위테스크 진행 비율 가져오기 ( n/m )
}	

//2.하위테스크 세부 정보 입력 끝-----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------------------------------------------------
//3.테스크 상자 드롭다운 상세 기능 시작-----------------------------------------------------------------------------------------------------------------
	//(1) 플래그 추가 기능 :
	//드롭다운 리스트에서 플래그 추가버튼을 클릭하면  실행
	//클릭 이벤트로는 ajax 보낸 후 한번밖에 진행이 안되서 document on으로 변경함
	$(document).on('click', '.flagY', function(){
	//$('.flagY').click(function(){
		//li > ul > dropdown div > c-div1 div > mini-box (테스크 상자)
		//$(this).parent().parent().parent().parent(); 테스크 상자까지 올라간다.
		//테스크 상자 하위에 있는 input type="hidden"요소 값에 담긴 테스크 코드를 가져온다.
		var taskCode = $(this).parent().parent().parent().parent().find('input').val();
		//코드 출력
		console.log("플래그 추가할 테스크 코드 " + taskCode);
		//ajax 시작
		$.ajax({
			url:"insertTaskHistoryFlagYes.tk",
			type:"post",
			dataType:"json",
			data:{"taskCode" : taskCode},
			success:function(data){
				console.log(data);
				//객체 값 꺼낼때 data. 으로 꺼낸다.
				console.log(data.result);
				//insert 한 result 값이 1인 경우 플래그 추가 성공
				if(data.result == 1){
					console.log("플래그 추가 성공");
					//플래그 추가를 한 테스크 상자 요소를 찾는다.
					var taskBox = $('#contentBox2-board').find( ".t" + taskCode );
			    	//플래그css 적용가능한 클래스 속성을 부여한다.
				    taskBox.addClass("flag-true");
					//드롭다운 리스트에 있는 플래그 추가 기능을 플래그 삭제 기능으로 바꾼다.
					var flag = taskBox.find('.flagY');
					flag.attr('class', 'flagN');
					//<li></li>태그 안의 내용도 플래그 추가에서 플래그 삭제로 변경해준다.
					flag.text("플래그 제거");
				}else{
					console.log("플래그 추가 실패");
				}
			},error:function(){
				console.log("플래그 추가 시도 오류");				
			}
		});
	});	
	
	//(2) 플래그 제거 기능 :
	//드롭다운 리스트에서 플래그 제거버튼을 클릭하면  실행
	//클릭 이벤트로는 ajax 보낸 후 한번밖에 진행이 안되서 document on으로 변경함
	$(document).on('click','.flagN', function(){
	//$('.flagN').click(function(){
		//li > ul > dropdown div > c-div1 div > mini-box (테스크 상자)
		//$(this).parent().parent().parent().parent(); 테스크 상자까지 올라간다.
		//테스크 상자 하위에 있는 input type="hidden"요소 값에 담긴 테스크 코드를 가져온다.
		var taskCode = $(this).parent().parent().parent().parent().find('input').val();
		//코드 출력
		console.log("플래그 삭제할 테스크 코드 " + taskCode);
		//ajax 시작
		$.ajax({
			url:"insertTaskHistoryFlagNo.tk",
			type:"post",
			dataType:"json",
			data:{"taskCode" : taskCode},
			success:function(data){
				console.log(data);
				console.log(data.result);
				//insert 한 result 값이 1인 경우 플래그 제거 성공
				if(data.result == 1){
					console.log("플래그 제거 성공");
					//플래그 제거 한 테스크 상자 요소를 찾는다.
					var taskBox = $('#contentBox2-board').find( ".t" + taskCode );
			    	//플래그css 적용가능한 클래스 속성을 제거한다.
				    taskBox.removeClass("flag-true");
					//드롭다운 리스트에 있는 플래그 제거 기능을 플래그 추가 기능으로 바꾼다.
					var flag = taskBox.find('.flagN');
					flag.attr('class', 'flagY');
					//<li></li>태그 안의 내용도 플래그 추가에서 플래그 추가로 변경해준다.
					flag.text("플래그 추가");
				}else{
					console.log("플래그 제거 실패");
				}
			},error:function(){
				console.log("플래그 제거 시도 오류");				
			}
		});
	});					

	//(3) 레이블 제거 기능 :
	//드롭다운 리스트에서 레이블 제거버튼을 클릭하면 실행
	$(document).on('click','.labelDelete', function(){
		//li > ul > dropdown div > c-div1 div > mini-box (테스크 상자)
		//$(this).parent().parent().parent().parent(); 테스크 상자까지 올라간다.
		//테스크 상자 하위에 있는 input type="hidden"요소 값에 담긴 테스크 코드를 가져온다.
		var taskCode = $(this).parent().parent().parent().parent().find('input').val();
		//코드 출력
		console.log("레이블 제거할 테스크 코드 " + taskCode);
		//ajax 시작
		$.ajax({
			url:"insertTaskHistoryLabelNo.tk",
			type:"post",
			dataType:"json",
			data:{"taskCode" : taskCode},
			success:function(data){
				console.log(data);
				console.log(data.result);
				//insert 한 result 값이 1인 경우 레이블 제거 성공
				if(data.result == 1){
					console.log("레이블 제거 성공");
					//레이블 제거 한 테스크 상자 요소를 찾는다.
					var taskBox = $('#contentBox2-board').find( ".t" + taskCode );
					//레이블 상자 안에있는 레이블 span 요소를 없앤다.
				    taskBox.find('.labelBox').html("");
					//드롭다운 리스트에 있는 레이블 제거 기능을 레이블 추가 기능으로 바꾼다.
					var label = taskBox.find('.labelDelete');
					label.attr('class', 'labelAdd');
					//<li></li>태그 안의 내용도 레이블 추가에서 레이블 추가로 변경해준다.
					label.text("레이블 추가");
				}else{
					console.log("레이블 제거 실패");
				}
			},error:function(){
				console.log("레이블 제거 시도 오류");				
			}
		});
	});			

	//(4) 테스크 삭제 기능 :
	//드롭다운 리스트에서 테스크 삭제 버튼을 클릭하면 실행
	$(document).on('click','.taskDelete', function(){
		//li > ul > dropdown div > c-div1 div > mini-box (테스크 상자)
		//$(this).parent().parent().parent().parent(); 테스크 상자까지 올라간다.
		//테스크 상자 하위에 있는 input type="hidden"요소 값에 담긴 테스크 코드를 가져온다.
		var taskCode = $(this).parent().parent().parent().parent().find('input').val();
		//코드 출력
		console.log("삭제할 테스크 코드 " + taskCode);
		//ajax 시작
		$.ajax({
			url:"insertTaskHistoryTaskDelete.tk",
			type:"post",
			dataType:"json",
			data:{"taskCode" : taskCode},
			success:function(data){
				console.log(data);
				console.log(data.result);
				//insert 한 result 값이 1인 경우테스크 삭제 성공
				if(data.result == 1){
					console.log("테스크 삭제 성공");
					//삭제할 테스크 상자 요소를 찾는다.
					var taskBox = $('#contentBox2-board').find( ".t" + taskCode );
					//상자를 제거한다.
					taskBox.remove();
				}else{
					console.log("테스크 삭제 실패");
				}
			},error:function(){
				console.log("테스크 삭제 시도 오류");				
			}
		});
	});	

	
//3.테스크 상자 드롭다운 상세 기능 끝-----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------


//추가 설정 버튼 드롭다운 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$(document).on('click','.dropdown', function(){
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
});

$(document).on('focusout','.dropdown', function(){
	$(this).removeClass('active');
	$(this).find('.dropdown-menu').slideUp(300);
});

/* li 태그 클래스 값 input에 담아주기  id > class로 변경 */
$(document).on('click','.dropdown .dropdown-menu li', function(){
		/* $(this).parents('.dropdown').find('span').text($(this).text()); */
		$(this).parents('.dropdown').find('input').attr('value',$(this).attr('class'));
});
//선택 내용 글자 넣어주는 것 빼기
$(document).on('click','.dropdown-menu li', function(){
		var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
}); 
//추가 설정 버튼 드롭다운 끝----------------------------------------------------------------------

//그룹화 버튼 드롭다운 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$(document).on('click','.dropdown1', function(){
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown1-menu').slideToggle(300);
});

$(document).on('focusout','.dropdown1', function(){
	$(this).removeClass('active');
	$(this).find('.dropdown1-menu').slideUp(300);
});

/* li 태그 클래스 값 input에 담아주기  id > class로 변경 */
$(document).on('click','.dropdown1 .dropdown1-menu li', function(){
		$(this).parents('.dropdown1').find('span').text($(this).text());
		$(this).parents('.dropdown1').find('input').attr('value',$(this).attr('class'));
});
//선택 내용 글자 넣어주는 것 빼기
$(document).on('click','.dropdown1-menu li', function(){
		var input = '<strong>' + $(this).parents('.dropdown1').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
}); 
//그룹화 버튼 드롭다운 끝----------------------------------------------------------------------


/* 테스크 상자 드래그 앤 드롭 기능-------------------------------------------------------------------------------------------------------------------------- */
	
//html5에는 드래그 앱 드롭을 위한 전용 api가 제공된다.
//1-1. 드래그 대상 : 끌어올 것에 해당한다. 요소에 draggable 속성 값을 true로 하면 드래그 대상이 될 수 있다.
//attr(속성명, 속성값) 이용해서 draggable 속성을 추가한다.

//1-2. 드래그 대상 정의 이벤트 : dragstart 
//드래그가 시작될 때 발생하며 드래그 대상에서 이동할 데이터를 DataTransfer 객체에 채운다.
//dataTransfer 객체에 이동할 요소의 ID를 "text"라는 이름으로 등록함

//드래그할 요소 담을 변수 선언
var dragged;

//드래그 시작시
document.addEventListener("dragstart", function(event) {
  //현재 드래그 이벤트에서 드래그할 요소를 변수에 담는다
  console.log("드래그 시작");
  dragged = event.target;
}, false);

/* 드롭 대상에서 이벤트 발생 */
//2. 드롭 대상 : 끌어다 놓을 곳을 의미한다. html 요소들은 기본값으로 드롭을 받아들이지 않게 되어있기 때문에 
//드롭이 가능하도록 하려면 기본값을 취소해 주어야한다.
//드롭 대상은 각 테스크 상태 회색 박스
//드롭할 대상 영역에 드롭오버시에 실행할 이벤트
document.addEventListener("dragover", function(event) {
	// 드롭을 허용하도록 prevetDefault() 호출
	event.preventDefault();
	console.log("드래그 오버");
}, false);
//드롭 대상영역 안으로 들어갔을 때 실행할 이벤트
document.addEventListener("dragenter", function(event) {
	// 요소를 드롭하려는 대상 위로 드래그했을 때 대상의 배경색 변경
	if (event.target.className == "dropzone") {
		console.log("드래그 엔터");
		event.target.style.background = "#F0ACC4"; 
	  //약간 핑크색으로 변경, 플래그 색상 투명도 준것 때문에 테스크 상자 색상도 같이 변해서 핑크색 계열로 줌.
	}
}, false);
//드롭 대상 영역에서 벗어났을 때 실행할 이벤트
document.addEventListener("dragleave", function(event) {
  // 요소를 드래그하여 드롭하려던 대상으로부터 벗어났을 때 배경색 원래 색으로 리셋해준다.
  if (event.target.className == "dropzone") {
	console.log("드래그 리브");  
	event.target.style.background = ""; 
  }
}, false);



/* 드래그드롭 계속~~~~~~~~~~~ 안되서 요소 클릭하고 드롭 하는 것 확인함 */
/* 드롭존에 클래스명 2개 이상 쓰면 드래그드롭 안됨 !!!! 주~~~~~~의~~~~~~할 것 */
$("body").click(function(event){
    console.log("무엇을 클릭했을 까요? " + event.target.id);
});

$(document).on('drop', function(event){
    console.log("무엇을 드롭했을 까요? " + event.target.id);
});


//드롭시에 실행할 이벤트
//드롭이 정상적으로 완료되면 task 진행상태를 변경하여 taskHistory에 taskHistvalue를 추가 하는 ajax를 실행한다.
document.addEventListener("drop", function(event) {
  // 기본 액션을 막음 (링크 열기같은 것들)
	event.preventDefault();
	//console.log("드롭1");  
  // 드래그한 요소를 드롭 대상으로 이동 후 드롭 성공
  // 드롭 영역에 드롭했을 경우에만 css 리셋 해주고 append 해준다.
   if (event.target.className == "dropzone") {
	  	//console.log("드롭2");  
	    event.target.style.background = "";
	    //드래그 대상에서 이동할 데이터 삭제
		//console.log("실행");
	    dragged.parentNode.removeChild( dragged );
	    //드롭 대상(현재 타겟)에 데이터 추가
	    event.target.appendChild( dragged );
	    //드롭 완료 후 이벤트 버블링을 막기 위해 호출           
	    event.stopPropagation();  
	    //현재 드래그한 요소 dragged 테스크 상자에 담긴 테스크 코드를 가져온다.
	    //id 속성을 가져오는데, t+테스크 코드로 구성되어있기 때문에 앞에 t 문자를 제외해준 테스크 코드를 찾는다.
	    var str1 = dragged.getAttribute("id");
	    //시작위치,종료위치
	    var taskCode = str1.substring(1, str1.length);
	    console.log("드롭 다운으로 진행 상태 변경할 taskCode : " + taskCode);
	    //드롭하여 현재 위치해있는 진행상태 상자의 아이디를 가져온다.
	    //#iboard + 테스크 코드, #pboard + 테스크 코드, #cboard + 테스크 코드
	    //앞글자가 i면 미진행, p면 진행중, c면 완료이다.
	    var str2 = dragged.parentNode.getAttribute("id").substring(0, 1);
	    var taskHistValue ="";
	    if(str2 === "i"){
	    	taskHistValue = "미진행";
	    }else if(str2 === "p"){
	    	taskHistValue = "진행중";
	    }else if(str2 === "c"){
	    	taskHistValue = "완료";
	    }
	    console.log("드롭 다운으로 진행 상태 변경할 taskHistValue : " + taskHistValue);
	    
		//하위 테스크의 진행상태 테스크 히스토리 insert ajax 시작
		$.ajax({
			url:"insertTaskHistoryTaskProceeding.tk",
			type:"post",
			dataType:"json",
			data:{"taskCode" : taskCode, "taskHistValue" : taskHistValue},
			success:function(data){
				console.log(data);
				console.log(data.result);
				//insert 한 result 값이 1인 경우 테스크 진행 상태 변경 성공
				if(data.result == 1){
					console.log("테스크 진행 상태 변경 성공");
				}else{
					console.log("테스크 진행 상태 변경 실패");
				}
			},error:function(){
				console.log("테스크 진행 상태 변경 오류");				
			}
		});
		
		//하위 테스크의 테스크 리스트 정보 중 헤드 테스트 코드 업데이트 ajax 시작 
		//다른 상위 테스크 보드로 드래그 드롭하는 경우에만 변경해줌
		//위치이동해서 현재 들어가있는 상위 테스크 아이디
	 	var dropzoneId = event.target.parentNode.parentNode.getAttribute("id")
		//console.log("위치이동해서 현재 들어가있는 상위 테스크 아이디 : " + dropzoneId);
		//한자리문자 + 테스크 코드로 이루어져있어서 앞의 한글자 빼주고 테스크 코드 얻는다.
	 	//드래드드롭 이벤트 이후 현재 소속되어있는 상위 테스크 코드
		var headTaskCode = dropzoneId.substring(1, dropzoneId.length);
		//만약 이 코드와 기존에 가지고있던 headTaskCode가 같다면 update해주지 않고,
		//기존과 다르다면 하위 테스크의 headTaskCode를 업데이트 해준다.
		//우선 기존 headTaskCode조회한다.
		var i = 0;
		for(var i = 0; i < selectedSubTaskList.length; i++){
			if(selectedSubTaskList[i].taskCode == taskCode && selectedSubTaskList[i].taskList.headTaskCode != headTaskCode){
				$.ajax({
					url:"updateTaskListHeadTaskCode.tk",
					type:"post",
					dataType:"json",
					data:{"taskCode" : taskCode, "headTaskCode" : headTaskCode},
					success:function(data){
						console.log(data);
						console.log(data.result);
						//insert 한 result 값이 1인 경우 테스크 진행 상태 변경 성공
						if(data.result == 1){
							console.log("headTaskCode 변경 성공");
						}else{
							console.log("headTaskCode 변경 실패");
						}
					},error:function(){
						console.log("headTaskCode 변경 오류");				
					}
				});	
			}
		}
  	}
}, false);

/* 테스크 상자 드래그 앤 드롭 기능 끝-------------------------------------------------------------------------------------------------------------------------- */



/* 레이블 추가 관련 모달창 시작----------------------------------------------------------------------------------------------------------------*/
//모달 안에서 검색 기능 구현하기 : 모달 열면서 모달에 값 주기, 모달에 있는 값 얻어서 Ajax로 검색하기

//0.레이블 추가 모달창에서 닫기 버튼을 누르면 모달이 닫히도록 함수 실행
/* function closeModal3() { */
$(document).on('click','.modal3-close', function(){
 		$("#myModal3").css('display','none');
 		//닫기 버튼 클릭 후 모달 안에 있는 input 태그 값 초기화 해줌
 		$('#searchLabel').val('');
 		$('#labelName').val('');
 		$('#labelTaskCode').val('');
 		$('#labelProjectCode').val('');
 		//모달의 제목부분 p태그 검색하여 초기화해줌
 		$("#myModal3").find("p").text('');
 });

//1.레이블 추가 버튼 클릭시 함수를 실행하여 모달을 열고, 모달 열자마자 모달 안에있는 input type hidden에 필요한 정보를 담는다.
$(document).on('click','.labelAdd', function(){
	 // 테스크 상자의 드롭다운 메뉴에서 레이블 추가버튼 클릭시 모달 띄워주기 
     $("#myModal3").fadeIn(300); 
     $("#myModal3").css('display','block');
     // 클릭한 테스크 상자의 테스크 코드 가져오기
     var taskCode = $(this).parent().parent().parent().parent().find('input').val();
     
     //제목 적어주기
     //레이블 추가 모달창 제목 부분에 Task - "테스크코드 번호"에 레이블 추가를 넣어준다.
     $("#myModal3").find("p").text("TASK - " + taskCode + " 에 레이블 추가");
	
     //테스크 상자 하위에 있는 input type="hidden" id="labelTaskCode"요소 값에 레이블을 추가할 테스크 코드 정보를 넣어준다.
	//모달 열리자 마자 테스크 코드 정보 모달에 담아줌
	var labelTaskCode = $('#labelTaskCode').val(taskCode);
     
     //테스크 상자 하위에 있는 input type="hidden" id="labelProjectCode"요소 값에 레이블 리스트를 검색할 현재 프로젝트코드 정보를 넣어준다.
	 $('#labelProjectCode').val(taskList[0].taskList.project.projectCode);
     
	});
 
 
//2. 실시간 검색을 할 input 상자에 값을 입력하면 실행할 함수 작성한다. 함수에는  hidden input에 담겨있는 프로젝트 코드 값을 가져온다.
function searchLabel(){
	//프로젝트 코드 정보 가져오기, 모달 띄울 때 이미 넣어놓은 정보.
	var projectCode = $('#labelProjectCode').val();
     console.log("레이블 리스트를 조회할 프로젝트 코드 : " + projectCode);
   	//검색할 레이블 값 가져오기(input 상자에 입력한 값)
 	var searchLabel = $("#searchLabel").val();
 	console.log("input 상자에 입력한 레이블 검색어 : " + searchLabel);
 	$.ajax({
 		url:"selectLabelList.tk",
 		type:"post",
 		dataType : "json",
 		data: {
 			"projectCode" : projectCode, //프로젝트 코드 정보
 			"searchLabel" : searchLabel //검색할 레이블 값
 			}, 
 		success: function(data){
 				console.log("----- 리스트 조회 성공 ------");
  				//date.리스트 명으로 컨트롤러에서 보낸 정보 받아옴
  				 for(var i = 0; i < data.taskHistoryList.length; i++){
  					console.log(data.taskHistoryList[i].taskHistValue);
  				}  
  				
 				//리스트 추가를 위해 datalist 상자 가져오기
  				var searchLabelList = $('#searchLabelList');
 				//기존에 있는 option 내용물 전부 지우기
 				searchLabelList.children().remove();
 				
 				//반복문으로 option 태그에 리스트 담아주기
 				//가져온 레이블 리스트를 담아줄 때 중복이있는지 확인하여 중복없이 출력한다.
  				//배열 만들어주고 조회해온 레이블 리스트 값을 하나씩 넣어준다.
  				var arr = [];
 				for(var i = 0; i < data.taskHistoryList.length; i++){
					//indexOf 사용하여 이전에 배열에 같은 값을 넣어준 것이 있는지 확인함	
					//indexOf는 배열 안에서 찾고자하는 것의 위치를 알려준다. 찾는것이 없으면 -1 결과를 반환함.
					//배열 안에서 값을 찾을 때 반복문 사용안하고 바로 찾을 수 있다.
					//기존 배열에 현재 추가할 list 값이 있는지 확인 후, 없다면 배열에 넣고 option 태그에 추가한다.
					if(arr.indexOf(data.taskHistoryList[i].taskHistValue) == -1){
	 					arr.push(data.taskHistoryList[i].taskHistValue);
  						searchLabelList.append("<option value ='" + data.taskHistoryList[i].taskHistValue + "'>");
					}
 				}
 			}, error: function(){
 				console.log("리스트 가져오기 실패");
 			}
 		});
 }
 
//3.레이블 등록 폼 전송
//전송 버튼 클릭시 함수 실행  
//폼 전송 전에 등록할 정보를 확인 후에 조건에 맞으면 전송한다.
$(document).on('click','#formContentCheck3', function(){
	//등록할 레이블 정보 form에 담아주기
	//입력해놓은 레이블 정보 #searchLabel input 상자의 값을 form에있는 #labelName input 상자에 담는다.
	//입력한 내용이 리스트에 있는 내용과 정확히 일치하지 않더라도 레이블 등록 가능(추가로 레이블 등록하는 것이라 가능하다.)
	$('#labelName').val($('#searchLabel').val());
	
	//만약 전송 버튼 클릭 시점에 form 안에 있는 레이블 정보가 비어있다면	
	if($('#labelName').val() == "") {
        alert("등록할 내용을 입력해주세요");
        //아래는 더이상 실행하지 않는다.
        return false;
	}else{
	//전송할 폼의 이름은 LabelYesForm
	//등록할 레이블 정보가 비어있지 않다면 폼을 전송하여 레이블을 추가한다.
		$('#LabelYesForm').submit();
	}
});

/* 레이블 추가 관련 모달창 끝 ----------------------------------------------------------------------------------------------------------------*/


/* 검색상자 focus 이벤트 시작 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
$(document).on('focus','#searchBox', function(){
 	$('#searchBox').css("width","250px");
 	$('#searchBoxInput').css("width","170px");
});

//blur는 포커스 아웃될 때 실행되는 함수이다.
$(document).on('blur','#searchBox', function(){
 	$('#searchBox').css("width","170px");
 	$('#searchBoxInput').css("width","100px");
});

/* 검색상자 focu시 이벤트 끝---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

		

	
	
	




//하위 테스크 추가 설정 버튼 드롭다운 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$(document).on('click','.dropdown2', function(){
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown2-menu').slideToggle(300);
});

$(document).on('focusout','.dropdown2', function(){
	$(this).removeClass('active');
	$(this).find('.dropdown2-menu').slideUp(300);
});

/* li 태그 클래스 값 input에 담아주기  id > class로 변경 */
$(document).on('click','.dropdown2 .dropdown2-menu li', function(){
		/* $(this).parents('.dropdown').find('span').text($(this).text()); */
		$(this).parents('.dropdown2').find('input').attr('value',$(this).attr('class'));
});

//선택 내용 글자 넣어주는 것 빼기
$(document).on('click','.dropdown2-menu li', function(){
		var input = '<strong>' + $(this).parents('.dropdown2').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
}); 
//하위 테스크 추가설정 버튼 드롭다운 끝----------------------------------------------------------------------


/* 그룹화 필터에 하위작업 버튼을 누르면 하위 작업 페이지로 이동하는 함수를 실행한다.*/
$(document).on('click','#groupBySub', function(){
	location.href="showTaskBoardMainSubGroup.tk";
});

//만약 그룹화 기준을 하위작업에서 없음으로 초기화 할 시엔
//테스크 보드 메인페이지 조회하는 컨트롤러로 보내서 현재 페이지를 다시 로딩한다.
$(document).on('click','#groupByNone', function(){
	location.href="showTaskBoardMain.tk";
});
/* 그룹화 기준 : 하위 작업 끝 -------------------------------------------------------------------------------------------------------------------------------------------- */


//display의 상태를 확인하여 보여줄지 감출지 선택할 수 있다.
/* 상위 테스크 타이틀바 클릭시 해당 상위 테스크의 하위 테스크 목록 안보이게 하기 */
$(document).on('click','.sTitle', function(event){
	//이벤트 요소의 상위 요소를 가져온다.
	var outerBoxId= event.target.parentNode.getAttribute("id");

	//숨길 요소를 찾는다.
	//.css("display") == "none" 안보이는 상태인지 조건으로 확인한다.
	if($('#' + outerBoxId + ' .wrapper').css("display") == "none"){
		//클릭한 타이틀바의 상위 요소인 .outerBox의 고유 id 가져와서, 그 아이디 하위에 있는 wrapper 보여준다.
		$('#' + outerBoxId + ' .wrapper').show();
		//현재 클릭한 이벤트의 스타일 리셋해주기
		event.target.style.background = ""; 
	//반대의 경우
	}else{
		$('#' + outerBoxId + ' .wrapper').hide();
		//숨기기 이벤트 실행한 타이틀바는 색상 변경해줌
		//현재 클릭한 이벤트의 스타일 변경
		event.target.style.background = "rgba(43, 43, 73, 0.2)";
	}
});


</script>
</html>