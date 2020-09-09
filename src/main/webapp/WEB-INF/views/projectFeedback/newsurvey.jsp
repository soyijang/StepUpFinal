<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/dropdown.css">

<style>
                           
body{
    margin: 0;
    /* 현재 창 높이의 100% */
    height: 100vh;
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
    width: 550px;
    height: 200px;
    border: 1px solid #C4C4C4;
    border-radius: 5px;
}
.surveyBtn {
     margin-left: 10px;
}
#surveyInsertBox {
    width: 400px;
    height: 25px;
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
#content{
    width: 1440px;
    height: 900px;
    background-color: white;
    box-sizing: border-box;
}
.surveyTitle{
	height: 30px;
	border: 1px solid #C4C4C4;
	border-radius: 5px;
}
    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
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
                    	<div id="surveyFormArea">
                        <button class="surveyBtn">질문 1</button>
                        <div id="surveyInsert">
                            <div id="surveyInsertBox">
                                <input type="text" class="surveyTitle" placeholder="질문을 입력하세요" size="50">
                            </div>
                            <div id="questionType">
                            	<div class="dropdown">
							        <div class="select">
							              <span id="survey-type-filter">질문 유형</span>
							          <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li id="all">질문 유형</li>
							          <li id="survey-type1">객관식 질문</li>
							          <li id="survey-type1">주관식 질문</li>
							        </ul>
						      </div>
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
                    </div>               
                </div>
            </div>
</body>
<script>
	$('.dropdown').click(function() {
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.dropdown-menu').slideToggle(300);
	});
	
	$('.dropdown').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.dropdown-menu').slideUp(300);
	});
	
	$('.dropdown .dropdown-menu li').click(
		function() {
			$(this).parents('.dropdown').find('span').text($(this).text());
			$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.dropdown-menu li').click(function() {
			var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
	});
</script>
</html>