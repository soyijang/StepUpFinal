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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/dropdown.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/issueType.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/font.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/team/addTeamModal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">
<style>

/* section 안쪽 오른쪽*/
#content {
	width: 88vw;
	height: 843px;
	background-color: white;
	float: left;
	box-sizing: border-box;
	padding: 30px 40px;
}

/* content 안쪽 상단 contentTitle(제목 영역)*/
#contentTitle {
	height: 60px;
}

/* content 안쪽 contentTitle(제목영역) Project 이름 부분 */
#projectTitle2 {
	font-family: Noto Sans KR;
	font-style: normal;
	font-weight: 300;
	font-size: 13px;
	line-height: 17px;
	align-items: center;
	letter-spacing: 0.1px;
	color: #6D6D6D;
}

/* content 안쪽 contentTitle(제목영역) 메뉴명 부분 */
#menuTitle {
	font-family: Noto Sans KR;
	font-style: normal;
	font-weight: 300;
	font-size: 17px;
	line-height: 17px;
	align-items: center;
	letter-spacing: 0.1px;
	color: #000000;
}

/* content 안쪽 하단 내용영역*/
#contentBox {
	height: 700px;
}

#rectangle2 {
	background: #2B2B49;
	height: 30px;
	width: 80px;
	border-radius: 10px;
	border: 0;
	outline: 0;
	font-size: 8px;
	color: white;
	text-align: center;
}

.searchBtn {
	background: #C4C4C4;
	height: 30px;
	width: 80px;
	border-radius: 10px;
	border: 0;
	outline: 0;
	font-size: 8px;
	color: white;
	text-align: center;
}

#rectangle {
	text-align: right;
}

.teamSearch {
	font-family: Noto Sans KR;
	font-style: normal;
	font-weight: 300;
	font-size: 13px;
	width: 1000px;
	height: 50px;
	border: 1px solid lightgrey;
	outline: 0;
	border-radius: 30px;
	text-align: left;
	margin-left: 10%;
	margin-top: 30px;
	text-indent: 3%;
}

#team-person {
	width: 150px;
	height: 160px;
	display: inline-block;
	border: 1px solid lightgrey;
	background: white;
	margin: 10px;
	text-align: center;
}

#team-person p {
	text-align: inherit;
}

#team-area {
	width: 150px;
	height: 160px;
	border: 1px solid lightgrey;
	background: white;
	margin: 10px;
	text-align: center;
	display: inline-block;
}
#team-area img{
	width: 150px;
	height: 90px;
}

#team-person img {
	margin-top: 10%;
	margin-bottom: 5%;
}

h3 {
	margin-left: 20px;
}
mark {
	background: none;
	color: red;
}
.modalTable2{
	width: 1000px;
	margin-top: 40px;
  }
.modal2 {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 2; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }
  
  /* Modal Content/Box */
.modal-content2 {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 10px;
    border: 1px solid #c4c4c4;
    width: 35%; /* Could be more or less, depending on screen size */
    z-index:1;
    border-radius: 10px;
    box-shadow: 0 0 4px #cccccc;
  }
#addPerson {
    width: 450px;
    height: 500px;
}
#addPerson p {
    padding-left: 10px;   
    padding-right: 10px;
    margin: 0;
    text-align: left;
}
#emailInsert {
    text-align: center;
    margin-top: 8%;
}
#emailInsert input {
    width: 400px;
    height: 30px;
    text-align: left;
    border: 1px solid #c4c4c4;
}
.surveyAddBtn {
    color: skyblue;
    margin-left: 20px;
    margin-top: 20px;
}
#sendSurvey {
	text-align: left;
	padding: 10px;
}
#surveyPersonAdd input {
	border: 1px solid #c4c4c4;
	height: 35px;
	width: 220px;
}
.modalButtonArea {
	text-align: right;
}
#rectangle7 {
	text-align: center;
}



</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	 <%@ include file="../common/nav.jsp" %>

			<div id="content-nav-only">
				<!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
				<div id="contentTitle">
					<div id="projectTitle2">Team / IT WORKS!</div>
					<div id="menuTitle">팀 추가</div>
				</div>
				<div id="contentBox">
					<!--팀원 추가 버튼영역-->
					<div id="rectangle">
						<button type="button" value="hidden" onclick="surveySend()" class="searchBtn2" id="rectangle2">팀원 추가</button>
						&nbsp;&nbsp;
						<button type="button" value="hidden" onclick="insertTeam()" class="searchBtn" id="apply">팀 시작</button>
						&nbsp;&nbsp;
						
						<!-- 모달창 시작-->

					    <!-- The Modal -->
					    <form action="insertTeam.tm" method="post">
					    <div id="myModal" class="modal">
					      <!-- Modal content -->
					      <div class="modal-content">
					        <p align="left" class ="modaltitle" style="font-size:30px;">새로운 팀 시작</p>
					        <table align="center" class="modalTable">
					            <!-- 내용-->
					              <div id="teamInsertContent">
					            <div>  
					        <img src="/agile/resources/images/indiv/main/userInfo/Team/img_teamInsert.png"style="text-align: left;">
					           </div>
						            <div class="content">
						                <p>팀에 추가하여 모든 인원이 한 자리에서 작업하도록 하세요.</p>
						               <p> @mentions, 협업으로 계속 연결을 유지하고 팀 프로필 페이지에서
						             	  모든 것을 효율적으로 관리합니다.</p>
						            </div>
						            <div class="teamInsert">
						                 <h4>팀 이름?<mark>*</mark></h4>
						            	<input type="text" name="teamName">
						                <h4>팀에 사용자 초대</h4> 
						                <!-- <input type="search" id="teamUserName" placeholder="이름을 입력하세요."> -->
										  <select id="addUserName" name="addUserName">
						                  	<option value="none">=== 선택 ===</option>
						                  <c:forEach var="userName" items="${teamUserName }">
										    <option value="${userName.userCode }">${userName.userName }</option>
										  </c:forEach>
										  </select>
						                <!-- <input type="search" id="teamAuthority" placeholder="권한 설정 "> -->
						                 <select name="Administration" >
						                  	<option value="none">=== 선택 ===</option>
						                  <c:forEach var="i" begin="0" end="${ fn:length(Administration)-1 }">
										    <option value=User><c:out value="${Administration[i] }"></c:out></option>
										  </c:forEach>
										  </select>
						                <pre>한 번에 10명까지 초대할 수 있습니다.</pre>
						            </div> 
						        </div>
					        </table>
					        <button class="submit">시작</button>
					        <button class="close1">취소</button>
					      </div>
					    
					    </div>
					    </form>
					    <!-- 모달창 종료 -->
					    
					    
					    <!-- 팀원추가 modal 시작-->
					     <!-- The Modal -->
					   <form action="mailSender.tm" method="post">
					    <%-- <div id="sendEmail" class="modal2">
					      <!-- Modal content -->
					      <div class="modal-content2">
		
			            <div class="teamInsert">
			            	<div style="text-align: left;">
			                <h4>팀원 초대</h4>
			                <select id="addUserTeam" name="addUserTeam">
						        <option value="none">=== 귀하의 팀 ===</option>
						        <c:forEach var="teamList" items="${ teamList }">
								<option value="${ teamList.teamName }">${ teamList.teamName }</option>
								</c:forEach>
							</select>
							<select id="addUserName" name="addUserName">
						        <option value="none">=== 함께한 작업자 ===</option>
						        <c:forEach var="teamUserName" items="${ teamUserName }">
								<option value="${ teamUserName.userName }">${ teamUserName.userName }</option>
								</c:forEach>
							</select>
			                <pre>귀하의 팀을 선택해 주세요.</pre>
			                <div id="emailInsert">
			              <!--   <input type="text" placeholder="이메일 주소 추가" id="sendEmail" name="sendEmail" value=""> -->
			              <table align="center" class="MyTaskDeleteModalTable">
							<thead align="center">
								<tr align="center">
									<td><!-- <b>이메일</b> --></td>
								</tr>
							</thead>	
							<tbody id="surveyPersonAdd">
								<tr>
									<td><input type="text" class="surveyInput1" value="" id="userEmail1" autocomplete="off"></td>
								</tr>	
							</tbody>
						</table>
			                </div>
						        <div class="surveyAddBtn" id="addInvite" style="text-align: left; font-size: 12px;">
						            + 초대추가
						        </div>
						       
			                </div>
			                <div id="btn">
			                    <button class="submit" onclick="sendEmail()">메일 보내기</button> 
			                    <button class="TeamClose">취소</button> 
			                </div>
			            </div> 
					      </div>
					    </div> --%>
					    
					    <div id="sendSurvey" class="modal2">
			<div class="modal-content mytaskDeletecontent">
				<p align="left" class="modaltitle">📬 팀원 초대</p>
				<p class="modalcontent" style="font-size: 12px;">※ 귀하의 팀을 선택해 주세요.</p>
				   <select id="addUserTeam" name="addUserTeam">
						        <option value="none">=== 귀하의 팀 ===</option>
						        <c:forEach var="teamList" items="${ teamList }">
								<option value="${ teamList.teamName }">${ teamList.teamName }</option>
								</c:forEach>
							</select>&nbsp;&nbsp;
							<select id="addUserName" name="addUserName">
						        <option value="none">=== 함께한 작업자 ===</option>
						        <c:forEach var="teamUserName" items="${ teamUserName }">
								<option value="${ teamUserName.userName }">${ teamUserName.userName }</option>
								</c:forEach>
							</select><br><br>
				<table align="center" class="MyTaskDeleteModalTable">
					<thead align="center">
						<tr align="center">
							<td><b>이름</b></td>
							<td><b>이메일</b></td>
						</tr>
					</thead>	
					<tbody id="surveyPersonAdd">
						<tr>
							<td><input type="text" class="surveyInput2" value="" id="userName1" autocomplete="off"></td>
							<td><input type="text" class="surveyInput1" value="" id="userEmail1" autocomplete="off"></td>
						</tr>	
					</tbody>
				</table>
					<div class="surveyAddBtn"> + 초대추가</div>
				<div class="modalButtonArea">
					<div class="surveyClose" id="rectangle7" style="display: inline-block; border: 0;">취소</div>
					<button class="rectangle6" onclick="startAdd()" type="button">메일 보내기</button>
				</div>
				<input type="hidden" id="surveyCode" class="" value="2"> 
			</div>
		</div>
					    
					    </form>
					    <!-- 팀원추가 modal 종료-->
					    
					   
					    
					</div>
					<!--팀원 추가 버튼영역 종료-->
					<!--팀원 검색 영역-->
					<div id="teamSearch">
						<input class="teamSearch" type="search" placeholder="사람 및 팀 검색">
					</div>

					<h3>함께한 작업자</h3>
					<c:if test="${ fn:length(teamList) ne 0}">
					<c:forEach var="i" begin="0" end="${fn:length(teamUserName)-1}">
						<div id="team-person">
							<div id="teamUserName">
							<img src="resources/icon/common/icon_teamMember.png">
							<p><c:out value="${teamUserName[i].userName}"/></p>
							</div>
						</div>
					</c:forEach>
					</c:if>
					<br>
					<hr>
					<br>
					
					<h3>귀하의 팀</h3>
					<div id="teamList" >
					<c:if test="${ fn:length(teamList) ne 0}">
						<c:forEach var="i" begin="0" end="${ fn:length(teamList)-1 }">
							<div id="team-area">
							<img src="resources/icon/common/icon_team.png">
							<p><c:out value="${ teamList[i].teamName }"/></p>
							</div>
				  		</c:forEach>
				  		</c:if>
					</div>
					
				</div>
			</div>
		
			<script>
				function insertTeam() {
					var newTeam = $("#teamName").val();
					console.log(teamName);
					
					$(".searchBtn").click(function() {
						$.ajax({
							url:"insertTeam.tm",
							type:"post",
							data:{teamName : teamName,
								userCode : $('#addUserName').val()
							},
							success: function(data) {
								window.location.reload(); 
								  $("#team").text(data.team.teamName); 
							},
							error: function(data) {
								  alert('실패!');          
								console.log("실패!");
							}
						});
					});
				}
			</script> 
			
			<script>
			// Get the modal
			    var modal = document.getElementById("myModal");
			    var modal2 = document.getElementById("sendSurvey");
				    
			// Get the button that opens the modal
			    var btn = document.getElementById("apply");
			    var btn2 = document.getElementById("rectangle2");
			    
			// Get the <span> element that closes the modal
			    var span = document.getElementsByClassName("close1")[0];
			    var span2 = document.getElementsByClassName("close")[0];
			    
			// When the user clicks on the button, open the modal
			    btn.onclick = function() {
			        $(modal).fadeIn(300); 
			        $(modal).css('display','block');
			    }
			    btn2.onclick = function() {
			        $(modal2).fadeIn(300); 
			        $(modal2).css('display','block');
			    }
			    
			// When the user clicks on <span> (x), close the modal
			    span.onclick = function() {
			        $(modal).css('display','none'); 
			    }
			    span2.onclick = function() {
			        $(modal2).css('display','none');
			    }
			    
			// When the user clicks anywhere outside of the modal, close it
			    window.onclick = function(event) {
			      if (event.target == modal) {
			        modal.style.display = "none";
			      }
			    };
			    window.onclick = function(event) {
			      if (event.target == modal2) {
			        modal2.style.display = "none";
			      }
			    };
		
			</script>
			
			<script type="text/javascript">
		
		//보내기모달열기
	    function surveySend() {
	    	$('#sendSurvey').fadeIn(300); 
	    	$('#sendSurvey').css('display','block');
		}
		
		//카운팅용	
		var cnt = 1;
		
		//닫기누르면 창 닫으면서 안에 추가되어있던것들 리셋
	    $(document).on('click', '.surveyClose', function(){
	    	cnt = 1;
	    	$('#sendSurvey').css('display','none');
	    	$('#surveyPersonAdd').children().remove();
	    	$('#surveyPersonAdd').append('<tr>'
					+'<td><input type="text" class="surveyInput2" value="" id="userName' + cnt + '" autocomplete="off"></td>'
					+'<td><input type="text" class="surveyInput1" value="" id="userEmail' + cnt + '" autocomplete="off"></td>'
					+'</tr>');
	    });	
		
		//추가하기
	    $(document).on('click', '.surveyAddBtn', function(){
	    	cnt++;
	    	$('#surveyPersonAdd').append('<tr>'
				+'<td><input type="text" class="surveyInput2" value="" id="userName' + cnt + '" autocomplete="off"></td>'
				+'<td><input type="text" class="surveyInput1" value="" id="userEmail' + cnt + '" autocomplete="off"></td>'
				+'</tr>');
	    });	
		
		function startAdd() {
			
			//입력된 내용가져오기
			//totData는 객체로 선언, dataList는 Array로 선언
			var totData2 = new Object();
			var dataList2 = new Array();
			
			//사람별로 data라는 객체에 값을 넣고 각 data객체들을 dataList에 push해줌
			for(var i=1; i<cnt+1; i++){
				var data = new Object();
				data["surveyJoinEmail"] = $('#userEmail' + i).val();
				data["surveyJoinReply"] = 'N';
				data["surveyCode"] = $('#surveyCode').val();
				data["surveyJoinName"] = $('#userName' + i).val();
				dataList2.push(data);
			}
			
			//dataList를 voList객체로 다시한번 넣어줌. (totData는 객체로 선언, dataList는 Array로 선언)
			totData2["surveyJoinVOList"] = dataList2;
			console.log(totData2);
			//메일발송하기
		     $.ajax({
		    	type : 'post',
				url: "mailSender.sv",
				contentType:'application/json',
				dataType: 'json',
				data : JSON.stringify(totData2),
				success : function(data) {  
					alert('총' + cnt + '명에게 초대 메일을 발송하였습니다!');
				},
				error : function () {
					console.log('메일 보내기 실패!');
				},
				beforeSend : function(){
			        $('.wrap-loading').removeClass('display-none');
					document.getElementsByClassName("surveyClose")[0].click();
				},
				complete : function(){
				    $('.wrap-loading').addClass('display-none');
				}
	  	    }); 
			
		}
	</script>
			
</body>

</html>