<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
            
            body{
    margin: 0;
    /* 현재 창 높이의 100% */
    height: 100vh;
}

/* 전체 wrapper */
#wrapper{
    display: table;
    margin-left: auto;
    margin-right: auto;
    height: 100vh;
}

/* 상단 네브바 영역 레이아웃 */
#navbar{
    height: 57px;
    /* 현재 창의 폭  */
    width: 100vw;
    background-color: #2B2B49;   
}

/* 네브바 아래 전체 section(본문영역) 레이아웃 */
#section{
    height: 843px;

}

/* section(본문영역) 안쪽 왼쪽 메뉴바*/
#menubar{
    width: 12vw;
    height: 843px;
    background-color: #F9F9F9;
    float: left;
}

/* 메뉴바 상단 Box */
#menubarTitleBox{
    height: 12%;
    width: 100%;
    text-align: center;
}

/* 메뉴바 Project명 입력 부분 */
#projectTitle{
    height: 100%;
}

/* 메뉴바 하단 리스트 부분 */
#menubarList{
    padding: 10px;
    box-sizing: border-box;
    height: 88%;
    width: 100%;
    display: inline-block;
    text-align:center;
}

/* 메뉴 목록 공통 css 적용 */
.menu{
    height: 55px;
    width: 100%;
    text-align: left;
    font-family: Montserrat;
    font-style: normal;
    font-weight: 500;
    font-size: 14px;
    line-height: 18px;
    letter-spacing: 0.1px;
    color: #000000;
}

/* section 안쪽 오른쪽*/
#content{
    width: 88vw;
    height: 843px;
    background-color: white;
    float: left;
    box-sizing: border-box;
    padding: 30px 40px; 
}

/* content 안쪽 상단 contentTitle(제목 영역)*/
#contentTitle{
    height: 60px;

}

/* content 안쪽 contentTitle(제목영역) Project 이름 부분 */
#projectTitle2{
    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: 300;
    font-size: 13px;
    line-height: 17px;
    align-items: center;
    letter-spacing: 0.1px;
    color: #6D6D6D;
}

/* content 안쪽 contentTitle(제목영역) 메뉴명 부분 */
#menuTitle{
    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: 300;
    font-size: 17px;
    line-height: 17px;
    align-items: center;
    letter-spacing: 0.1px;
    color: #000000;
}

/* content 안쪽 하단 내용영역*/
#contentBox{
    height:700px;
}
#rectangle2 {
            background:#2B2B49;
            height: 30px;
            width: 80px;
            border-radius: 10px;
            border: 0;
            outline: 0;
            font-size: 8px;
            color: white;
            text-align: center;     
        }
        #rectangle3 {
            background:#C4C4C4;
            height: 30px;
            width: 80px;
            border-radius: 10px;
            border: 0;
            outline: 0;
            font-size: 8px;
            color: white;
            text-align: center;     
        }
        #rectangle {
           text-align: right;
        }
        .teamSearch {
            font-family: Noto Sans KR;
            font-style: normal;
            font-weight: 300;
            font-size: 13px;
            width: 1000px;
            height: 50px;
            border: 1px solid lightgrey;
            outline: 0;
            border-radius: 30px;
            text-align:left;
            margin-left: 10%;
            margin-top: 30px;
            text-indent: 3%;
        }
        #team-person {
            width: 150px;
            height: 160px;
            display: inline-block;
            border: 1px solid lightgrey;
            background: white;
            margin: 10px;
            text-align:center;
        }
        #team-person p {
            text-align: inherit;
        }
        #team-area {
            width: 150px;
            height: 160px;
            border: 1px solid lightgrey;
            background: white;
            margin: 10px;
            text-align:center;
        }
        #team-person img {
            margin-top: 10%;
            margin-bottom: 5%;
        }
        h3 {
            margin-left: 20px;
        }


    </style>
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
            <div id="content">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">Team / IT WORKS!</div>
                    <div id="menuTitle">팀 추가</div>
                </div>
                <div id="contentBox">
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
                        <div id="team-person"><img src="image 65cha.png"><p>양수경</p></div>
                        <div id="team-person"><img src="image 66cha.png"><p>김정수</p></div>
                        <div id="team-person"><img src="KakaoTalk_20200515_190811458 3cha.png"><p>김미소</p></div>
                        <div id="team-person"><img src="dayoon 5cha.png"><p>장소이</p></div>
                        <div id="team-person"><img src="image 66cha.png"><p>심다윤</p></div>
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