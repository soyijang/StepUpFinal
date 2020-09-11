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
				<div id="contentBox1-subtitle">스프린트 상세 설명</div>
				<!-- 기본 기능 버튼 table -->
				<table id="contentBox1-table">
					<tr>
						<td id="contentBox1-table-td1"><div id="searchBox"><input type="text"/><img id="icon-searchicon" src="/agile/resources/icon/common/icon_searchicon.png"></div></td>
						<td id="contentBox1-table-td2">사람 추가</td>
						<td id="contentBox1-table-td3"><div id="sprint-finish">스프린트 완료</div></td>
						<td id="contentBox1-table-td4"><div>검색색 필터</div></td>
						<td id="contentBox1-table-td5"><div id="group-standard">그룹화 기준</div></td>
						<td id="contentBox1-table-td6"><div class="dropdown">그룹화 필터</div></td>
					</tr>
				</table>
       		</div>
       		<div id="contentBox2">
       			<div id="contentBox2-title">
       				<div id="incomplete-title">미진행</div>
					<div id="proceeding-title">진행중</div>	
					<div id="complete-title">진행완료</div>	
       			</div>
       			<div id="contentBox2-board">
       							
<!-- 미진행 보드 시작----------------------------------------------------------------------------------------------------------->	
	       			<div id="i-board">
						<div class="i-mini-box flag-true">
	       					<div class="i-div1">
								<div class="i-div1-div1">테스크명 </div>
								<div class="dropdown i-div1-drop1">
							        <div class="select">
							            <span id="user-list"></span>
							            <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li class="work">플래그 추가</li>
							          <li class="rest">레이블 추가</li>
							          <li class="travel1">상위항목 변경</li>
							          <li class="travel2">이슈링크 복사</li>
							          <li class="travel3">삭제</li>
							        </ul>
								 </div>
		       				</div>		
		       				<div class="i-div2"></div>
							<div class="i-div3">
								<div class="i-div3-inner-left">
									<div class="i-div3-div-type">T</div>
									<span class="i-div3-span-tcode">코드입력</span>
								</div>
								<div class="i-div3-inner-right">
									<span class="i-div3-span-per">2/4</span>
									<span class="i-div3-span-arrow"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></span>
									<span class="i-div3-span-person"></span>
								</div>
							</div>
	       				</div><div class="i-mini-box flag-true">
	       					<div class="i-div1">
								<div class="i-div1-div1">테스크명 </div>
								<div class="dropdown i-div1-drop1">
							        <div class="select">
							            <span id="user-list"></span>
							            <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li class="work">플래그 추가</li>
							          <li class="rest">레이블 추가</li>
							          <li class="travel1">상위항목 변경</li>
							          <li class="travel2">이슈링크 복사</li>
							          <li class="travel3">삭제</li>
							        </ul>
								 </div>
		       				</div>		
		       				<div class="i-div2"></div>
							<div class="i-div3">
								<div class="i-div3-inner-left">
									<div class="i-div3-div-type">T</div>
									<span class="i-div3-span-tcode">코드입력</span>
								</div>
								<div class="i-div3-inner-right">
									<span class="i-div3-span-per">2/4</span>
									<span class="i-div3-span-arrow"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></span>
									<span class="i-div3-span-person"></span>
								</div>
							</div>
	       				</div>
	       			</div>
<!-- 미진행 보드 끝----------------------------------------------------------------------------------------------------------->	
	       			
<!-- 진행 보드 시작----------------------------------------------------------------------------------------------------------->	
	       			<div id="p-board">
						<div class="p-mini-box flag-true">
	       					<div class="p-div1">
								<div class="p-div1-div1">테스크명 </div>
								<div class="dropdown p-div1-drop1">
							        <div class="select">
							            <span id="user-list"></span>
							            <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li class="work">플래그 추가</li>
							          <li class="rest">레이블 추가</li>
							          <li class="travel1">상위항목 변경</li>
							          <li class="travel2">이슈링크 복사</li>
							          <li class="travel3">삭제</li>
							        </ul>
								 </div>
		       				</div>		
		       				<div class="p-div2"></div>
							<div class="p-div3">
								<div class="p-div3-inner-left">
									<div class="p-div3-div-type">T</div>
									<div class="p-div3-div-tcode">코드입력</div>
								</div>
								<div class="p-div3-inner-right">
									<span class="p-div3-span-per">2/4</span>
									<span class="p-div3-span-arrow"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></span>
									<span class="p-div3-span-person"></span>
								</div>
							</div>
	       				</div>
	       			</div>
<!-- 진행 보드 끝----------------------------------------------------------------------------------------------------------->	
	        			
<!-- 완료 보드 시작----------------------------------------------------------------------------------------------------------->	
	       			<div id="c-board">
						<div class="c-mini-box flag-true">
	       					<div class="c-div1">
								<div class="c-div1-span1">테스크명 </div>
								<div class="dropdown c-div1-drop1">
							        <div class="select">
							            <span id="user-list"></span>
							            <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li class="work">플래그 추가</li>
							          <li class="rest">레이블 추가</li>
							          <li class="travel1">상위항목 변경</li>
							          <li class="travel2">이슈링크 복사</li>
							          <li class="travel3">삭제</li>
							        </ul>
								 </div>
		       				</div>		
		       				<div class="c-div2"></div>
							<div class="c-div3">
								<div class="c-div3-inner-left">
									<div class="c-div3-div-type">T</div>
									<div class="c-div3-div-tcode">코드입력</div>
								</div>
								<div class="c-div3-inner-right">
									<span class="c-div3-span-per">2/4</span>
									<span class="c-div3-span-arrow"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></span>
									<span class="c-div3-span-person"></span>
								</div>
							</div>
	       				</div>
	       			</div>
<!-- 완료 보드 끝----------------------------------------------------------------------------------------------------------->	
       			</div>
       		</div>
		</div>
	</div>
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

//상위 테스크  리스트 출력
//object랑 문자랑 같이 출력하면 출력 안됨
var mainTaskList1 = JSON.parse('${mainTaskList1}');
var mainTaskList2 = JSON.parse('${mainTaskList2}');
var mainTaskList3 = JSON.parse('${mainTaskList3}');
console.log("중복제거 상위 테스크");
console.log("중복제거 상위 테스크 미진행");
console.log(mainTaskList1); //미진행
console.log("중복제거 상위 테스크 진행중");
console.log(mainTaskList2); //진행중
console.log("중복제거 상위 테스크 완료");
console.log(mainTaskList3); //완료


//하위 테스크 리스트 출력
console.log("중복제거 하위 테스크");
console.log("중복제거 하위 테스크 미진행");
var subTaskList1 = JSON.parse('${subTaskList1}');
console.log("중복제거 하위 테스크 진행중");
var subTaskList2 = JSON.parse('${subTaskList2}');
console.log("중복제거 하위 테스크 완료");
var subTaskList3 = JSON.parse('${subTaskList3}');
console.log(subTaskList1); //미진행
console.log(subTaskList2); //진행중
console.log(subTaskList3); //완료


/* 
window.onload = function(){
	 기존꺼 지우기 
	var pBoard = $('#pBoard');
	var cBoard = $('#cBoard');
	
	pBoard.children().remove();
	cBoard.children().remove();	
	
};
 */

//----------------------------------------------------------------------------------------------------------------------------------
//그룹화 기준 : 없음 (기본 화면)일 때  ----------------------------------------------------------------------------------------------------------
//1.상위테스크 기본정보 입력-----------------------------------------------------------------------------------------------------------------
//(1) 상위 테스크  : 미진행 (정보는 mainTaskList1에 담겨있다)
if(mainTaskList1 != null){
	
	//기존 미진행 박스 안에 내용 지우기
	var iBoard = $('#i-board');
	iBoard.children().remove();
	
	//리스트 길이만큼 반복
	 for(var i = 0; i < mainTaskList1.length; i++){
		
		//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
		//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
		//테스크 박스 하위에 input type=hidden을 만들어주고, 요소 값에 테스크 코드를 넣어준다.
		iBoard.append("<div class='i-mini-box t" + mainTaskList1[i].taskCode + "'><input type='hidden' value='" + mainTaskList1[i].taskCode + "'/>"
				+ "<div class='i-div1'><div class='i-div1-div1 nameBox'>" 
				+ '이름 없는 테스크' + "</div><div class='dropdown i-div1-drop1'><div class='select'><span id='user-list'></span>"
				+ "<i class='fa fa-chevron-left'></i></div><ul class='dropdown-menu'><li class='flagY'>"
				+ '플래그 추가' + "</li><li class='labelAdd'>" 
				+ '레이블 추가' + "</li><li class='changeUpperCategoty'>"
	            + '상위항목 변경' + "</li><li class='issueLink'>" 
	            + '이슈링크 복사' + "</li><li class='taskDelete'>"
	            + '삭제' + "</li></ul></div></div><div class='i-div2 labelBox'></div><div class='i-div3'>"
			    + "<div class='i-div3-inner-left'><div class='i-div3-div-type'>"
			    + 'T' + "</div><div class='i-div3-div-tcode'>" 
			    + 'TASK - ' + mainTaskList1[i].taskCode + "</div></div><div class='i-div3-inner-right'><span class='i-div3-span-per'>"
			    + '2/4' + "</span><span class='i-div3-span-arrow important'></span><span class='i-div3-span-person'></span>"
			    + "</div></div></div></div>"
			    
		)
 	} 
}

//(2) 상위 테스크  : 진행중 (정보는 mainTaskList2에 담겨있다)
if(mainTaskList2 != null){
	
	//기존 진행중 박스 안에 내용 지우기
	var pBoard = $('#p-board');
	pBoard.children().remove();
	
	//리스트 길이만큼 반복
	 for(var i = 0; i < mainTaskList2.length; i++){
		
		//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
		//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
		pBoard.append("<div class='p-mini-box t" + mainTaskList2[i].taskCode + "'><input type='hidden' value='" + mainTaskList2[i].taskCode + "'/>"
				+ "<div class='p-div1'><div class='p-div1-div1 nameBox'>" 
				+ '이름 없는 테스크' + "</div><div class='dropdown p-div1-drop1'><div class='select'><span id='user-list'></span>"
				+ "<i class='fa fa-chevron-left'></i></div><ul class='dropdown-menu'><li class='flagY'>"
				+ '플래그 추가' + "</li><li class='labelAdd'>" 
				+ '레이블 추가' + "</li><li class='changeUpperCategoty'>"
	            + '상위항목 변경' + "</li><li class='issueLink'>" 
	            + '이슈링크 복사' + "</li><li class='taskDelete'>"
	            + '삭제' + "</li></ul></div></div><div class='p-div2 labelBox'></div><div class='p-div3'>"
			    + "<div class='p-div3-inner-left'><div class='p-div3-div-type'>"
			    + 'T' + "</div><div class='p-div3-div-tcode'>" 
			    + 'TASK - ' + mainTaskList2[i].taskCode + "</div></div><div class='p-div3-inner-right'><span class='p-div3-span-per'>"
			    + '2/4' + "</span><span class='p-div3-span-arrow important'></span><span class='p-div3-span-person'></span>"
			    + "</div></div></div></div>"
		)
 	} 
}

//(3) 상위 테스크  : 진행중 (정보는 mainTaskList3에 담겨있다)
if(mainTaskList3 != null){
	
	//기존 진행중 박스 안에 내용 지우기
	var cBoard = $('#c-board');
	cBoard.children().remove();
	
	//리스트 길이만큼 반복
	 for(var i = 0; i < mainTaskList3.length; i++){
		
		//각각의 테스크 박스의 클래스 안에 클래스명으로 고유 테스크 코드를 넣어준다.t + 테스크 코드 (숫자로 시작하면 안되서 t로 시작)
		//테스크명은 기본적으로 이름 없는 테스크로 정해주고, 하단에서 테스크 관련 상세 정보를 표시할 때, 이름 정보가 있는 것들만 변경해준다. (테스크 생성시 이름이 필수적으로 생성되는 것이 아니라서)
		cBoard.append("<div class='c-mini-box t" + mainTaskList3[i].taskCode + "'><input type='hidden' value='" + mainTaskList3[i].taskCode + "'/>"
				+ "<div class='c-div1'><div class='c-div1-div1 nameBox'>" 
				+ '이름 없는 테스크' + "</div><div class='dropdown c-div1-drop1'><div class='select'><span id='user-list'></span>"
				+ "<i class='fa fa-chevron-left'></i></div><ul class='dropdown-menu'><li class='flagY'>"
				+ '플래그 추가' + "</li><li class='labelAdd'>" 
				+ '레이블 추가' + "</li><li class='changeUpperCategoty'>"
	            + '상위항목 변경' + "</li><li class='issueLink'>" 
	            + '이슈링크 복사' + "</li><li class='taskDelete'>"
	            + '삭제' + "</li></ul></div></div><div class='c-div2 labelBox'></div><div class='c-div3'>"
			    + "<div class='c-div3-inner-left'><div class='c-div3-div-type'>"
			    + 'T' + "</div><div class='c-div3-div-tcode'>" 
			    + 'TASK - ' + mainTaskList3[i].taskCode + "</div></div><div class='c-div3-inner-right'><span class='c-div3-span-per'>"
			    + '2/4' + "</span><span class='c-div3-span-arrow important'></span><span class='c-div3-span-person'></span>"
			    + "</div></div></div></div>"
		)
 	} 
}

//1.상위테스크 기본정보 입력 끝-----------------------------------------------------------------------------------------------------------------

//2.상위테스크 세부 정보 입력 ------------------------------------------------------------------------------------------------------------------
if(mainTaskList != null){
	
	//(1) 테스크명 가져오기 : 
	//상위테스크 전체 리스트(mainTaskList)에서 테스크명 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 J(테스크명 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < mainTaskList.length; i++){
		var taskCode1 = 0;
		if(mainTaskList[i].taskCategoryCode == 'J'){
			
			//테스크명 정보가 있는 행의 테스크 코드를 변수 taskCode1에 담는다.
			taskCode1 = mainTaskList[i].taskCode;
			console.log("테스크명 표시할 테스크 코드 : " + taskCode1);
			
			//find()는 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용한다.
			//테스크명 정보를 가진 테스크코드(taskCode1)를 찾아놓았다.
			//테스트코드와 일치하는 '상자'에 테스크 명을 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode1 ); 
  		    //var name = $('#contentBox2-board').find( ".t3" );
  		    
  		    //테스크 상자 안에 테스크명이 입력되는 요소를 찾고
  		    //<div class='nameBox'>이름 없는 테스크</div> 해당 요소 태그 사이에 이름을 넣어준다.
  		    taskBox.find('.nameBox').text(mainTaskList[i].taskHistValue);
		}
	}
	
	
	//(2) 테스크우선순위(중요 표시) 가져오기 : 
	//상위테스크 전체 리스트(mainTaskList)에서 테스크우선순위(중요 표시) 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//테스크우선순위(중요 표시)는 high, medium, low로 나뉘어지며 화살표 아이콘으로 뷰페이지에 보여진다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 C(테스크우선순위 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < mainTaskList.length; i++){
		var taskCode2 = 0;
		if(mainTaskList[i].taskCategoryCode == 'C'){
			
			//테스크우선순위(중요 표시) 정보가 있는 행의 테스크 코드를 변수 taskCode2에 담는다.
			taskCode2 = mainTaskList[i].taskCode;
			console.log("테스크우선순위 표시할 테스크 코드 : " + taskCode2);
			
			//찾은 테스트코드와 일치하는 '상자'에 테스크우선순위 정보를 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode2 ); 
		    
		    //테스크 상자 안에 테스크우선순위 정보가 입력되는 요소를 찾고
		    //<span class='important'>화살표 이미지 태그</span> 해당 요소 태그 사이에 중요도에 따른 화살표 이미지를 넣어준다.
            //중요도 확인
            //중요도가 높음이면 빨간색 화살표
            if(mainTaskList[i].taskHistValue == 'high'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_upward_red.png'>");
            }else if(mainTaskList[i].taskHistValue == 'medium'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_upward_orange.png'>");
            }else if(mainTaskList[i].taskHistValue == 'low'){
               taskBox.find('.important').html("<img class='icon_arrow_upward_red' src='/agile/resources/icon/common/icon_arrow_downward_green.png'>");
            }else{
            	console.log("테스크우선순위 데이터 잘못 입력함 DB 데이터 확인 필요, high, medium, low 외에 다른 값 있음")
            }
		}
	}
	
	
	//(3) 레이블 가져오기 : 
	//레이블 전체 리스트(mainTaskList)에서 레이블 정보가 있는 경우에만 가져와서 뷰에 적용한다.
	//상위테스크 전체 리스트에서 반복문으로  테스크 카테고리 코드가 N(레이블 정보가 담긴 코드)인 행을 찾는다 
	for(var i = 0; i < mainTaskList.length; i++){
		var taskCode3 = 0;
		if(mainTaskList[i].taskCategoryCode == 'N'){
			
			//레이블 정보가 있는 행의 테스크 코드를 변수 taskCode4에 담는다.
			taskCode3 = mainTaskList[i].taskCode;
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
			if(mainTaskList[i].taskHistValue != ""){
	  		    //테스크 상자 안에 레이블이 입력되야하는 요소를 찾고
	  		    //<div class='labelBox'></div> 해당 요소 태그 사이에 <span></span>태그 형태의 레이블을 넣어준다.
	  		    //span 회색 배경 css 양쪽에 약간 여백 주기 위해 &nbsp; 추가함
	  		    taskBox.find('.labelBox').html("<span class='label-css'>&nbsp;" + mainTaskList[i].taskHistValue + "&nbsp;</span>");
		
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
	for(var i = 0; i < mainTaskList.length; i++){
		var taskCode4 = 0;
		if(mainTaskList[i].taskCategoryCode == 'E'){
			
			//플래그 정보가 있는 행의 테스크 코드를 변수 taskCode3에 담는다.
			taskCode4 = mainTaskList[i].taskCode;
			console.log("플래그여부 표시할 테스크 코드 : " + taskCode4);
			
			//찾은 테스트코드와 일치하는 '상자'에 플래그 정보를 넣어줘야한다.
			//find를 이용하여 테스트코드와 일치하는 테스크 상자 요소를 찾아온다.
			//각 테스크 상자의 class명에는 't+테스크코드' 식의 고유한 테스크 코드가 붙어있다.(위에서 append로 뷰 그릴 때 넣음)
			var taskBox = $('#contentBox2-board').find( ".t" + taskCode4 ); 
		    
		    //플래그 정보가 있는경우 테스크 상자 class에 flag-true 클래스를 넣어준다.
		    //플래그 정보가 'Y'인 경우에만 표시해준다. 카테고리 코드가 E여도 플래그 여부가 N인 경우도 있기 때문에 꼭 if 조건으로 확인
		    if(mainTaskList[i].taskHistValue == 'Y'){
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







//2.상위테스크 세부 정보 입력 끝-----------------------------------------------------------------------------------------------------------------
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


	//(5) 테스크 삭제 기능 :
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








	/* $.each(mainTaskList, function (index, item){
		var result = ''; 
		result += index +' : ' + item.taskCode + ', ' + item.taskLevel; 
		console.log(result);
	}) */
/* } */



//메인테스크 리스트 view에 넣어주기 끝-----------------

/* 기존꺼 지우기 */
/* var iBoard = $('#iBoard');
var pBoard = $('#pBoard');
var cBoard = $('#cBoard');
iBoard.children().remove();
pBoard.children().remove();
cBoard.children().remove(); */





//task list 관련 코딩 끝--------------------------------------------------------------------






//추가 설정 버튼 드롭다운 ------------------------------------------------------------------------
//마지막에 읽혀야 전체 작동
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










</script>
</html>