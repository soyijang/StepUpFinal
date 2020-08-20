<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



    <div id="wrapper">
        <!-- nav바 영역 -->
        <div id="navbar">navbar</div>
        <!-- nav바 하단 영역 -->
        <div id="section">
        <%@ include file = "../common/menubar.jsp" %>
            <!-- 왼쪽 메뉴바 영역 -->
            <!-- <div id="menubar">
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
            </div> -->
            <div id="content">content
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">Team / IT WORKS!</div>
                    <div id="menuTitle">팀 추가</div>
                </div>
                <div id="contentBox">contentBox
                    <!--팀원 추가 버튼영역-->
                    <div id="rectangle">
                    <button id="rectangle2">팀원 추가</button>&nbsp;&nbsp;
                    <button id="rectangle3" onclick="openPopup('url')">팀 시작</button>&nbsp;&nbsp;
                    </div>
                    <!--팀원 추가 버튼영역 종료-->
                    <!--팀원 검색 영역-->
                    <div id="teamSearch">
                        <input class="teamSearch" type="search" placeholder="사람 및 팀 검색">
                    </div>
                    
                    <h3>함께한 작업자</h3>
                    <div id="team-person area">
                        <div id="team-person"><img src=""><p>양수경</p></div>
                        <div id="team-person"><img src=""><p>김정수</p></div>
                        <div id="team-person"><img src=""><p>김미소</p></div>
                        <div id="team-person"><img src=""><p>장소이</p></div>
                        <div id="team-person"><img src=""><p>심다윤</p></div>
                    </div>
                    <br><hr><br>
                    <h3>귀하의 팀</h3>
                    <div id="team team-area">
                        <div id="team-area"><img src=""><p>stepup</p></div>
                    </div>
                    
                    <script>
                        function openPopup(url) {
                            window.open(url,"name","options")
                        }

                    </script>

               </div>
            </div>
        </div>
    </div>



</body>
</html>