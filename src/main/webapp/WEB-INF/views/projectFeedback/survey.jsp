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
.addSurvey {
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
.modalTable{
	width: 1000px;
	margin-top: 40px;
  }
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 2; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }
  
  /* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 10px;
    border: 1px solid #c4c4c4;
    width: 35%; /* Could be more or less, depending on screen size */
    z-index:1;
    border-radius: 10px;
    box-shadow: 0 0 4px #cccccc;
    height: 400px;
  }
#button-area{
	margin-top: 280px;
}	
.dropdown {
    width: 50px;
    display: inline-block;
    background-color: #ffffff;
    box-shadow: 0 0 2px #cccccc;
    transition: all .5s ease;
    position: relative;
    font-size: 14px;
    color: #474747;
    height: 100%;
    text-align: center;
    border-radius: 5px;
    border: 1px solid #dd0351;
  }
  .dropdown .select {
      cursor: pointer;
      display: block;
      padding: 5px
  }
  .dropdown .select > i {
      font-size: 13px;
      color: #888;
      cursor: pointer;
      transition: all .3s ease-in-out;
      float: right;
      line-height: 20px
  }
  .dropdown:hover {
      box-shadow: 0 0 4px #FEF5F8;
      text-decoration-color: #dd0351;
      background-color: #FEF5F8;
      border-color: #FEF5F8;
  }
  .dropdown:active {
      background-color: #FEF5F8;
  }
  .dropdown.active:hover,
  .dropdown.active {
      box-shadow: 0 0 4px #FEF5F8;
      border-radius: 2px 2px 0 0;
      background-color: #f8f8f8;
  }
  .dropdown.active .select > i {
      transform: rotate(-90deg)
  }
  .dropdown .dropdown-menu {
      position: absolute;
      background-color: #fff;
      width: 100%;
      left: 0;
      margin-top: 1px;
      box-shadow: 0 1px 2px#FEF5F8;
      overflow: hidden;
      display: none;
      max-height: 144px;
      overflow-y: auto;
      z-index: 9;
          border: 1px solid #dd0351;
      
  }
  .dropdown .dropdown-menu li {
      padding: 5px;
      transition: all .2s ease-in-out;
      cursor: pointer
  } 
  .dropdown .dropdown-menu {
      padding: 0;
      list-style: none
  }
  .dropdown .dropdown-menu li:hover {
      color: #dd0351;
      background-color: #FEF5F8;
  }
  .dropdown .dropdown-menu li:active {
      background-color: #FEF5F8;
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
                    <div id="projectTitle2">Form / </div>
                    <div id="menuTitle">피드백</div>
                </div>
                <div id="contentBox">
                    <div id="projectSurvey">
                        <hr class="projectSurveyHr">
                        <p class="projectSurveyP">프로젝트 설문지</p>
                    </div>

                    <div id="projectSurveyInsert">
                        <div id="surveyInsert">
                        <button onclick="" class="addSurvey" id="apply">+</button>
                            <p>설문추가</p>
                        </div>
						
					    <!-- Trigger/Open The Modal -->
					
					
					    <!-- The Modal -->
					    <div id="myModal" class="modal">
					      <!-- Modal content -->
					      <div class="modal-content">
					        <p align="center" class ="modaltitle" style="font-size:30px;">📧설문을 추가하시겠습니까?</p>
					        <table align="left" class="modalTable" style="width:100%;">
					        	<tr>
					        		<td>스프린트</td>
					        		<td>
					        		<div class="dropdown" style="width:290px;">
							        <div class="select">
							              <span id="sprint-name">스프린트</span>
							          <i class="fa fa-chevron-left"></i>
							        </div>
							        <ul class="dropdown-menu">
							          <li id="all">스프린트</li>
							          <c:forEach var="i" items="${ endSprintList }">
							          <li id="sprint-category"> ${ i.sprintName }</li>
							          </c:forEach>
							        </ul>
						      </div></td>
					        	</tr>
					            <tr>
					            	<td>설문지 명</td>
					            	<td><input type="text" id="survey-name" size="40"></td>
					            </tr>
					            <tr>
					            	<td>설문지 설명</td>
					            	<td><input type="text" id="survey-intro" size="40"></td>
					            </tr>
					            <tr>
					            	<td>설문지 시작날짜</td>
					            	<td><input type="date" id="survey-start-date" size="40"></td>
					            </tr>
					            <tr>
					            	<td>설문지 종료날짜</td>
					            	<td><input type="date" id="survey-end-date" size="40"></td>
					            </tr>
					        </table>
					        <div id="button-area">
						        <button class="" id="survey-save">저장</button>
						        <button class="close" id="">취소</button>
					        </div>
					      </div>
					    
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
   
<script>
	// Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the button that opens the modal
	var btn = document.getElementById("apply");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	    $(modal).fadeIn(300); 
	    $(modal).css('display','block');
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    $(modal).css('display','none');
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	};
	

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
	
	
	
	
	$(document).on('click', '#survey-save', function(){
		var sprintName = $("#sprint-name").html();
		console.log(sprintName);
		
		var surveyName = $("#survey-name").val();
		console.log(surveyName);
		
		var surveyIntro  = $("#survey-intro").val();
		console.log(surveyIntro);
		
		var surveyStartDate  = $("#survey-start-date").val();
		console.log(surveyStartDate);
		
		var surveyEndDate  = $("#survey-end-date").val();
		console.log(surveyEndDate);
		
	    $.ajax({
			url:"newSurvey.sv",
			type:"post",
			data:{"surveyName" : surveyName, "surveyIntro": surveyIntro, "surveyStartDate":surveyStartDate, "surveyEndDate":surveyEndDate, "sprintName":sprintName},
			dataType : "json",
			success: function(data){
				location.href="selectSurvey.sv";
				
			},error:function(data){
				
			}
		});
	});
	
</script>
</body>
</html>