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
    display: inline-block;
    margin-right: 10px;
    width: 200px;
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
    width: 800px;
}
#survey-form-wrap{
	width: 70%;
	height:100%;
	margin:0 auto;
	border-radius: 5px;
	padding-top: 10px;
}
.survey-form{
	width: 650px;
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
	cursor: pointer;
}

.input1{
	border: 1px solid #efefef;
	height: 30px;
	width: 450px;
	border-radius: 5px;
}
.input2{
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
.newOption{
	border: 1px solid #6d6d6d4d;
    border-radius: 10px;
    width: 110px;
    height: 40px;
    text-align: center;
    display: inline-block;
    margin-top: 30px;
}
.newOption p{
	display: inline-block;
    font-size: 13px;
    margin: 0;
    margin-top: 9%;
    cursor: pointer;
}
.newOptionBtn{
	background: #DD0351;
    border: 0px;
    outline: 0px;
    border-radius: 50%;
    text-align: center;
    color: white;
    margin-top: 0;
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
.multi-must-chek-area{
	margin-left: 440px;
	width: 200px;
	text-align: right;
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
					<!-- <div id="survey-number">질문 1</div> -->
						<!-- <div id="survey-form1" class="survey-form">
							<div id="survey-title">
								<input type="text" placeholder="객관식질문을 입력하세요" class="input1" id="QueText1" name="ga">
								<input type="text" placeholder="주관식질문을 입력하세요" class="input2" id="QueText2" name="ju" style="display: none;">
								<div class="dropdown" style="width:90px;">
							        <div class="select">
							              <span id="survey-type-filter1" class="survey-type-filter">질문 유형</span>
							          <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li id="all">질문 유형</li>
							          <li class="survey-type1">객관식 질문</li>
							          <li class="survey-type2">주관식 질문</li>
							        </ul>
						      </div>
							</div>
							<div id="survey-cont1">
								<div class="Multiple" id="multi1">
								<input id="radio-2" name="radio" type="checkbox"><input type="text" placeholder="옵션을 입력하세요" class="input1" id="setinput1" name="ga">
								</div>
								<div class="newOption" id="newOption1">
									 <button class="newOptionBtn" id="newOptBtn1">+</button>
                        			 <p class="AddnewOption" id="AddNewOption1">옵션 추가</p>
								</div>
								
							</div>
							<div id="multi-must-chek-area1">
								<div id="optionIconArea">
                                    &nbsp;&nbsp;
                                    <input type="checkbox" id="must1" name="check">
                                    <label>필수</label>
                                    <input type="checkbox" id="multi1" name="check">
                                    <label>복수선택</label>
                                </div>
							</div>
						</div> -->
					</div>
					</div>
				</div>
				<div id="send-area">
					 <div class="newQuestion2" id="newQue">
                        <button class="newQuestionBtn" id="newQueBtn">+</button>
                        <p class="AddnewQuestion" id="AddNewQue">질문 추가</p>
                   </div>
                   <input type="hidden" value="${ surveyCode }" id="surveyCode">
                   <br>
                   <br>
                   <div class="newQuestion2" id="send">
                        <p class="Survey-send" id="send-survey">📧설문 전송</p>
                   </div>
				</div>
                </div>
            </div>
</body>
<script>
	$(document).on('click', '.dropdown', function(){
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.dropdown-menu').slideToggle(300);
	});
	
	$(document).on('focusout', '.dropdown', function(){
		$(this).removeClass('active');
		$(this).find('.dropdown-menu').slideUp(300);
	});
		
	$(document).on('click', '.dropdown .dropdown-menu li', function(){
		$(this).parents('.dropdown').find('span').text($(this).text());
		$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
	});
	
	$(document).on('click', '.dropdown-menu li', function(){
		var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
		$('.msg').html(msg + input + '</span>');
	});
	
		
		
	var num2 = 1;
	var cnt = 1;
	var count = 0;
	
	//질문추가
	$(document).on('click', "#AddNewQue", function addNewQue(){
		count++;
		cnt++;
		num2++;
		$('div#survey-form-area').append('<div id="survey-number">질문 '+ (cnt-1) + '</div>'
			+	'<div id="survey-form'+ cnt + '"class="survey-form"><div id="survey-title">'
			+		'<input type="text" placeholder="질문을 입력하세요" class="input1" id="QueTypeChoice' + (cnt+1) + '" name="ga">'
			+		'<input type="hidden" name="surveyQuesType" style="display:none;" value="01" id="QueType' + (cnt+1) + '">'
			+		'<div class="dropdown" style="width:90px;">'
			+	        '<div class="select">'
			+	              '<span id="survey-type-filter' + cnt + '" class="survey-type-filter">질문 유형</span>'
			+	          '<i class="fa fa-chevron-left"></i>'
			+	        '</div>'
			+	        '<ul class="dropdown-menu">'
			+	          '<li id="all">질문 유형</li>'
			+	          '<li class="survey-type1">객관식 질문</li>'
			+	          '<li class="survey-type2">주관식 질문</li>'
			+	        '</ul>'
			+      '</div>'
			+	'</div>'
			+	'<div id="survey-cont' + cnt + '">'
 		 	+		'<div class="Multiple" id="multiple' + cnt + '">'
			+		'<input type="hidden" value=' + (num2-1) + '"><input type="text" placeholder="옵션을 입력하세요" class="input1" id="setinput' + cnt + '" name="0"><br>'
			+		'</div>'
		    +		'<div class="newOption" id="newOption' + num2 + '">'
			+		'<button class="newOptionBtn" id="newOptBtn' + num2 + '">+</button>'
	        +		'<p class="AddnewOption" id="AddNewOption' + num2 + '">옵션 추가</p>'
			+		'</div>'
			+ '<div id="multi-must-chek-area' + num2 + '" class="multi-must-chek-area">'
			+ '<div id="optionIconArea' + num2 + '" class="optionIconArea">&nbsp;&nbsp;'
            + '<input type="checkbox" id="must' + (cnt+1) + '" name="check" value="N" clsss="mustChk">'
            + '<label>필수</label>'
            + '<input type="checkbox" id="multi' + (cnt+1) + '" name="check" value="N" class="multiChk">'
            + '<label>복수선택</label>'
        	+ '</div>'
			+ '</div>'
			+'</div>'
			+'</div>');
		
		console.log ($("#multi3").val());
		//$('div#survey-cont' + cnt).append()
		console.log("코드 : " + $('#surveyCode').val());
		
	});
	
	
	//옵션 추가
	var num = 150;
	

	var optionid = "";
	var chkbox = "";
	var surveyCont = "";
	var surveyform = "";
	$(document).on('click', '.AddnewOption', function(event){
		//var optionid = $('.AddnewOption').prop('id');
		var typeid = event.target;
		var parent = typeid.parentElement;
		//survey-cont
		var parent2 = parent.parentElement;
		var parent3 = parent2.parentElement;
		
		var child2 = parent3.id;
		
		var child1 = parent2.id;
		console.log("surveyCont : " + child1);
		$('<br>').remove();
		$('div').remove('#newOption'+num2);
		$('button').remove('#newOptionBtn'+num2);
		$('p').remove('#AddnewOption'+num2);
		$('div').remove('#multi-must-chek-area'+num2);
		$('div').remove('#optionIconArea'+num2);
		num2++;
		$('#'+child1).append('<div class="Multiple" id="multiple'+ num2 + '"><input type="hidden" value=' + (num2-1) + '"><input type="text" placeholder="옵션을 입력하세요" class="input1" id="setinput' + num2 +'" name="0"></div>'
			  + '<div class="newOption" id="newOption' + num2 + '">'
			  + '<button class="newOptionBtn" id="newOptBtn' + num2 + '">+</button>'
   			  + '<p class="AddnewOption" id="AddNewOption' + num2 + '">옵션 추가</p>'
			  + '<div id="multi-must-chek-area' + num2 + '" class="multi-must-chek-area">'
				+ '<div id="optionIconArea' + num2 + '" class="optionIconArea">&nbsp;&nbsp;'
	            + '<input type="checkbox" id="must' + (cnt+1) + '" name="check" value="N" clsss="mustChk">'
	            + '<label>필수</label>'
	            + '<input type="checkbox" id="multi' + (cnt+1) + '" name="check" value="N" class="multiChk">'
	            + '<label>복수선택</label>'
	        	+ '</div>'
				+ '</div>'
				+ '</div>');
		
		num += 35;
		console.log(num);
		
		$('#'+child2).css("height", num);
	});
	
	//주관식
	$(document).on('click', '.survey-type2', function(event){
		num = 150;
		var typeid = event.target;
		var parent = typeid.parentElement;
		var parent2 = parent.parentElement;
		var parent3 = parent2.parentElement;
		//survey-form id
		var parent4 = parent3.parentElement;
		console.log(parent4);
		
		//객관식
		var child3 = parent4.children[0].children[0].id;
		//주관식
		var child4 = parent4.children[0].children[1].id;
		
		var child1 = parent4.children[1].id;
		var pid = parent4.id;
		console.log(pid);
		
		console.log("child1 : " + child1);
		$("#"+child1).children().remove();
		$("#"+child1).append(
				'<div id="multi-must-chek-area' + (num2-1) + '" class="multi-must-chek-area">'
				+ '<div id="optionIconArea' + (num2-1) + '" class="optionIconArea">&nbsp;&nbsp;'
	            + '<input type="checkbox" id="must' + (cnt+1) + '" name="check" value="N" clsss="mustChk">'
	            + '<label>필수</label>'
	            + '<input type="hidden" id="multi' + (cnt+1) + '" name="check" value="N" clsss="mustChk">'
	        	+ '</div>'
				+ '</div>');
		
		$("#"+child4).val("02");
		$("#"+pid).css("height","100px");
		
	});
	
	//객관식
	$(document).on('click', '.survey-type1', function(){
		num = 150;
		var typeid = event.target;
		var parent = typeid.parentElement;
		var parent2 = parent.parentElement;
		var parent3 = parent2.parentElement;
		//survey-form id
		var parent4 = parent3.parentElement;
		//객관식
		var child3 = parent4.children[0].children[0].id;
		//주관식
		var child4 = parent4.children[0].children[1].id;
		
		var child1 = parent4.children[1].id;
		var pid = parent4.id;
		console.log(pid);
		console.log("child1 : " + child1);
		$("#"+child1).children().remove();
		$("#"+child1).append('<div class="Multiple" id="multiple'+ num2 + '"><input type="hidden" value=' + (num2-1) + '"><input type="text" placeholder="옵션을 입력하세요" class="input1" id="setinput' + num2 +'" name="0"></div>'
				  + '<div class="newOption" id="newOption' + num2 + '">'
				  + '<button class="newOptionBtn" id="newOptBtn' + num2 + '">+</button>'
	   			  + '<p class="AddnewOption" id="AddNewOption' + num2 + '">옵션 추가</p>'
				  + '</div>'
					+ '<div id="multi-must-chek-area' + num2 + '" class="multi-must-chek-area">'
					+ '<div id="optionIconArea' + num2 + '" class="optionIconArea">&nbsp;&nbsp;'
		            + '<input type="checkbox" id="must' + (cnt+1) + '" name="check" value="N" clsss="mustChk">'
		            + '<label>필수</label>'
		            + '<input type="checkbox" id="multi' + (cnt+1) + '" name="check" value="N" clsss="multiChk">'
		            + '<label>복수선택</label>'
		        	+ '</div>'
					+ '</div>');
		$("#"+child4).val("01");
		$("#"+pid).css("height","150px");
		
	});


	$(document).on('click', '#send-survey', function(){
		 //totData는 객체로 선언, dataList는 Array로 선언
	      var totData = new Object();
	      var dataList = new Array();
	      
	      console.log("cnt : " + cnt);
	      //문항별로 data라는 객체에 값을 넣고 각 data객체들을 dataList에 push해줌
	      for(var i=3; i < (cnt+2); i++){
	    	 if($("#must"+i).prop("checked")){
	    		 $("#must"+i).val("Y");
	    		 console.log("dd");
	    	 }
	    	 if($("#multi"+i).prop("checked")){
	    		 $("#multi"+i).val("Y");
	    	 }
	         var data = new Object();
	         data["surveyQuesName"] = $('#QueTypeChoice' + i).val();
	         data["surveyQuesType"] = $('#QueType' + i).val();
	         data["surveyQuesMust"] = $('#must' + i).val();
	         data["surveyQuesMulti"] = $('#multi' + i).val();
	         dataList.push(data);
	      }
	      
	      //dataList를 voList객체로 다시한번 넣어줌. (totData는 객체로 선언, dataList는 Array로 선언)
	      totData["surveyNewVOLists"] = dataList;
	      console.log(totData);

	      //var json_data = JSON.stringify(totData);
	      
		$.ajax({
			url:"insertNewSurvey.sv",
			type:"post",
			data: JSON.stringify(totData),
			contentType:'application/json',
			dataType : "json",
			success: function(data){
				console.log(data.result);
				
				var choiceNumber;
				choiceNumber = data.result;
				console.log("chNumber: " + choiceNumber);
				
				var que = [];
				for(prop in data.result)  {
					  console.log(prop + " : "  + data.result[prop]);
					  que += data.result[prop];
					  que += ",";
				}
				
				/* for(var i=0; i<data.result.size; i++)  {
					  console.log(i + " : "  + data.result[i]);
					  que += data.result[i];
					  que += ",";
				} */
				
				console.log(que);
				
				var queArr = que.split(",");
					  console.log(queArr);
				
			    var totData2 = new Object();
				var dataList2 = new Array();
			    
			    var oplength = [];
				for(i=2; i < (cnt+1); i++){
					if((queArr[i-2] != "") && (queArr[i-2] != null)){
			    	$("#QueTypeChoice"+(i+1)).attr("name", queArr[i-2]);
			    	$($("#QueTypeChoice"+(i+1)).parent().parent().children().children().children("input.input1").attr("name", queArr[i-2]));
					}
				}
			    
				var QuesCodeList1 = new Array();
			    for(var i=2; i < (num2+1); i++){
			    	var data2 = new Object();
			    	 data2["surveyQuesCode"] = $('#setinput' + i).attr('name');
			         data2["surveyChoiceNum"] = $('#setinput' + i).val();
			         data2["surveyChoiceContent"] = $('#setinput' + i).val();
				        	 
			         dataList2.push(data2);
			    }
			    
			      //dataList를 voList객체로 다시한번 넣어줌. (totData는 객체로 선언, dataList는 Array로 선언)
			      totData2["surveyChoiceVOLists"] = dataList2;
			      console.log(totData2);
			      
				  $.ajax({
					url:"insertNewChoice.sv",
					type:"post",
					data: JSON.stringify(totData2),
					contentType:'application/json',
					dataType : "json",
					success: function(data){
						console.log("성공");
					},error:function(data){
						console.log("실패");
					}
				});
				
			},error:function(data){
				console.log("실패");
			}
		});
		
	});

</script>
</html>