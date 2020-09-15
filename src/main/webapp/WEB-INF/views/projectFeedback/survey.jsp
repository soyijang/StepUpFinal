<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
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
    height: 270px;
    margin: 30px;
    text-align: center;
    display: inline-block;
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
					</script> 
					<!-- <script>
						$(function() {
							$('#btn').on('click',function(){
								$("#update").html("update");
							})
						})
					
					</script> -->
</body>
</html>