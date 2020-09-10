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
.@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}



@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');}



@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');}



@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');}



@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');}



@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
body{
    margin: 0;
    /* 현재 창 높이의 100% */
    height: 100vh;
    font-family: "Noto Sans KR";
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
	 width: 60px;
     margin-left: 10px;
     border-top: 1px solid #C4C4C4;
     border-left: 1px solid #C4C4C4;
     border-right: 1px solid #C4C4C4;
     border-radius: 5px;
}
#surveyInsertBox {
    width: 400px;
    height: 25px;
    font-size: 13px;
    margin-top: 3%;
    margin-left: 3%;
    display: inline-block;
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
    width: 14px;
    height: 14px;
}
#questionType {
   display: inline-block;
   width:90px;
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
.newQuestion {
    border: 1px solid #6d6d6d4d;
    border-radius: 10px;
    width: 110px;
    height: 40px;
    text-align: center;
    display: inline-block;
}
.newQuestion p {
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
#form-area{
	float:left;
	display: inline-block;
	width: 80%;
	height: 100%;
}
#send-area{
	display: inline-block;
	width: 20%;
	height: 100%;
}
#contentBox2{
	width: 100%;
    margin-top: 20px;
    height: 88%;
}
#survey-form-area{
	max-height:700px;
    overflow-y:scroll;
}
#survey-form-wrap{
	width: 70%;
	height:100%;
	margin:0 auto;
	border-radius: 5px;
	background-color: #d4c7cb12;
	padding-top: 10px;
}
.survey-form{
	width: 390px;
	height:150px;
	margin: 0 auto;
	border: 1px solid #e2e2e2c4;
	border-left: 10px solid #dd0351;
	border-radius: 5px;
	background-color: white;
	padding: 30px;
	box-shadow: 11px 17px 9px -7px rgba(179, 179, 179, 0.25);
}
#survey-form-area::-webkit-scrollbar{
	width: 5px;
	padding-top: 10px;
}
#survey-form-area::-webkit-scrollbar-thumb{
	background-color: #D9D9D9;
	border-radius: 3px;
}
#survey-num{
	display: inline-block;
	width: 5px;
	height: 20px;
	background: #DD0351;
}
#survey-number{
	width: 50px;
	height: 30px;
	display: inline-block;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	margin-left: 128px;
	text-align: center;
	background-color: #dd0351;
	color: white;
}

.input1{
	border: 1px solid #efefef;
	height: 30px;
	width: 200px;
	border-radius: 5px;
}
.Multiple{
	margin-top: 10px;
}
textarea {
	border: 1px solid #efefef;
	border-radius: 5px;
}
.AddNewOption, #AddNewQue{
	cursor: pointer;
}
#send-survey{
	cursor: pointer;
}
.newQuestion2{
	border: 1px solid #6d6d6d4d;
    border-radius: 10px;
    width: 110px;
    height: 40px;
    text-align: center;
    display: inline-block;
}
.newQuestion2 p{
	display: inline-block;
    font-size: 13px;
    margin: 0;
    margin-top: 9%;
}
.AddnewQuestion{
	cursor: pointer;
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
                <div id="contentBox2">
                <div id="form-area">
                <div id="survey-form-wrap">
					<div id="survey-form-area">
					<div id="survey-number">질문 1</div>
						<div id="survey-form1" class="survey-form">
							<div id="survey-title">
								<input type="text" placeholder="질문을 입력하세요" class="input1">
								<div class="dropdown" style="width:90px;">
							        <div class="select">
							              <span id="survey-type-filter">질문 유형</span>
							          <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li id="all">질문 유형</li>
							          <li id="survey-type1">객관식 질문</li>
							          <li id="survey-type2">주관식 질문</li>
							        </ul>
						      </div>
							</div>
							<div id="survey-cont1">
								<div class="Multiple" id="multi">
								<input id="radio-2" name="radio" type="checkbox"><input type="text" placeholder="옵션을 입력하세요" class="input1">
								</div>
								<div class="newQuestion" id="newOption1">
									 <button class="newQuestionBtn" id="newOptBtn1">+</button>
                        			 <p class="AddnewQuestion" id="AddNewOption1">옵션 추가</p>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div id="send-area">
					 <div class="newQuestion2" id="newQue">
                        <button class="newQuestionBtn" id="newQueBtn">+</button>
                        <p class="AddnewQuestion" id="AddNewQue">질문 추가</p>
                   </div>
                   <br>
                   <br>
                   <div class="newQuestion2" id="send">
                        <p class="Survey-send" id="send-survey">📧설문 전송</p>
                   </div>
				</div>
				
				
				
                   <!-- <div id="newQuestion">
                        <button class="newQuestionBtn">+</button>
                        <p id="AddnewQuestion">질문추가</p>
                   </div>
                   
                    <div id="newQuestion">
                        <button class="newQuestionBtn">+</button>
                        <p id="AddnewQuestion">설문 보내기</p>
                   </div>

                    질문 작성 테이블
                    <div id="surveyInsertArea">
                    	<div id="surveyFormArea">
                        <div class="surveyBtn">질문 1</div>
                        <div id="surveyInsert">
                            <div id="surveyInsertBox">
                                <input type="text" class="surveyTitle" placeholder="질문을 입력하세요" size="50">
                            </div>
                            <div id="questionType">
                            	<div class="dropdown" style="width:90px;">
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
                    </div>    -->    
                            
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
		var cnt = 1;
		var num2 = 1;
	//질문추가
	$(document).on('click', "#AddNewQue", function(){
		cnt += 1;
		
		$('div#survey-form-area').append('<div id="survey-number">질문 '+ cnt + '</div>'
			+	'<div id="survey-form'+ cnt + '"class="survey-form"><div id="survey-title">'
			+		'<input type="text" placeholder="질문을 입력하세요" class="input1">'
			+		'<div class="dropdown" style="width:90px;">'
			+	        '<div class="select">'
			+	              '<span id="survey-type-filter">질문 유형</span>'
			+	          '<i class="fa fa-chevron-left"></i>'
			+	        '</div>'
			+	        '<ul class="dropdown-menu">'
			+	          '<li id="all">질문 유형</li>'
			+	          '<li id="survey-type1">객관식 질문</li>'
			+	          '<li id="survey-type2">주관식 질문</li>'
			+	        '</ul>'
			+      '</div>'
			+	'</div>'
			+	'<div id="survey-cont' + cnt + '">'
 		 	+		'<div class="Multiple" id="multi">'
			+		'<input id="radio-2" name="radio" type="checkbox"><input type="text" placeholder="옵션을 입력하세요" class="input1"><br>'
			+		'</div>'
			+       '<div class="Multiple" id="must" style="display: none;">'
			+       '<textarea rows="5" cols="25">입력</textarea>'
			+       '</div>'
		    +		'<div class="newQuestion" id="newOption' + cnt + '">'
			+		'<button class="newQuestionBtn" id="newOptBtn' + cnt + '">+</button>'
	        +		'<p class="AddnewQuestion" id="AddNewOption' + cnt + '">옵션 추가</p>'
			+		'</div>'
			+	'</div>'
			+'</div>');
		
		$('div#survey-cont' + cnt).append()
		num2++;
	});
	
	console.log(num2);
	
	
	$('.AddnewQuestion').mouseover(function(){
    	var id_check = $(this).attr("id");
    	console.log(id_check);
	});
	
	
	//옵션 추가
	/* var num = 150;
	$(document).on('click', '#AddNewOption3', function(){
		console.log("ㅋㅋ");
		var surveyCont = $('#AddNewOption3').parent().parent().prop('id');
		var surveyForm = $('#AddNewOption3').parent().parent().parent().children().children().children().children().eq(1).prop('id');
		console.log(surveyCont);
		console.log(surveyForm);
		
		
		$('<br>').remove();
		$('div').remove('#newOption3');
		$('button').remove('#newOptBtn3');
		$('p').remove('#AddNewOption3');
		$('div#survey-cont' + cnt).append('<div class="Multiple" id="multi"><input id="radio-2" name="radio" type="checkbox"><input type="text" placeholder="옵션을 입력하세요" class="input1"></div>'
			  + '<div class="newQuestion" id="newOption' + cnt + '">'
			  + '<button class="newQuestionBtn" id="newOptBtn' + cnt + '">+</button>'
   			  + '<p class="AddnewQuestion" id="AddNewOption' + cnt + '">옵션 추가</p>'
			  + '</div>');
		num += 35;
		console.log(num);
		$('div#survey-form3').css("height", num);
		
	}); */
	
	$(document).on('click', '#survey-type2', function(){
		$("#multi").hide();
		$("#newOption").hide();
		$("#survey-form").css("height","180px");
		$("#survey-cont1").remove();
	});
	$(document).on('click', '#survey-type1', function(){
		$("#multi").show();
		$("#newOption").show();
		$("#survey-form").css("height","150px");
		$("#survey-cont1").append('<div class="Multiple" id="multi">'
				+		'<input id="radio-2" name="radio" type="checkbox"><input type="text" placeholder="옵션을 입력하세요" class="input1"><br>'
				+		'</div>');
	});

	
	
	
</script>
</html>