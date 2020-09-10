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
								<div class="i-div1-span1">테스크명 </div>
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
								<div class="i-div1-span1">테스크명 </div>
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
								<div class="p-div1-span1">테스크명 </div>
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
									<span class="p-div3-span-tcode">코드입력</span>
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
									<span class="c-div3-span-tcode">코드입력</span>
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




//task list 관련 코딩----------------------------------------------------------------------
//메뉴 -> taskBoard 클릭 -> 리스트 조회 -> view 
//전체 리스트
var taskList = JSON.parse('${jsonList1}');
console.log(taskList);

//메인테스크 리스트
var mainTaskList = JSON.parse('${jsonList2}');
console.log(mainTaskList);

//서브테스크 리스트
var subTaskList = JSON.parse('${jsonList3}');
console.log(subTaskList);

//메인테스크 리스트 view에 넣어주기-------------------
if(mainTaskList != null){
	for(var i=0; i< mainTaskList.length; i++){
		consol.log(mainTaskList[i].projectCode);

			
			
	}	
	$.each(mainTaskList, function (index, item){
		var result = ''; 
		result += index +' : ' + item.taskCode + ', ' + item.taskLevel; 
		console.log(result);
	})
}




//메인테스크 리스트 view에 넣어주기 끝-----------------

/* 기존꺼 지우기 */
var iBoard = $('#iBoard');
var pBoard = $('#pBoard');
var cBoard = $('#cBoard');
iBoard.children().remove();
pBoard.children().remove();
cBoard.children().remove();





//task list 관련 코딩 끝--------------------------------------------------------------------











</script>
</html>