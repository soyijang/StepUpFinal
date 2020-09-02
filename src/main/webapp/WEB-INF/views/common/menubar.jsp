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
        			<th class="navIcon"><a href="showProjectMain.pj">Project<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th>
        			<th class="navIcon"><a href="">My Tasks<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th>
        			<th class="navIcon"><a href="">Team<img src="/agile/resources/icon/common/icon_down_chevron_nav.png"></a></th>
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
        				<img id="profile" src="/agile/resources/icon/common/icon_user.png">
        				<img src="/agile/resources/icon/common/icon_down_chevron_nav.png">
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
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_layouticon.png"> </td><td id="ProjectTimeline" class="menu">Project Timeline</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_gifticon.png"> </td><td id="SprintBacklog" class="menu"><a href = "showSprintMain.st">Sprint Backlog</a></td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_trelloicon.png"> </td><td id="TaskBoard" class="menu">Task Board</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_crosshair.png"> </td><td id="Issues" class="menu">Issues</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_feedbackform.png"> </td><td id="FeedbackForm" class="menu">Feedback Form</td></tr>
	                    <tr><td class="menuIcon"><img src="/agile/resources/icon/common/icon_users.png"> </td><td id="StandUpMeeting" class="menu">Stand Up Meeting</td></tr>
	                    </tbody>
	                </table>
	            </div>
	            <button onclick="changenav()" id="menubarHide"><img id="menubarImg" alt="메뉴바 숨김" src="/agile/resources/icon/common/icon_nav_hide.png"></button>
	        </div>
        </div>

</body>
</html>                           