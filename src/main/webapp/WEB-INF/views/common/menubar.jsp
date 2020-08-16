<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 아래 font css 일단 임시로 사용하였습니다 -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="layout.css">
</head>
<body>
    <div id="wrapper">
        <!-- nav바 영역 -->
        <div id="navbar">navbar</div>
        <!-- nav바 하단 영역 -->
        <div id="section">
            <!-- 왼쪽 메뉴바 영역 -->
            <div id="menubar">
                <table id="menubarTitleBox">
                    <tr><td id="projectTitle"> 여기에 프로젝트명</td></tr>
                </table>
                <table id="menubarList">
                    <tr><td class="menuIcon">icon</td><td id="ProjectTimeline" class="menu">Project Timedivne</td></tr>
                    <tr><td class="menuIcon">icon</td><td id="SprintBacklog" class="menu">Sprint Backlog</td></tr>
                    <tr><td class="menuIcon">icon</td><td id="TaskBoard" class="menu">Task Board</td></tr>
                    <tr><td class="menuIcon">icon</td><td id="Issues" class="menu">Issues</td></tr>
                    <tr><td class="menuIcon">icon</td><td id="FeedbackForm" class="menu">Feedback Form</td></tr>
                    <tr><td class="menuIcon">icon</td><td id="StandUpMeeting" class="menu">Stand Up Meeting</td></tr>
                </table>
            </div>
            <div id="content">content
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
                    <div id="menuTitle">예시 개인일정관리</div>
                </div>
                <div id="contentBox">contentBox</div>
            </div>
        </div>
    </div>
</body>
</html>                           