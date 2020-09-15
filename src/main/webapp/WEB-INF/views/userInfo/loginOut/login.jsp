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
            font-family : 'Noto Sans KR';
        }
        #logo {
            width: 200px;
            height: 50px;
            margin-left: 600px;
            margin-top: 30px;
        }
        .login {
            width: 506px;
            height: 611px;
            background-color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 5px;  
            z-index: 1;   
            margin: auto auto;
            margin-top: 30px;
            vertical-align: middle;
        }
        #title {
            width: 376px;
            height: 48px;
            padding-top: 40px;
            padding-left: 150px;
        }
        #man {
            width: 300px;
            height: 300px;
            margin-left: 900px;
            margin-top: -260px;
            z-index: 2;
        }
        #woman {
            width: 300px;
            height: 300px;
            z-index: 2;
            margin-left: -50px;
            margin-top: -320px;
        }
        #wrapper {
            width: 1440px;
            height: 900px;
            margin: auto auto;
        }
        #email {
            width: 400px;
            height: 45px;
            margin: 10px 50px;
        }
        #password {
            width: 400px;
            height: 45px;
            margin: 20px 50px;
        }
        #continue {
            width: 405px;
            height: 45px;
            background-color: #DD0351;
            border: 0;
            outline: 0;
            margin: 10px 50px;
        }
        hr {
            width: 450px;
            margin-top: 130px;
        }
        #findId {
        	margin : 15px 120px;
        }
        #sign {
        	margin: -38px 250px;
        	width:200px;
        }
        #circle1{
  			background-color: black;
  			width:10px;
  			height:10px;
  			border-radius: 50px;
			margin-left: 95px;
			margin-top:80px;
		}
		#circle2{
  			background-color: black;
  			width:10px;
  			height:10px;
  			border-radius: 50px;
  			margin-left: 280px;
  			margin-top:3px;
		}
        #privacy {
            margin:-17px 110px;
        }
        #notice {
            margin: -17px 300px;
            width: 100px;
        }
        #bottomlogo {
            width: 200px;
            height: 50px;
            margin: 30px 600px;
        }
        #bottomlabel {
            width: 300px;
            height: 50px;
            margin: -30px 570px;
        }
    </style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<%-- 		<c:if test="${ empty sessionScope.loginUser }"> --%>
			<form action="login.me" method="post">
				<div id="wrapper">
    					<img src="${ contextPath }/resources/images/logo/logo_trans.png" id="logo">
    					<div class="login">
        				<div id="title"><label>Log in to your account</label></div>
        				<input type="text" placeholder="Enter your email" id="email" name="userEmail">
        				<input type="password" placeholder="Enter your password" id="password" name="userPwd">
        				<input type="submit" value="Continue" id="continue"></button>
        				<hr>
        				<div class="account" id="findId"><a href="findAccount.me">Can't log in?</a></div>
        				<div id="sign"><a href="memberJoinForm.me">Sign up for account</a></div>
        				<div id="circle1"></div><div id="privacy"><label>Privacy Policy</label></div>
        				<div id="circle2"></div><div id="notice"><label>User Notice</label></div>        
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