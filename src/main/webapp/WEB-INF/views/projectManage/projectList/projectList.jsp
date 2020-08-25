<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectList/projectList.css">
    <!-- 현재 페이지 전체 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/projectManage/projectList/projectList.js"></script>
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
           <div id="menuTitle">전체 프로젝트</div>
       </div>

       <!-- content 영역 -->
       <div id="contentBox">
			<div id="contentBox1">
				<div id="contentBox1-title">최근 진행한 프로젝트</div>
				<div id="contentBox1-content">
					<table id="contentBox1-content-table">
						<tr>
							<!-- 프로젝트 리스트 -->
							<td>
								<div class="contentBox1-content-table-tr-td">
									<div class="left-padding-gray">
										<div class="project-name">
											프로젝트명
										</div>
										<div class="project-participants">
											참여인원<div class="pink-btn">6</div>
										</div>
										<div class="project-progress-rate">
											진행률 <div class="pink-btn">68%</div>
										</div>
									</div>
								</div>
							</td>
							<!-- 프로젝트 추가 -->
							<td>
								<div class="contentBox1-content-table-tr-td">
									<div class="new-project-add">
										<img class="icon_circle_plus_red" src="/agile/resources/icon/common/icon_circle_plus_red.png">
										<div class="new-project-add-text">새 프로젝트 추가</div>
									</div>
								</div>
							</td>
						
						</tr>
					</table>
				</div>
			</div>
			
       		<div id="contentBox2">
       			<span id="contentBox2-title">전체 프로젝트 목록</span>
       			<div id="contentBox2-btn">
       				<div class="icon_file_plus">
       					<img id="icon_file_plus" src="/agile/resources/icon/common/icon_file_plus.png">
       				</div>
       				새 프로젝트 추가
       			</div>
				<div id="contentBox2-content">
					<table id="contentBox2-content-table">
						<thead>
							<tr>
								<th>프로젝트명</th>
								<th colspan="2">프로젝트 참여자</th>
								<th>프로젝트 시작일</th>
								<th>프로젝트 종료일</th>
								<th>프로젝트 진행상태</th>
								<th>프로젝트 마스터</th>
								<th>프로젝트 삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>프로젝트명</td>
								<td>
									<div class="project-participant"></div> 
									<div class="project-participant"></div>
									<div class="project-participant"></div>
									<div class="project-participant"></div>
								</td>
								<td><div class="project-participant-add"><img class="icon_user_plus" src="/agile/resources/icon/common/icon_user_plus.png"></div></td>
								<td>프로젝트 시작일</td>
								<td>프로젝트 종료일</td>
								<td>
									<!-- 완료 아이콘  -->
									<!--<div class="completeBox">완료</div>
										<div class="proceedingBox">진행중</div>  -->
									<div class="incompleteBox">미완료</div> 
								</td>
								<td>
									<div class="project-master"></div>
								</td>
								<td><div class="deleteBtn">· · ·</div></td>
							</tr>
						</tbody>
					</table>
					<div></div>
				</div>
       		</div>
       </div>
    </div>
    
    <!-- 모달창 관련 html -->
<!--      <button onclick="" class="searchBtn" id="apply">모달창 차후 수정예정</button> -->
    <!-- Trigger/Open The Modal -->
	 <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <p align="left" class ="modaltitle" style="font-size:30px;"><!-- 제목 --></p>
        <table align="center" class="modalTable">
        <!-- 내용-->
            <tr><td>ㅋㅋ</td></tr>
        </table>
        <button class="" id="">저장</button>
        <button class="close" id="">취소</button>
      </div>
    </div>

   
</body>
</html>