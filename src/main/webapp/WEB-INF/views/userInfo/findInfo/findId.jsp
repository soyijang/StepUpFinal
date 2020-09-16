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
            padding-left: 170px;
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
        /* #email {
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
        } */
        #id_Radio{
        	float:left;
        	margin-left:100px;
        	margin-right:20px;
        }
        #searchI {
        	margin-top:20px;
        	margin-left:60px;
        }
        #searchP {
        	margin-top:20px;
        	margin-left:60px;
        }
        .form_group input {
        	margin-bottom:20px;
        	width: 400px;
        	height: 45px;
        }
        .idBtn {
        	margin-bottom:94px;
        }
        #rectangle6 {
            background:#DD0351;
            height: 30px;
            width: 80px;
            border-radius: 10px;
            border: 0;
            font-size: 8px;
            color: white;
            text-align: center;
            margin-left: 100px;     
        }
        #rectangle7 {
            background:white;
            height: 30px;
            width: 80px;
            border-radius: 10px;
            border: 1px solid #DD0351;
            font-size: 8px;
            color:#DD0351;
            text-align: center;
            margin-left: 20px;      
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
				<div id="wrapper">
    					<img src="${ contextPath }/resources/images/logo/logo_trans.png" id="logo">
    					<div class="login">
        				<div id="title"><label>Find out your account</label></div>
        				<div class="custom_radio" id="id_Radio">
        				<input type="radio" class="custom_input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
        				<label class="custom_control_label" for="search_1">Find your ID</label>
        				</div>
        				<div class="custom_radio" id="password_Radio">
        				<input type="radio" class="custom_input" id="search_2" name="search_total" onclick="search_check(2)">
        				<label class="custom_control_label" for="search_2">Find your Password</label>
        				</div>
        				<!-- 아이디 -->
        				<div id="searchI">
        					<div class="form_group">
        						<label for="inputPhone_1">📱 Phone</label>
        						<div><input type="text" class="form_control" id="inputPhone_1" name="inputPhone_1" placeholder="01012345678"></div>
        					</div>
        					<div class="form_group">
        						<button id="rectangle6" type="button" class="idBtn">Submit</button>
        						<button id="rectangle7" class="idBtn">Cancel</button>
        					</div>
        				</div>
        				<!-- 비밀번호 -->
        				<form action="findPassword.me" method="post">
        				<div id="searchP" style="display:none;">
        					<div class="form_group">
        						<label for="inputEmail_1">📧 Email</label>
        						<div><input type="text" class="form_control" id="inputEmail_1" name="email" placeholder="Enter your email"></div>
        					</div>
        					<div class="form_group">
        						<label for="inputPhone_1">📱 Phone</label>
        						<div><input type="text" class="form_control" id="phone1" name="phone" placeholder="01012345678"></div>
        					</div>
        					<div class="form_group">
        						<button id="rectangle6" type="submit">Submit</button>
        						<button id="rectangle7">Cancel</button>
        					</div>
        				</div>
        				</form>
        				<!-- <input type="text" placeholder="Enter your email" id="email" name="userEmail">
        				<input type="password" placeholder="Enter your password" id="password" name="userPwd">
        				<input type="submit" value="Continue" id="continue"></button> -->
        				<!-- </div> -->
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
<%-- 		</c:if> --%>
<script>
	function search_check(num) {
		if(num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		} else {
			document.getElementById("searchP").style.display = "";
			document.getElementById("searchI").style.display = "none";
		}
	}
	
/* 	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var pwdSearch_click = function(){
		var email = $("#inputEmail_1").val();
		var phone = $("#inputPhone_1").val();
		
		$.ajax({
			type:"POST",
			url : "checkInfo.me",
			type : "POST",
			data : {
				email:email,
				phone:phone
			},
			success : function(result) {
				alert(result);
			},
			error:function(){
    			console.log("에러!");
    		},
    		beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
            complete : function(){
                $('.wrap-loading').addClass('display-none');
             }
		});
	} */
	
	/* var message = '${msg}';
	alert(message); */
</script>
</body>
</html>