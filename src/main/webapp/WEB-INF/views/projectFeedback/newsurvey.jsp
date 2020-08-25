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
}
.projectSurveyHr {
    border: 5px solid #2B2B49;
    margin: 0;
    padding: 0;
}
.projectSurveyP {
    margin-left: 10px;
    margin-bottom: 8px;
    font-size: 15px;
}


#surveyInsertArea {
    position: absolute;
    top: 40%;
    left: 30%;
}
#surveyInsert {
    border: 1px solid #6D6D6D;
    border-left: 10px solid #6D6D6D;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    width: 550px;
    height: 200px;
}
.surveyBtn {
     margin-left: 10px;
}
#surveyInsertBox {
    width: 400px;
    height: 25px;
    background: #6d6d6d23;
    border-bottom: 3px solid #6D6D6D;
    font-size: 13px;
    margin-top: 3%;
    margin-left: 3%;
    display: inline-block;
}
input[type=radio] {
    border: 0px;
    width: 7px;
    height: 7px;
}
.option {
    font-size: 13px;
}
#optionArea {
    margin-top: 10px;
    margin-left: 20px;
}
#iconArea {
    text-align: right;
}
#iconArea img {
    width: 15px;
    height: 15px;
}
#optionIconArea {
    border-left: 1px solid black;
    display: inline-block;
    margin-right: 10px;
}
label {
    font-size: 13px;
}
input[type=checkbox] {
    width: 8px;
    height: 8px;
}
#questionType {
   display: inline-block;
}
.questionType {
    margin-left: 13px;
    padding: 5px;
    font-size: 13px;
}
.newQuestionBtn {
    background: #DD0351;
    border: 0px;
    outline: 0px;
    border-radius: 50%;
    text-align: center;
    color: white;
    margin-top: 0;
}
#newQuestion {
    border: 1px solid #6d6d6d4d;
    border-radius: 10px;
    width: 110px;
    height: 40px;
    text-align: center;
    display: inline-block;
    margin-left: 80%;
    margin-top: 3%;
    margin-bottom: 1%;
}
#newQuestion p {
    display: inline-block;
    font-size: 13px;
    margin: 0;
    margin-top: 9%;
}
#sendBtn {
    width: 50px;
    height: 100px;
    border: 1px solid #6D6D6D4D;
    margin-top: 8%;
    margin-left: 75%;
}
#sendBtn img{
    width: 25px;
    height: 25px;
    margin-top:35%;
    margin-left: 25%;
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
                        <p class="projectSurveyP">프로젝트 설문지</p>
                    </div>

                   <div id="newQuestion">
                        <button class="newQuestionBtn">+</button>
                        <p>질문추가</p>
                   </div>

                    <!--질문 작성 테이블-->
                    <div id="surveyInsertArea">
                        <button class="surveyBtn">질문 1</button>
                        <div id="surveyInsert">
                            <div id="surveyInsertBox">
                                질문 타이틀
                            </div>
                            <div id="questionType">
                                <select class="questionType">
                                    <option>객관식 질문</option>
                                    <option>주관식 질문</option>
                                </select>
                            </div>

                            <div id="optionArea">
                                <input type="radio" value="옵션1" id="optionRadioBtn">
                                <label class="option">옵션1</label>
                            </div>
                            <div id="optionArea">
                                <input type="radio" value="옵션1" id="optionRadioBtn">
                                <label class="option">옵션2</label>
                            </div>
                            <div id="optionArea">
                                <input type="radio" value="옵션1" id="optionRadioBtn">
                                <label class="option">옵션 추가</label>
                            </div>
                            
                            <br>
                            <hr>
                            <div id="iconArea">
                                <img src="delete 2icon_trash.png">&nbsp;&nbsp;
                                <div id="optionIconArea">
                                    &nbsp;&nbsp;
                                    <input type="checkbox" >
                                    <label>필수</label>
                                    <input type="checkbox" >
                                    <label>복수선택</label>
                                </div>
                            </div>
                        </div>

                    </div>                

                    <div id="sendBtn">
                        <img src="mailsend.png">
                        <img src="delete 2icon_trash.png">
                    </div>


                   

                </div>
            </div>
        </div> 
    </div>       
    
</body>
</html>