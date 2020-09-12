<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>

<style>
body {
	font-family: 'Noto Sans KR';
}

#backimg {
	width: 100%;
	height: 200px;
	background-color: pink;
	z-index: -1;
}

#mainProfile {
	width: 100px;
	height: 100px;
	border-radius: 75px;
	margin-left: 100px;
	margin-top: -40px;
	background-color: gray;
}

#profilePhoto {
	width: 80px;
	height: 80px;
	margin-left: 10px;
	margin-top: 10px;
	z-index: 1;
}

#name {
	margin-left: 100px;
	margin-top: 20px;
	font-size: 30px;
}

.personalInfo {
	margin-left: 100px;
	margin-top: 20px;
}

#manage {
	width: 300px;
	height: 30px;
	background-color: #F1F1F1;
	text-align: center;
	vertical-align: center;
	border-radius: 5px;
}

#manageTable {
	width: 300px;
	height: 450px;
	border: 1px solid #F1F1F1;
	margin-top: 10px;
	border-radius: 5px;
}

.iconImage {
	width: 30px;
	height: 30px;
	z-index: 1;
}

.info {
	width: 50px;
	height: 40px;
}

.teamList {
	width: 600px;
	height: 200px;
	background-color: #F1F1F1;
	padding-top: 1px;
	border-radius: 5px;
	overflow-x :auto;
}

#team {
	margin-left: 550px;
	margin-top: -500px;
	font-size: 20px;
}

#teamProfile {
	width: 100px;
	height: 100px;
	border-radius: 75px;
	margin-top: 10px;
	margin: 0 auto;
	background-color: gray;
}

#teamName {
	padding-top: 110px;
	z-index: 1;
	margin-left: 27px;
	font-size: 18px;
	text-align:center;
}

#teamBack {
	width: 150px;
	height: 165px;
	margin-left: 10px;
	margin-top: 5px;
	background-color: white;
	padding-top: 20px;
	border-radius: 5px;
}

#project {
	margin-left: 550px;
	margin-top: 20px;
	font-size: 20px;
}

#projectList {
	width: 600px;
	height: 200px;
	background-color: #F1F1F1;
	padding-top: 1px;
	border-radius: 5px;
	overflow-y :auto;
}

#projectListBack {
	width: 580px;
	height: 40px;
	background-color: white;
	margin-top: 10px;
	margin-left: 10px;
	padding-top: 8px;
	border-radius: 5px;
}

#projcetLogo {
	width: 30px;
	height: 30px;
	border-radius: 75px;
	margin-left: 13px;
	background-color: gray;
}

#projectName {
	margin-left: 80px;
	margin-top: -30px;
}

#infoInput {
	border: 0;
	outline: 0;
	margin-left: -50px;
	height: 35px;
}

.job {
	float: left;
}

.row {
	padding-left: 30px;
	width: 30px;
	height: 30px;
	margin-left: 30px;
}

.btnImage {
	width: 20px;
	height: 20px;
}

.jobbtn {
	display: none;
}

.deptbtn {
	display: none;
}

.companybtn {
	display: none;
}


</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<div id="content" style="padding: 0px; padding-top: -20px">
		<div id="backimg"></div>
		<div id="mainProfile">
			<img src="/agile/resources/icon/common/icon_user.png"
				id="profilePhoto">
		</div>
		<div id="name">
			<label><c:out value="${ sessionScope.loginUser.userName }" /></label>
		</div>
		<div>
			<div class="personalInfo">
				<div id="manage">계정 및 개인정보 관리</div>
				<table id="manageTable">
					<tr>
						<td colspan="2" class="row">정보</td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_briefcase.png"
							class="iconImage"></td>
						<td class="info"><input type="text" placeholder="직업"
							class="infoInput" id="job"></td>
						<td id="btnTd"><button type="submit" class="jobbtn"
								id="insertJob" onclick="insertJob()">
								<img src="/agile/resources/icon/common/icon_check.png"
									class="btnImage">
							</button></td>
						<td id="btnTd"><button type="reset" class="jobbtn">
								<img src="/agile/resources/icon/common/icon_x.png"
									class="btnImage">
							</button></td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_business.png"
							class="iconImage"></td>
						<td class="info"><input type="text" placeholder="부서"
							class="infoInput" id="department"></td>
						<td><button type="submit" class="deptbtn"
								onclick="insertDept()">
								<img src="/agile/resources/icon/common/icon_check.png"
									class="btnImage">
							</button></td>
						<td><button type="reset" class="deptbtn">
								<img src="/agile/resources/icon/common/icon_x.png"
									class="btnImage">
							</button></td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_main_pin.png"
							class="iconImage"></td>
						<td class="info"><input type="text" placeholder="회사명"
							class="infoInput" id="company"></td>
						<td><button type="submit" class="companybtn"
								onclick="insertCom()">
								<img src="/agile/resources/icon/common/icon_check.png"
									class="btnImage">
							</button></td>
						<td><button type="reset" class="companybtn">
								<img src="/agile/resources/icon/common/icon_x.png"
									class="btnImage">
							</button></td>
					</tr>
					<tr>
						<td class="row" colspan="2">연락처</td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_mail.png"
							class="iconImage"></td>
						<td class="info"><c:out
								value="${ sessionScope.loginUser.userEmail }" /></td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_phone.png"
							class="iconImage"></td>
						<td class="info"><c:out
								value="${ sessionScope.loginUser.userPhone }" /></td>
					</tr>
					<tr>
						<td class="row" colspan="2">팀</td>
					</tr>
					<tr>
						<td class="row"><img
							src="/agile/resources/icon/common/icon_users.png"
							class="iconImage"></td>
						<td class="info"><input type="text" placeholder="팀명"
							class="infoInput">
						<c:out value="${ i.teamName }" /></td>
					</tr>
				</table>
			</div>
			<div id="team">팀원
				<div class="teamList">
					<table id="team-List-table">
						<tbody>
							<tr>
								<c:forEach var="i" items="${ list }" varStatus="status">
									<td>
										<div id="teamBack">
											<div id="teamProfile" value="${ i.attachCode }"></div>
											<label id="teamName"><c:out value="${ i.userName }" />
											</label>
										</div>
									</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- <div id="team">팀원
			<table class="teamList">
				<tr>
					<th id="teamBack"><div id="teamProfile"><div id="teamName"></div></div></th>
				</tr>
			</table>
		</div> -->

			<div id="project">
				작업위치
				<div id="projectList">
					<table>
					<tbody>
					<c:forEach var="i" items="${ project }" varStatus="status">
					<div id="projectListBack">
						<div id="projcetLogo"></div>
						<div id="projectName"><c:out value="${ i.project.projectName }" /></div>
					</div>
					</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#job').click(function() {
				$('.jobbtn').toggle();
			});
			$('#department').click(function() {
				$('.deptbtn').toggle();
			});
			$('#company').click(function() {
				$('.companybtn').toggle();
			});

		});
		//직업 추가
		function insertJob() {

			var userJob = $("#job").val();
			console.log(userJob);

			$.ajax({
				url : "insertJob.me",
				type : "post",
				dataType : "json",
				data : {
					userJob : userJob
				},
				success : function(data) {
					console.log(data);
					$('.jobbtn').hide();
					$("#job").text(data.member.userJob);
				},

				error : function() {
					console.log("에러!");
				},
				beforeSend : function() {
					$('.wrap-loading').removeClass('display-none');
				},
				complete : function() {
					$('.wrap-loading').addClass('display-none');
				}
			});

			return false;
		}
		//부서 추가
		function insertDept() {

			var userDept = $("#department").val();
			console.log(userDept);

			$.ajax({
				url : "insertDept.me",
				type : "post",
				dataType : "json",
				data : {
					userDept : userDept
				},
				success : function(data) {
					console.log(data);
					$('.deptbtn').hide();
					$("#department").text(data.member.userJob);
				},

				error : function() {
					console.log("에러!");
				},
				beforeSend : function() {
					$('.wrap-loading').removeClass('display-none');
				},
				complete : function() {
					$('.wrap-loading').addClass('display-none');
				}
			});

			return false;
		}
		//회사명 등록
		function insertCom() {

			var company = $("#company").val();
			console.log(company);

			$.ajax({
				url : "insertCom.me",
				type : "post",
				dataType : "json",
				data : {
					'company' : company
				},
				success : function(data) {
					console.log(data);
					$('.companybtn').hide();
					$("#company").text(data.member.userJob);
				},

				error : function() {
					console.log("에러!");
				},
				beforeSend : function() {
					$('.wrap-loading').removeClass('display-none');
				},
				complete : function() {
					$('.wrap-loading').addClass('display-none');
				}
			});

			return false;
		}
	</script>
</body>
</html>