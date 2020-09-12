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
        #name {
            width: 400px;
            height: 45px;
            margin: 10px 50px;
        }
        #phone {
            width: 400px;
            height: 45px;
            margin: 10px 50px;
        }
        #password {
            width: 400px;
            height: 45px;
            margin: 10px 50px;
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
            margin-top: 30px;
        }
        .account {
            margin: 15px 170px;
            width: 150px;
        }
        
        #policy {
            width: 400px;
            height: 45px;
            margin: 10px 50px;
        }
        
        #sign {
            left: 110px;
            top:560px;
            width: 300px;
            margin: 25px 100px;
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
	<form action="insert.me" method="post">
	<div id="wrapper">
    <div><img src="/agile/resources/images/logo/logo_trans.png" id="logo"></div>
    <div class="login">
        <div id="title"><label>Sign up for your account</label></div>
        <input type="text" placeholder="Enter your email" id="email" name="userEmail">
        <input type="text" placeholder="Enter your name" id="name" name="userName">
        <input type="text" placeholder="Enter your phone" id="phone" name="userPhone">
        <input type="password" placeholder="Enter your password" id="password" name="userPwd">
        <div id="policy"><label>By signing up, I accept the Stepup Cloud Terms of Service and acknowledge the Privacy Policy.</label></div>
        <input type="submit" value="Continue" id="continue"></button>
        <hr>
        <div class="account" id="sign"><label>Already have an Stepup account?</label><a href="backlogin.me">Login</a></div>    
    </div>
    <div id="man"><img src="/agile/resources/images/files/login_man.png"></div>
    				<div id="woman"><img src="/agile/resources/images/files/login_woman.png"></div>
    				<div><img src="/agile/resources/images/logo/logo_trans.png" id="bottomlogo"></div>
    <div id="bottomlabel"><label>with one account, can meet everyone</label></div>
    </div>
    </form>
</body>
</html>