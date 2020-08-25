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
#surveyInsert {
    width: 150px;
    height: 100px;
    border: 1px solid #6D6D6D;
    background: #c4c4c44f;
    margin: 30px;
    margin-top: 60px;;
}
#projectSurveyInsert {
    text-align: center;
}
#addSurvey {
    background: #DD0351;
    border: 0px;
    outline: 0px;
    border-radius: 50%;
    text-align: center;
    margin-top: 30px;
    color: white;
}
p {
    font-size: 13px;
}
#btn {
    text-align: right;
}
btn ,#question, #answer {
    border: 0px;
    outline: none;
    border-bottom: 2px solid lightgray;
    background: white;
}
btn ,#question:hover, #answer:hover {
    border: 1px solid #5A5AC6;
}
mark {
    border: 1px;
    border-radius: 50%;
    color: white;
    background: #5A5AC6;
}
#surveyList {
    width: 150px;
    height: 200px;
    margin-top: 10px;
}
#surveyUpdate {
    background: none;
    border: 0px;
    outline: none;
    text-align:right;
}
#surveyAnswer {
    border: 1px solid #6D6D6D;
    width: 185px;
    height: 220px;
    margin: 30px;
    text-align: center;
    display: inline-block;
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

                    <div id="projectSurveyInsert">
                        <div id="surveyInsert">
                            <button id="addSurvey">+</button>
                            <p>설문추가</p>
                        </div>

                    </div>
                    <br><br>
                    <div id="btn">
                        <button id="question">질문&nbsp;&nbsp;<mark></mark></button>&nbsp;
                        <button id="answer">응답&nbsp;&nbsp;<mark>3</mark></button>
                    </div>
                    <hr><br>

                    <div id="surveyAnswerList">
                    <div id="surveyAnswer">
                        <div id="surveyImage">
                            <img src="Frame 3.png">
                        </div>
                        <div id="surveyList">
                            프로젝트 설문지
                            2020.08.21
                            <button id="surveyUpdate"><img src="icon_more verticalicon.png" style="width: 20px;"></button>
                        </div>
                    </div>
                    <div id="surveyAnswer">
                        <div id="surveyImage">
                            <img src="Frame 3.png">
                        </div>
                        <div id="surveyList">
                            프로젝트 설문지
                            2020.08.21
                            <button id="surveyUpdate"><img src="icon_more verticalicon.png" style="width: 20px;"></button>
                        </div>
                    </div>
                    <div id="surveyAnswer">
                        <div id="surveyImage">
                            <img src="Frame 3.png">
                        </div>
                        <div id="surveyList">
                            프로젝트 설문지
                            2020.08.21
                            <button id="surveyUpdate"><img src="icon_more verticalicon.png" style="width: 20px;"></button>
                        </div>
                    </div>
                    </div>
                    





                </div>
            </div>
        </div> 
    </div>       
    

</body>
</html>