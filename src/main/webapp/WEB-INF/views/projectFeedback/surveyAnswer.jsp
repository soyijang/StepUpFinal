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
    background-color:  white;
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
    background-color: white;
    height:700px;
}
#projectSurvey {
    background: white;
    border: 1px solid #6D6D6D;
    text-align: left;
    height: 70px;
}
.projectSurveyHr {
    border: 5px solid #2B2B49;
    margin: 0;
    padding: 0;
}
.projectSurveyP {
    margin-left: 10px;
    margin-top:2%;
    font-size: 15px;
    display: inline-block;
}
.projectSurveyP2 {
    font-size: 12px;
    display: inline-block;
}
#lineArea {
    width: 500px;
    text-align: center;
    margin-top: 5%;
    margin-left: 28%;
}
#answerList {
    margin-left: 10%;
    border: 1px solid #6D6D6D;
    width: 950px;
}
#answerList table {
    text-align: left;
}
#answerList thead {
    background: #6d6d6d6b;
    border-bottom: 1px solid #6D6D6D;
}
#answerList td {
    height: 50px;
    border-bottom: 1px solid #6d6d6d71;
}
#lineArea button{
    background: none;
    border: none;
    outline: none;
}
#lineArea button:hover {
    border-bottom: 1px solid #6D6D6D;
}
#answerList table img {
    width: 50px;
    height: 50px;
}
.trash img {
    width: 30px !important;
    height: 30px !important;
    margin-left: 20%;
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
                    <div id="projectTitle2">Form / IT WORKS!</div>
                    <div id="menuTitle">피드백</div>
                </div>
                <div id="contentBox">
                    <div id="projectSurvey">
                        <hr class="projectSurveyHr">
                        <p class="projectSurveyP">프로젝트 설문지</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <p class="projectSurveyP2">설문지 설명</p>
                    </div>

                    <div id="lineArea">
                        <div>
                            <button>요약</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button>상세</button>
                        </div>
                        <hr>     
                    </div>
                    <br><br>
                    <div id="answerList">
                        <table>
                         <thead>
                             <th style="width: 80px;  height: 50px;"></th>
                             <th style="width: 250px; height: 50px;">이름</th>
                             <th style="width: 250px; height: 50px;">부서</th>
                             <th style="width: 300px; height: 50px;">이메일</th>
                             <th style="width: 50px;  height: 50px;"></th>
                         </thead>
                         <tbody>
                             <tr>
                                 <td><img src="image 66cha.png"></td>
                                 <td>iino</td>
                                 <td>개발팀</td>
                                 <td>iino123@gmail.com</td>
                                 <td class="trash"><img src="delete 2icon_trash.png"></td>
                             </tr>
                             <tr>
                                 <td><img src="image 65cha.png"></td>
                                 <td>iino</td>
                                 <td>개발팀</td>
                                 <td>iino123@gmail.com</td>
                                 <td class="trash"><img src="delete 2icon_trash.png"></td>
                             </tr>
                     
                             <tr>
                                 <td><img src="KakaoTalk_20200515_190811458 3cha.png"></td>
                                 <td>iino</td>
                                 <td>개발팀</td>
                                 <td>iino123@gmail.com</td>
                                 <td class="trash"><img src="delete 2icon_trash.png"></td>
                             </tr>
                     
                             <tr>
                                 <td><img src="dayoon 5cha.png"></td>
                                 <td>iino</td>
                                 <td>개발팀</td>
                                 <td>iino123@gmail.com</td>
                                 <td class="trash"><img src="delete 2icon_trash.png"></td>
                             </tr>
                     
                             <tr>
                                 <td></td>
                                 <td>iino</td>
                                 <td>개발팀</td>
                                 <td>iino123@gmail.com</td>
                                 <td class="trash"><img src="delete 2icon_trash.png"></td>
                             </tr>                     
                         </tbody>
                         </table>
                     </div>
                   


                   

                </div>
            </div>
        </div> 
    </div>       
    
</body>
</html>