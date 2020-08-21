<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#backimg {
		width:100%;
		height: 200px;
		background-color:pink;
		z-index:-1;
	}
	#profile {
		width:100px;
		height:100px;
		border-radius:75px;
		margin-left:330px;
		margin-top:-40px;
		background-color:gray;
	}
	#profilePhoto {
		width:80px;
		height:80px;
		margin-left:10px;
		margin-top:10px;
		z-index:1;
	}
	#name {
		margin-left: 333px;
		margin-top:20px;
		font-size:30px;
	}
	.personalInfo {
		margin-left:300px;
		margin-top:20px;
	}
	#manage {
		width: 300px;
		height : 30px;
		background-color : #F1F1F1;
		text-align: center;
		vertical-align:center;
		border-radius:5px;
	}
	#manageTable {
		width:300px;
		height:450px;
		border: 1px solid #F1F1F1;
		margin-top:20px;
		border-radius:5px;
	}
	#manageTable tr td {
		padding-left:30px;
	}
	.list {
		padding-top: 30px;
	}
	.iconImage {
		width:30px;
		height:30px;
		z-index:1;
	}
	.info {
		padding-right:130px;
	}
	.teamList{
		width: 600px;
		height: 200px;
		background-color:#F1F1F1;
		padding-top:1px;
		border-radius:5px;
	}
	#team {
		margin-left:800px;
		margin-top:-500px;
		font-size:20px;
	}
	#teamProfile {
		width:100px;
		height:100px;
		border-radius:75px;
		margin-top:10px;
		margin:0 auto;
		background-color:gray;

	}
	#teamName {
		padding-top:110px;
		z-index:1;
		margin-left:27px;
		font-size:18px;
	}
	#teamBack {
		width:150px;
		height:165px;
		margin-left:10px;
		margin-top:5px;
		background-color:white;
		padding-top:20px;
		border-radius:5px;
	}
	#project {
		margin-left: 800px;
		margin-top: 20px;
		font-size:20px;
	}
	#projectList {
		width:600px;
		height:200px;
		background-color: #F1F1F1;
		padding-top:1px;
		border-radius:5px;
	}
	#projectListBack {
		width:580px;
		height:40px;
		background-color:white;
		margin-top:10px;
		margin-left:10px;
		padding-top:8px;
		border-radius:5px;
	}
	#projcetLogo {
		width:30px;
		height:30px;
		border-radius:75px;
		margin-left:13px;
		background-color:gray;
	}
	#projectName {
		margin-left:80px;
		margin-top:-30px;
	}
	input{
        border: 0;
        outline: 0;
        widtth:50px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div id="backimg"></div>
	<div id="profile"><img src="/agile/resources/icon/common/icon_user.png" id="profilePhoto"></div>
	<div id="name"><label><c:out value="${ sessionScope.loginUser.userName }"/></label></div>
	<div>
		<div class="personalInfo">
		<div id="manage">계정 및 개인정보 관리</div>
			<table id="manageTable">
				<tr>
					<td colspan="2">정보</td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_briefcase.png" class="iconImage"></td>
					<td class="info"><input type="text" placeholder="직업" class="infoInput"></td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_business.png" class="iconImage"></td>
					<td class="info"><input type="text" placeholder="부서" class="infoInput"></td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_smile.png" class="iconImage"></td>
					<td class="info"><input type="text" placeholder="조직" class="infoInput"></td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_main_pin.png" class="iconImage"></td>
					<td class="info"><input type="text" placeholder="회사명" class="infoInput"></td>
				</tr>
				<tr>
					<td class="list" colspan="2">연락처</td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_mail.png" class="iconImage"></td>
					<td class="info"><c:out value="${ sessionScope.loginUser.userEmail }"/></td>
				</tr>
				<tr>
					<td class="list" colspan="2">팀</td>
				</tr>
				<tr>
					<td><img src="/agile/resources/icon/common/icon_users.png" class="iconImage"></td>
					<td class="info"><input type="text" placeholder="팀명" class="infoInput"></td>
				</tr>
			</table>
		</div>
		<div id="team">팀원
			<div class="teamList">
				<div id="teamBack">
					<div id="teamProfile">
						<div id="teamName">
							이름
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="project">작업위치
			<div id="projectList">
			<div id="projectListBack">
				<div id="projcetLogo"></div>
				<div id="projectName">프로젝트 이름</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>