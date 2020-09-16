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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/myInfo/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/myInfo/myInfo.css">
</head>
<body>
	<%@ include file="../../common/menubar.jsp"%>
	<div id="content" style="padding: 0px; padding-top: -20px">
		<!-- 배경화면 입력 -->
		<form action="makebackImage.me" method="post" enctype="multipart/form-data">
		<input type="file" name="picture" multiple="true" id="backInput" value="">
		<div id="backimg"><img src="resources/uploadFiles/${ backGround.attachChangeName}.png" id="backSrc"></div><button id="backUpload" value="">업로드</button>
		</form>
		
		
		<!-- 썸네일 입력 -->		
		<form action="makeThumbnailImage.me" method="post" enctype="multipart/form-data">
		<div id="mainProfile">
			<input type="file" name="photo" multiple="true" id="gdsImg" value="">
			<c:if test="${ attach.attachChangeName != null }">
			<!-- <div class="select_img"> --><img src="resources/uploadFiles/${ attach.attachChangeName }.png"
				id="profilePhoto1">
			<button id="uploadBtn" class="upBtn" value="">업로드</button><!-- </div> -->
			</c:if>
			<c:if test="${ attach.attachChangeName == null }">
			<div class="select_img">${fn:substring(i.userName, fn:length(i.userName)-2, fn:length(i.userName))}
			<button id="uploadBtn" class="upBtn" value="">업로드</button></div>
			</c:if>
				
		</div>
		</form>
		<div id="name">
			<label><c:out value="${ sessionScope.loginUser.userName }" /></label>
			<button id="pwdChange" class="pwdChange" >비밀번호변경</button>
			<button id="getOut" class="getOut">회원탈퇴</button>
			<img src="/agile/resources/icon/common/icon_bookmarkfull.png" id="bookMarkBtn">
			<!-- <button id="bookMarkBtn">북마크 리스트</button> -->
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
							class="infoInput" id="job" value="${ sessionScope.loginUser.userCompJob }"></td>
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
							class="infoInput" id="department" value="${ sessionScope.loginUser.userCompDept }"></td>
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
							class="infoInput" id="company" value="${ sessionScope.loginUser.userCompName }"></td>
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
			
			        <div id="team"><label id="teamlabel">팀원</label>
						<div class="teamList">
							<table id="team-List-table">
								<tbody>
									<tr>
										<c:forEach var="i" items="${ list }" varStatus="status">
											<td>
												<div id="teamBack">
													<c:if test="${i.attachCode != 0 }">
													<div id="teamProfile" value="${ i.attachCode }"><img src="resources/uploadFiles/${ i.attachChangeName }.png">
													<div id="teamName"><c:out value="${ i.userName }" />
													</div>
													</c:if>
													<c:if test="${i.attachCode == 0}">
													<div id="teamProfile"><div id="textName" style="margin-left:33px; padding-top:35px;">${fn:substring(i.userName, fn:length(i.userName)-2, fn:length(i.userName))}</div></div>
													<div id="teamName"><c:out value="${ i.userName }" />
													</div>
													</c:if>
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
								<div id="projcetLogo"><label style="margin-left:10px;">P</label></div>
								<div id="projectName"><c:out value="${ i.project.projectName }" /></div>
							</div>
							</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	
	<!-- 비밀번호변경 -->
	<form action="changePwd.me" method="post">
	 <div id="myModal" class="modal">
         <div class="modal-content">
            <p align="left" class="modaltitle">💻 비밀번호변경</p>
            <table align="center" class="modalTable">
               <tbody>
                  <tr>
                     <td>[이메일]: ${ sessionScope.loginUser.userEmail }</td>
                  </tr>
                  <tr>
                     <td>[기존비밀번호] : <input type="password" class="password-Change" id="pwd-origin" name="pwdOrigin" placeholder="비밀번호를 적어주세요"></td>
                  </tr>
                  <tr>
                  	<td>[변경할 비밀번호] : <input type="password" class="password-Change" id="pwd-change" name="pwdChange" placeholder="변경할 비밀번호를 적어주세요"></td>
                  	<td><span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span></td>
                  </tr>
               </tbody>
            </table>
            <div class="modalButtonArea" id="newTask">
               <button class="changeBtn" id="change" type="submit">비밀번호 변경</button>
               <div class="cancelBtn" id="rectangle7" data-dismiss="modal" aria-label="Close">취소</div>
            </div>
            </div>
           </div>
    	</form>
    	
    <!-- 회원탈퇴 -->
    <form action="getOut.me" method="post">
	<div id="outmodal" class="outmodal">
         <div class="outmodal-content">
            <p align="left" class="outmodaltitle">😭회원탈퇴</p>
            <table align="center" class="outmodalTable">
               <tbody>
                  <tr>
                     <td>[이메일]: ${ sessionScope.loginUser.userEmail }</td>
                  </tr>
                  <tr>
                     <td>[기존비밀번호] : <input type="password" class="getout-password" id="pwd-getout" name="pwdGetout" placeholder="비밀번호를 적어주세요"></td>
                  </tr>
                  <tr>
                  	<td>[비밀번호 확인] : <input type="password" class="getout-password" id="pwd-check" name="pwdCheck" placeholder="변경할 비밀번호를 적어주세요"></td>
                  	<td><span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span></td>
                  </tr>
               </tbody>
            </table>
            <div class="outmodalButtonArea" id="newTask">
               <button class="outBtn" id="goHome" type="submit">회원탈퇴</button>
               <div class="backMain" id="rectangle7" data-dismiss="modal" aria-label="Close">취소</div>
            </div>
            </div>
           </div>
    	</form>
    	
    <!-- 북마크 -->  
       
	 <div id="bookMarkmodal" class="bookmodal">
         <div class="bookmodal-content">
            <p align="left" class="bookmodaltitle">🔖 북마크 리스트</p>
            <table align="center" class="bookmodalTable">
               <div id="bookmarkList">
						<div id="bookmarkContent">
							<c:forEach var="i" items="${ TaskHistory }" varStatus="status">
							<div id="bookmarkListBack">
								<div id="TaskLogo"><label style="margin-left:10px;">T</label></div>
								<div id="projectName"><c:out value="${ i.taskHistory.taskHistValue }" /></div>
							</div>
							</c:forEach>
						</div>
					</div> 
            </table>
            <div class="bookmodalButtonArea" id="newTask">
               <button class="bookback" id="bookback" type="submit">확인</button>
            </div>               

         </div>
      </div>
     
    
	
	<script>
		//버튼 숨김
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
		
		//파일 업로드
		$(function(){
			$("#gdsImg").hide();
			
			$("#profilePhoto1").click(function(){
				$("#gdsImg").click();
			});
		});
		
		  $("#gdsImg").change(function(){
			   if(this.files && this.files[0]) {
			    var reader = new FileReader;
			    reader.onload = function(data) {
			     $("#profilePhoto1").attr("src", data.target.result).width(100);
			     $("#profilePhoto1").attr("src", data.target.result).height(100);
			    }
			    reader.readAsDataURL(this.files[0]);
			   }
			  });
		  $(function(){
				$("#backInput").hide();
				
				$("#backimg").click(function(){
					$("#backInput").click();
				});
			});
			
		$("#backInput").change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
				 $("#backimg img").attr("src", data.target.result).width(1238.39);
				 $("#backimg img").attr("src", data.target.result).height(120);
			}
			 reader.readAsDataURL(this.files[0]);
			}
		});
//비밀번호 변경모달
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("pwdChange");
    
    var span = document.getElementsByClassName("cancelBtn")[0];
    btn.onclick = function() {
        $(modal).fadeIn(300); 
        $(modal).css('display','block');
    }
    
    span.onclick = function() {
        $(modal).css('display','none');
    }
    
//회원탈퇴 모달        
    var modal2 = document.getElementById("outmodal");
    var btn2 = document.getElementById("getOut");
    var span2 = document.getElementsByClassName("backMain")[0];
    
    btn2.onclick = function() {
        $(modal2).fadeIn(300); 
        $(modal2).css('display','block');
    }
    
    span2.onclick = function() {
        $(modal2).css('display','none');
    }
    
//북마크리스트 모달    
    var modal3 = document.getElementById("bookMarkmodal");
    var btn3 = document.getElementById("bookMarkBtn");
    var span3 = document.getElementsByClassName("bookback")[0];
    
    btn3.onclick = function() {
        $(modal3).fadeIn(300); 
        $(modal3).css('display','block');
    }
    
    span3.onclick = function() {
        $(modal3).css('display','none');
    }
// When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      } else if(event.target == $("#outmodal")) {
    	  $("#outmodal").style.display = "none";
      } else if(event.target == $("#bookMarkmodal")) {
    	  $("#bookMarkmodal").style.display = "none";
      }
    };
    
/*     $(function(){
		$("#bookMarkBtn").hide();
		
		$("#bookImg").click(function(){
			$("#bookMarkBtn").click();
		});
	});
     */
    //비밀번호 변경
/*    $('(.password-Change)').focusout(function () {
        var pwd1 = $("(#pwd-origin)").val();
        var pwd2 = $("(#pwd-change)").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	$("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다.비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    }); */
    
    //회원탈퇴
/*	$('(.password-getout)').focusout(function () {
        var pwd1 = $("(#checkPwd)").val();
        var pwd2 = $("(#changePwd)").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	$("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다.비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });*/
    
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
					$("#job").text(data.member.userCompJob);
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
					$("#department").text(data.member.userCompDept);
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
				async: false,
				data : {
					company : company
				},
				success : function(data) {
					console.log(data);
					$('.companybtn').hide();
					$("#company").text(data.member.userCompName);
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