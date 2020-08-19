<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            top: 240px;
            left: 50px;
            width: 400px;
            height: 45px;
        }
        #name {
            position: absolute;
            top: 170px;
            left: 50px;
            width: 400px;
            height: 45px;
        }
        #policy {
            position: absolute;
            top: 310px;
            left: 60px;
            width: 400px;
            height: 45px;
        }
        #continue {
            position: absolute;
            top: 380px;
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
            top: 530px;
            left: 30px;
        }
        .account {
            position: absolute;
            top: 500px;
        }
        #sign {
            left: 110px;
            top:560px;
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
	<form action="insert.me" method="post">
	<div id="wrapper">
    <div><img src="line.png" id="logo"></div>
    <div class="login">
        <div id="title"><label>Sign up for your account</label></div>
        <input type="text" placeholder="Enter your email" id="email" name="userEmail">
        <input type="text" placeholder="Enter your name" id="name" name="userName">
        <input type="text" placeholder="Enter your password" id="password" name="userPwd">
        <div id="policy"><label>By signing up, I accept the Stepup Cloud Terms of Service and acknowledge the Privacy Policy.</label></div>
        <input type="submit" value="Continue" id="continue"></button>
        <hr>
        <div class="account" id="sign"><label>Already have an Stepup account? Login</label></div>    
    </div>
    <div id="man"><img src="man.png"></div>
    <div id="woman"><img src="woman.png"></div>
    <div><img src="line.png" id="bottomlogo"></div>
    <div id="bottomlabel"><label>with one account, can meet everyone</label></div>
    </div>
    </form>
</body>
</html>