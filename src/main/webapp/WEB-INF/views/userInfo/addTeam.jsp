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
        #addInvite {
            color: skyblue;
            margin-left: 20px;
            margin-top: 20px;
        }
  

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	 <%@ include file="../common/menubar.jsp" %>

			<div id="content">
				<!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
				<div id="contentTitle">
					<div id="projectTitle2">Team / IT WORKS!</div>
					<div id="menuTitle">팀 추가</div>
				</div>
				<div id="contentBox">
					<!--팀원 추가 버튼영역-->
					<div id="rectangle">
						<button type="button" value="hidden" onclick="send()" class="searchBtn2" id="rectangle2">팀원 추가</button>
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
					        <button class="close">취소</button>
					      </div>
					    
					    </div>
					    </form>
					    <!-- 모달창 종료 -->
					    
					    
					    <!-- sendEmail modal 시작-->
					     <!-- The Modal -->
					   <form action="send.tm" method="get">
					    <div id="myModal2" class="modal2">
					      <!-- Modal content -->
					      <div class="modal-content2">
					        <p align="left" class ="modaltitle" style="font-size:30px;">사람추가</p>
					        <table align="center" class="modalTable2">
					          <div id="addPerson">
						        <p>gmail.com의 누군가가 누락되었습니까?</p>
						        <p>해당 사용자의 이메일을 아래에 추가하십시요.</p>
						        <p>- 권한이 허용되면 추가하겠습니다. 그렇지 않으면 담당자가
						            해당 관리자에게 요청을 보내겠습니다.</p>
						        
						        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>
						        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>
						        <div id="emailInsert"><input type="text" placeholder="이메일 주소 추가"></div>
						
						        <div id="addInvite" style="text-align: left;">
						            + 초대추가
						        </div>
						
						    </div>
					        </table>
					        <button class="submit">보내기</button>
					        <button class="close">취소</button>
					      </div>
					    
					    </div>
										    
					    </form>
					    
					    <!-- sendEmail modal 종료-->
					    
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
								  /* $("#team").text(data.team.teamName);  */
							},
							error: function(data) {
								 /* alert('실패!')  */          
								console.log("실패!");
							}
						});
					});
				}
			</script>
			
			<script>
			// Get the modal
			    var modal = document.getElementById("myModal");
			    var modal2 = document.getElementById("myModal2");
				    
			// Get the button that opens the modal
			    var btn = document.getElementById("apply");
			    var btn2 = document.getElementById("rectangle2");
			    
			// Get the <span> element that closes the modal
			    var span = document.getElementsByClassName("close")[0];
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
			
</body>

</html>