<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        body {
            background-color: #E5E5E5;
        }
        #logo {
            position: absolute;
            width: 200px;
            height: 50px;
            top: 40px;
            left: 650px;
        }
        .login {
            position: absolute;
            width: 506px;
            height: 611px;
            left: 499px;
            top: 130px;
            background-color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 5px;  
            z-index: 1;   
        }
        #title {
            width: 376px;
            height: 48px;
            margin-top: 40px;
            margin-left: 170px;
        }
        #man {
            position: relative;
            width: 300px;
            height: 300px;
            top: 470px;
            left: 900px;
            z-index: 2;
        }
        #woman {
            position: relative;
            width: 300px;
            height: 300px;
            top: 140px;
            z-index: 2;
        }
        #wrapper {
            border: 1px solid;
            width: 1440px;
            height: 900px;
        }
        #email {
            position: absolute;
            top: 100px;
            left: 50px;
            width: 400px;
            height: 45px;
        }
        #password {
            position: absolute;
            top: 170px;
            left: 50px;
            width: 400px;
            height: 45px;
        }
        #continue {
            position: absolute;
            top: 240px;
            left: 50px;
            width: 405px;
            height: 45px;
            background-color: #DD0351;
            border: 0;
            outline: 0;
        }
        hr {
            position: absolute;
            width: 450px;
            top: 470px;
            left: 30px;
        }
        .account {
            position: absolute;
            top: 500px;
        }
        #sign {
            left: 180px;
        }
        #privacy {
            position: absolute;
            top: 550px;
            left: 130px;
        }
        #notice {
            position: absolute;
            top: 550px;
            left: 300px;
        }
        #bottomlogo {
            position: absolute;
            width: 200px;
            height: 50px;
            top: 780px;
            left: 650px;
        }
        #bottomlabel {
            position: absolute;
            width: 300px;
            height: 50px;
            top: 840px;
            left: 620px;
        }
    </style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<%-- 		<c:if test="${ empty sessionScope.loginUser }"> --%>
			<form action="login.me" method="post">
				<div id="wrapper">
    				<div><img src="${ contextPath }/resources/images/logo/logo_trans.png" id="logo"></div>
    					<div class="login">
        				<div id="title"><label>Log in to your account</label></div>
        				<input type="text" placeholder="Enter your email" id="email" name="userEmail">
        				<input type="text" placeholder="Enter your password" id="password" name="userPwd">
        				<input type="submit" value="Continue" id="continue"></button>
        				<hr>
        				<div class="account" id="sign"><a href="memberJoinForm.me">Sign up for account</a></div>
        				<div id="privacy"><label>Privacy Policy</label></div>
        				<div id="notice"><label>User Notice</label></div>        
    				</div>
    				<div id="man"><img src="${ contextPath }/resources/images/files/login_man.png"></div>
    				<div id="woman"><img src="${ contextPath }/resources/images/files/login_woman.png"></div>
    				<div><img src="${ contextPath }/resources/images/logo/logo_trans.png" id="bottomlogo"></div>
    				<div id="bottomlabel"><label>with one account, can meet everyone</label></div>
    			</div>
			</form>
<%-- 		</c:if> --%>
</body>
</html>