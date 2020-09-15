<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/main/mainpage/mainpage.css">
</head>
<body>
    <!-- 메인페이지 헤더 -->
    <header>
        <div id="head-wrapper">
            <div id="header-left">
            	<div id="mainPage-logo">
					<img id="stepup-logo" src="${pageContext.request.contextPath}/resources/images/logo/logo_trans.png">            	
            	</div>
            </div>
            <div id="header-middle"><div class="loginBtn">Login</div></div>
            <div id="header-right"><div class="joinBtn">Get Started</div></div>
        </div>
    </header>
    <div id="mainPage-header-line"></div>

    <!-- 메인페이지 상단 메인 블럭 -->
    <section id="mainPage-section1">
    	<div class="section-wrapper1">
	        <article id="section1-article1">
	            <div id="section1-article1-title1">STEPUP is where <br> work happens</div>
	            <div id="section1-article1-title2">STEPUP gives you everything  you need to stay in sync, <br> hit deadlines, and reach your goals.</div>
	            <div id="section1-article1-btn"><div class="joinBtn">Get Started</div><div class="contactBtn">Contact Us</div></div>
	        </article>
	        <article id="section1-article2">
	        	<img id="img_mainAgile" src="${pageContext.request.contextPath}/resources/images/indiv/main/mainpage/img_mainAgile.png">
	        </article>   
	    </div>     
    </section>


    <section id="mainPage-section2">
	        <div id="mainPageCkickMe">Click Me !</div>
	        <div class="section-wrapper21">	
		        <div id="mainRedBox">
		        	<div class="section-wrapper22">
		        		<div id="mainRedBoxText">You Can See Menu Views</div>
		        	</div>
		        </div>
		        <div id="clickMeImg"></div>
		        
	        </div>
    </section>
    
    <!-- 기능 상세 소개 ------------------------------------------------------------------------------------------------------------------->
    <section id="mainPage-section3">
    
	    <!-- 1. timeline 기능소개 -->
    	<article id="section3-article1">
    			<div class="section3-article1-titles">
	    			<span class="title1">Timeline</span><br>	
	    			<span class="title2">See how the pieces of your project fit together</span><br>
	    			<span class="title2">and keep work on track as things change.</span>
    			</div>
    	    	<div id="img_timeline">
    	    		<img class="img_timeline" src="${pageContext.request.contextPath}/resources/images/indiv/main/mainpage/img_timeline.png">
    	    	</div>
    	</article>
    	
    	<!-- 2. Sprint Backlog 및 Board 기능 소개 -->
    	<article id="section3-article2">
    			<div class="article-title-box sprinSection">
	    			<span class="title1">Sprint Backlog</span><br>	
	    			<span class="title2">You can create sprints and tasks, also can start a sprint.</span><br>
    			</div>
    			<div class="article-title-box2 boardSection">
	    			<span class="title1">Board</span><br>	
	    			<span class="title2">See how the pieces of your project fit together</span><br>
	    			<span class="title2">and keep work on track as things change.</span>
    			</div>
    	    	<div id="img_board">
    	    		<img src="${pageContext.request.contextPath}/resources/images/indiv/main/mainpage/img_board.png">
    	    	</div>
    	    	
    			
    			<div class="article-title-box issueSection">
	    			<span class="title1">Issue</span><br>	
	    			<span class="title2">Let you adjust details about tasks and sub-tasks!</span>
    			</div>
    	</article>
    	
    	
    	<!-- 3.Stand Up Meeting 기능 소개  -->
    	<article id="section3-article3">
   			<img id="img_standupMeeting" src="${pageContext.request.contextPath}/resources/images/indiv/main/mainpage/img_standupMeeting.png">
    		<div class="article-title-box standUpMeetingSection">
    			<span class="title1">Stand Up Meeting</span><br>	
    			<span class="title2">You can share your schedule with your team easily,</span><br>
    			<span class="title2">also can see recent news!</span><br>
    		</div>    	
    	</article>
    	
    	<!-- 4.Feedback Form 기능 소개  -->
    	<article id="section3-article4">
    		<img id="img_feedbackForm" src="${pageContext.request.contextPath}/resources/images/indiv/main/mainpage/img_feedbackForm.png">
    		<div class="article-title-box2 feedbackForm">
    			<span class="title1">Feedback Form</span><br>	
    			<span class="title2">Get feedback from team members</span><br>
    			<span class="title2">and rebalance work to keep projects on track.</span><br>
    		</div>   	
    	</article>
    	
    	<!-- 5. Calendar 기능 소개  -->	
    	<article id="section3-article5">
    		<div class="article-title-box">
    			<span class="title1">Calendar</span><br>	
    			<span class="title2">View your work on a calendar to easily spot holes and</span><br>
    			<span class="title2">overlaps in your schedule and make adjustments.</span><br>
    		</div>
    	  
    	</article>

    </section>
    
    
    <section id="mainPage-section4"></section>
    <section id="mainPage-section5">Want to know more about STEPUP for your enterprise?</section>
    <footer>
		<div class="ft" align="center">
			<div id="footer-left">
                <div class="footer-title">
                    <h3>STEPUP Company. All Right Reserved.</h3>
                </div>
                <div class="footer footer-content">
                    상호명 : (주)STEPUP | 대표 : 김정수 | 사업자 등록번호 : 211-88-04999 | 통신판매업 신고번호 : 2020 - 서울 강남구 -0333 | <br>
                    영업소재지: 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층 C강의실 | 이메일: yourEmail@gmail.com 
                </div>
            </div>
            <div id="footer-right">
                <div class="footer footer-client">
                    <div>고객센터 <br> 대표번호 : 1234-4321 <br> 이용약관 | 개인정보처리방침</div>
                </div>
            </div>    
		</div>
	</footer>
</body>
</html>