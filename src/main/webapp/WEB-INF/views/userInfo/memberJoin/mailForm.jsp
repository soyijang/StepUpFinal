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
            font-family: 'Noto Sans KR';
        }
        #logo {
            width: 200px;
            height: 50px;
            margin-left: 600px;
            margin-top: 30px;
        }
        .login {
            width: 506px;
            height: 400px;
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
            padding-left: 120px;
        }
        #man {
            width: 300px;
            height: 300px;
            margin-left: 900px;
            margin-top: -90px;
            z-index: 2;
        }
        #manPic {
        	margin-top:30px;
        }
        #woman {
            width: 300px;
            height: 300px;
            z-index: 2;
            margin-left: -50px;
            margin-top: -280px;
        }
        #wrapper {
            width: 1440px;
            height: 900px;
            margin: auto auto;
        }
        .email {
            width: 150px;
            height: 150px;
            margin: 10px 50px;
            margin-left:85px;
        }
        #message {
            width: 400px;
            margin: 10px 50px;
            margin-left:50px;
            padding-top:20px;
        }
        #message-email {
            width: 400px;
            height: 45px;
            margin: 10px 75px;
            margin-top:40px;
        }
        #emailAddress {
        	width:400px;
        	margin-left:100px;
        }
        hr {
            width: 450px;
            margin-top: 100px;
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
	<form action="verify.me" method="post">
	<div id="wrapper">
    <div><img src="/agile/resources/images/logo/logo_trans.png" id="logo"></div>
    <div class="login">
        <div id="title"><label>Check your inbox to finish signup</label></div>
        <div class="email"><img src="/agile/resources/images/indiv/main/userInfo/login/loginEmail.png" class="email"></div>
        <div id="message"><label id="message-email">We sent a singup link to you at</label></div>
        <div id="emailAddress">${ loginUser.userEmail }</div>
    </div>
    <div id="man"><img src="/agile/resources/images/files/login_man.png" id="manPic"></div>
    				<div id="woman"><img src="/agile/resources/images/files/login_woman.png"></div>
    				<div><img src="/agile/resources/images/logo/logo_trans.png" id="bottomlogo"></div>
    <div id="bottomlabel"><label>with one account, can meet everyone</label></div>
    </div>
    </form>
</body>
</html>