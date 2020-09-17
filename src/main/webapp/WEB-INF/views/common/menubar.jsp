<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/layout.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/nav.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menubarDropdown.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>
   <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

        <!-- nav바 영역 -->
        <div id="navbar">
        	<table class="navContent">
        		<tbody>
        		<tr>
        			<th id="logoArea"><a href="selectUserProject.me"><img alt="스탭업 홈으로 가기" src="/agile/resources/images/logo/logo_stepup_nav.png"></a></th>
        			<!-- <th class="navIcon"><a href="showProjectMain.pj">Project<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th> -->
        			<th class="navIcon">
		                 <div class="dropdown-project">
		                    <p class="navIcon">Project<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></p>
		                    <div class="dropdown-project-content">
			                     <a href="showProjectMain.pj">Project</a>                  
			                     <a href="selectTimeLine.pj">Timeline</a>                   
		                    </div>
		            	</div>
                    </th>
        			<th class="navIcon"><a href="MyTaskList.mt">My Tasks<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th>
        			<th class="navIcon"><a href="addTeam.tm">Team<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th>
        			<th id = "searchArea"><input type="text" placeholder="Search or jump to ..."></th>
        			<th class="navRightIcon">
	        			<div>
	        				<img src="/agile/resources/icon/common/icon_nav_rss_white.png">
	        				<div class="navRightText">16</div>
	        			</div>
        			</th>
        			<th class="navRightIcon">
	        			<div>
        					<img src="/agile/resources/icon/common/icon_nav_reply_white.png">
	        				<div class="navRightText">34</div>
	        			</div>
        			</th>
        			<th class="navRightIcon">
        				<div>
	        				<img src="/agile/resources/icon/common/icon_nav_bell_white.png">
	        				<div class="navRightText">3</div>
        				</div>
        			</th>
        			<th class="profileArea navRightIcon">
        			<div class="myInfodropdown">
        				
	                    <div class="select">
	                        <img id="profile" src="/agile/resources/icon/common/icon_user.png">                    
	        				<img id="downIcon" src="/agile/resources/icon/common/icon_down_chevron_nav.png">
	                    </div>
	                    <ul class="myInfodropdown-menu">
	                      <li id="user"><c:out value="${ sessionScope.loginUser.userName }"/></li>
	                      <li id="work"><a href="profile.me">프로필설정</a></li>
	                      <li id="rest">피드백 보내기</li>
	                      <li id="travel"><a href="logout.me">로그아웃</a></li>
	                    </ul>
               	   </div>
        			</th>
        		</tr>
        		</tbody>
        	</table>
        </div>
        <!-- nav바 하단 영역 -->
        <div id="section">
            <!-- 왼쪽 메뉴바 영역 -->
            <div id="menubarWithBtn">
	            <div id="menubar" class="">
	                <table id="menubarTitleBox">
	                    <tr><td id="projectTitle"><c:out value="${ sessionScope.loginUser.userName }님 환영합니다."/></td></tr>
	                </table>
	                <table id="menubarList">
	                	<tbody>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_layouticon.png"> </td><td id="ProjectTimeline" class="menu"><a href = "selectTimeLine.pj">Project Timeline</a></td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_gifticon.png"> </td><td id="SprintBacklog" class="menu">Sprint Backlog</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_trelloicon.png"> </td><td id="TaskBoard" class="menu">Task Board</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_crosshair.png"> </td><td id="Issues" class="menu"><a href="selectBugTask.tk">Issues</a></td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_feedbackform.png"> </td><td id="FeedbackForm" class="menu"><a href="selectEndSprint.sv">Feedback Form</a></td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_users.png"> </td><td id="StandUpMeeting" class="menu"><a href="showStandUpMeeting.mt">Stand Up Meeting</a></td></tr>

	                    </tbody>
	                </table>
	            </div>
	            <button onclick="changenav()" id="menubarHide"><img id="menubarImg" alt="메뉴바 숨김" src="/agile/resources/icon/common/icon_nav_hide.png"></button>
	        </div>
        </div>
        
				<input style="display: none" id="userProjectCode" name="userProjectCode" value="${sessionScope.userProjectCodeNew }">
				<input style="display: none" id="projectCode" name="projectCode" value="${sessionScope.projectCodeNew}">
        
<script>

	//메뉴바에서 스프린트 백로그보내기
	$('#SprintBacklog').click(function () {
		
		var userProjectCode = $('#userProjectCode').val();
		var projectCode = $('#projectCode').val();
		
		location.href = ('showSprintMain.st');
	})
	
	//메뉴바에서 보드 보내기
	$('#TaskBoard').click(function () {
		
		var projectCode = $('#projectCode').val();
		
		location.href = ('showTaskBoardMain.tk');
	})

	
	
	
	
	
	
	
	
	
	
	
	
	
	$('.myInfodropdown').click(function() {
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.myInfodropdown-menu').slideToggle(300);
	});
	
	$('.myInfodropdown').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.myInfodropdown-menu').slideUp(300);
	});
	
	$('.myInfodropdown .myInfodropdown-menu li').click(
		function() {
			$(this).parents('.myInfodropdown').find('span').text($(this).text());
			$(this).parents('.myInfodropdown').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.myInfodropdown-menu li').click(function() {
			var input = '<strong>' + $(this).parents('.myInfodropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
	});  	
</script>

</body>
</html>                           