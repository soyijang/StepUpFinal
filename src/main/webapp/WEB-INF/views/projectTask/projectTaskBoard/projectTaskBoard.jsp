<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/projectTaskBoard/projectTaskBoard.css">
    <!-- 현재 페이지 전체 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/projectTask/projectTaskBoard/projectTaskBoard.js"></script>
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
           <div id="menuTitle">Task Board</div>
       </div>

       <!-- content 영역 -->
       <div id="contentBox">
			<div id="contentBox1">
				<div id="contentBox1-title">스프린트명</div>
				<div id="contentBox1-subtitle">스프린트 상세 설명</div>
				<!-- 기본 기능 버튼 table -->
				<table id="contentBox1-table">
					<tr>
						<td><div id="searchBox"><input type="text"/><img id="icon-searchicon" src="/agile/resources/icon/common/icon_searchicon.png"></div></td>
						<td>사람 추가</td>
						<td><img id="icon-star" src="/agile/resources/icon/common/icon_star.png"></td>
						<td><div id="sprint-finish">스프린트 완료</div></td>
						<td><div>검색색 필터</div></td>
						<td><div id="group-standard">그룹화 기준</div></td>
						<td><div class="dropdown">그룹화 필터</div></td>
					</tr>
				</table>
       		</div>
       		<div id="contentBox2">
       			<div id="contentBox2-title">
       				<table id="incomplete-title-table">
       					<tr>
       						<td>
			       				<div id="incomplete-title">미진행</div>
       						</td>
       					</tr>
       				</table>
       				<table id="proceeding-title-table">
       					<tr>
       						<td>
       							<div id="proceeding-title">진행중</div>	
       						</td>
       					</tr>
       				</table>
       				<table id="complete-title-table">
       					<tr>
       						<td>
       							<div id="complete-title">진행완료</div>	
       						</td>
       					</tr>
       				</table>

       			</div>
       			<div id="contentBox2-board">
       				<table id="incomplete-table">
       					<tr>
       						<td>
       							<div id="incomplete-divs">
       								<div class="incomplete-div flag-true">
       									<table class="incomplete-div-inner-table ">
       										<tr>
       											<td class="task-name-td" colspan="2"><div class="task-name-div">테스크명이너무길때는점점</div></td>
       											<td><div class="proceeding-rate"></div></td>
       											<td><div class="task-user">김</div></td>
       											<td><div class="more-settings"><img class="icon_more_settings" src="/agile/resources/icon/common/icon_more_settings.png"></div></td>
       										</tr>
       										<tr>
       											<td><div class="task-icon">T</div></td>
       											<td colspan="2"><div class="task-code">코드가길어서점점점</div></td>
       											<td><div class="important"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></div></td>
       											<td class="epic-name-td"><div class="epic-name">E</div></td>
       										</tr>
       									</table>
       								</div>
       							</div>
       						</td>
       					</tr>
       				</table>
       				<table id="proceeding-table">
       					<tr>
       						<td>
       							<div id="proceeding-divs">
       								<div class="proceeding-div">
       									<table class="proceeding-div-inner-table">
       										<tr>
       											<td class="task-name-td" colspan="2"><div class="task-name-div">테스크명이너무길때는점점</div></td>
       											<td><div class="proceeding-rate">2/4</div></td>
       											<td><div class="task-user">김</div></td>
       											<td><div class="more-settings"><img class="icon_more_settings" src="/agile/resources/icon/common/icon_more_settings.png"></div></td>
       										</tr>
       										<tr>
       											<td><div class="task-icon">T</div></td>
       											<td colspan="2"><div class="task-code">코드가길어서점점점</div></td>
       											<td><div class="important"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></div></td>
       											<td class="epic-name-td"><div class="epic-name">E</div></td>
       										</tr>
       									</table>       								
       								
       								
       								</div>
       							</div>
       						</td>
       					</tr>   				
       				</table>
       				<table id="complete-table">
         				<tr>
       						<td>
       							<div id="complete-divs">
       								<div class="complete-div">
       									<table class="complete-div-inner-table">
       										<tr>
       											<td class="task-name-td" colspan="2"><div class="task-name-div">테스크명이너무길때는점점</div></td>
       											<td><div class="proceeding-rate">2/4</div></td>
       											<td><div class="task-user">김</div></td>
       											<td><div class="more-settings"><img class="icon_more_settings" src="/agile/resources/icon/common/icon_more_settings.png"></div></td>
       										</tr>
       										<tr>
       											<td><div class="task-icon">T</div></td>
       											<td colspan="2"><div class="task-code">코드가길어서점점점</div></td>
       											<td><div class="important"><img class="icon_arrow_upward_red" src="/agile/resources/icon/common/icon_arrow_upward_red.png"></div></td>
       											<td class="epic-name-td"><div class="epic-name">E</div></td>
       										</tr>
       									</table>         								
       								
       								</div>
       							</div>
       						</td>
       					</tr>     				
       				</table>       				
       				
       			</div>
       		</div>
       </div>
    </div>
</body>
</html>