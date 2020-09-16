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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/issueType.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/font.css">
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
    margin-top: 60px;
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
    height: 270px;
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
  #survey-name, #survey-intro, #survey-start-date, #survey-end-date{
  	  border: 1px solid #C4C4C4;
  	  border-radius: 5px;
  	  height:20px;
  }
  #survey-save, #survey-cancel{
  		outline: none;
  		border: 0;
  		background-color: #dd0351;
  		color: white;
  		border-radius: 5px;
  }
 .surveydropdown {
    display: inline-block;
    background-color: white;
    box-shadow: 0 0 2px #cccccc;
    transition: all .5s ease;
    position: relative;
    font-size: 14px;
    color: #474747;
    height: 100%;
    text-align: center;
  }

  .surveydropdown .select {
      cursor: pointer;
      width:36px;
  }
  .surveydropdown .select > i {
      font-size: 13px;
      color: #888;
      cursor: pointer;
      transition: all .3s ease-in-out;
      float: right;
      line-height: 20px;
  }
  .dropdown:hover {
      box-shadow: 0 0 4px #FEF5F8;
      text-decoration-color: #dd0351;
      background-color: #2B2B49;
  }
  .surveydropdown:active {
      background-color: #FEF5F8;
      
  }
  .surveydropdown.active:hover,
  .surveydropdown.active {
      box-shadow: 0 0 4px #FEF5F8;
      background-color: #2B2B49;
  }
  .surveydropdown.active .select > i {
      transform: rotate(-90deg);
  }
  .surveydropdown .surveydropdown-menu {
      position: absolute;
      background-color: none;
      width: 100px;
      left: 0;
      margin-top: 1px;
      box-shadow: 0 1px 2px#FEF5F8;
      overflow: hidden;
      display: none;
      max-height: 144px;
      overflow-y: auto;
      z-index: 9;
  }
  .surveydropdown .surveydropdown-menu li {
      padding: 5px;
      transition: all .2s ease-in-out;
      cursor: pointer;
  } 
  .surveydropdown .surveydropdown-menu {
      padding: 0;
      list-style: none;
  }
  .surveydropdown .surveydropdown-menu li:hover {
      color: #dd0351;
      background-color: #FEF5F8;
  }
  .surveydropdown .surveydropdown-menu li:active {
      background-color: #FEF5F8;
  }

</style>


</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
 	<%@ include file="../common/menubar.jsp" %>
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
						        <button class="close" id="survey-cancel">취소</button>
					        </div>
					      </div>
					    
					    </div>
                    </div>
                    <br><br>
                    <div id="btn">
                        <button id="question">질문&nbsp;&nbsp;<mark></mark></button>&nbsp;
                        <button id="answer">응답&nbsp;&nbsp;
		<c:if test="${ fn:length(surveyList) ne 0 }">
                        <mark><c:out value="${ fn:length(surveyList) }"/></mark>
                         </c:if>
		</button>
                    </div>
                    <hr><br>

                      <div id="surveyAnswerList">
                        <c:if test="${ fn:length(surveyList) ne 0 }">
                           <c:forEach var="i" begin="0" end="${ fn:length(surveyList)-1 }">
                    <div id="surveyAnswer">
                        <div id="surveyImage">
                            <img src="resources/icon/common/icon_survey.png">
                        </div>
                        <div id="surveyList" style="display: inline-block;">
                              <p><c:out value="${ surveyList[i].surveyName }"/>
                              <p style="display: inline-block;"><c:out value="${ surveyList[i].surveyCreateDate }"/></p>
                            <button class="surveyUpdate" style="display: inline-block; border: 0px; background: none;">
                            
                           <div class="surveydropdown">
                    <div class="select">
                        <img src="resources/icon/common/icon_more verticalicon.png" style="width: 20px;">                    
               <i class="fa fa-chevron-left"></i>
                    </div>
                    <ul class="surveydropdown-menu">
                     <!--  <li id="update"><a href="">이름바꾸기</a></li> -->
                      <li id="update"><a href="">수정하기</a></li>
                      <li id="delete"><a href="delete.sv">삭제하기</a></li>
                    </ul>
                  </div>
                        </button>    
                        </div>
                    </div>
                           </c:forEach>
                            </c:if>
                    
                    </div>
                  </div>
            </div>

	<script>
	 $('.surveyUpdate').click(function() {
                     $(this).attr('tabindex', 1).focus();
                     $(this).toggleClass('active');
                     $(this).find('.surveydropdown-menu').slideToggle(300);
                  });
                  
                  $('.surveyUpdate').focusout(function() {
                     $(this).removeClass('active');
                     $(this).find('.surveydropdown-menu').slideUp(300);
                  });
                  
                  $('.surveyUpdate .surveydropdown-menu li').click(
                     function() {
                        $(this).parents('.surveyUpdate').find('span').text($(this).text());
                        $(this).parents('.surveyUpdate').find('input').attr('value',$(this).attr('id'));
                  });
                  
                  $('.surveydropdown-menu li').click(function() {
                        var input = '<strong>' + $(this).parents('.surveyUpdate').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
                        $('.msg').html(msg + input + '</span>');
                  });     

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