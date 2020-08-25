<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/calendar.js"></script>
</head>
<body>
   <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

  <%@ include file="../common/menubar.jsp" %>
  <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트백로그 / 앤티앤스프레즐맛있네요</div>
            <div id="menuTitle">ProjectBacklog</div>
        </div>
        
        <!-- 상단검색,팀원 --> 
        <div id="topArea">
        	<!-- 검색 -->
        	<div id="searchSprint">
        	<input type="text" placeholder="Search or jump to ...">
        	</div>
        	
        	<!-- 팀원 -->
        	<div>
        	
        	
        	</div>
        </div>
        
        <!-- 아래쪽영역 -->
        
        <div id="bottomArea"> 
	        <!-- 좌측영역 -->
	        <div id="sprint">
	        	<div id="ListState">
	        		<button id="rectangle2">진행/예정</button>
	        		<button id="rectangle2">종료</button>
	        	</div>
	        	
	        	<div id="sprintList">
	        		<table>
	        			<tbody>
	        				
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
	        				
		        			<tr>
		        				<td class="sprintImg" rowspan="2">사진</td>
								<td class="sprintName" colspan="3">꽃게랑로그인페이지하하하하하하하</td>
		        			</tr>
							<tr>
								<td class="progressLine" colspan="2">진행률막대</td>
								<td class="progressPercent">00%</td>
							</tr>
		        			
							
					    </tbody>    		
	        		</table>	
	        	</div>
	        	
				<button id="SprintButtonArea">새 스프린트 생성</button>
	        
	        </div>
	        <!-- ---------------------오른쪽------------------------- -->
	        <div id="taskListArea">
	        
	        	<!-- 스프린트정보 -->
	        	<div id="sprintInfo">
	        	
	        		<div id="sprintCode">
	        			nav
	        		</div>
	        		
	        		<div id="sprintInfomation">
	        			<table>
	        				<tbody>
	        					<tr><td>스프린트명 : 사이트 공용 nav 작업</td></tr>
	        					<tr><td>스프린트 시작일 : 2020.0807 / 예상소요시간 : 945m<td></tr>
	        				</tbody>
	        			</table>
	        		</div>
	        		
	        		<div id="sprintCounting">
	        			<table>
							<tbody>
								<tr>
									<td><span class="pointAverage">3.4pts</span></td>
									<td>미완료</td>
									<td><span class="tasknonFinish">0</span></td>
									<td>완료</td>
									<td><span class="taskFinish">1</span></td>
									<td>진행중</td>
									<td><span class="taskIng">1</span></td>
									<td>총 2개</td>
								</tr>							
							</tbody>	        			
	        			</table>
	        		</div>
	        		
	        	</div>
	        
	        		<div id="sprintTaskList">
		        		<table>
							<thead>
								<tr> 
									<td width="50%">Task 명</td>
									<td width="10%">실제소요시간</td>
									<td width="10%">예상소요시간</td>
									<td width="8%">Point</td>
									<td width="8%">진행상태</td>
									<td width="8%">담당자</td>
									<td width="8%">더보기</td>
								</tr>
							</thead>
								
							<tbody>
								<tr> 
									<td class="TaskName">우측상단 개인정보설정</td>
									<td class="realTime">183m</td>
									<td>160m</td>
									<td>4pts</td>
									<td><span class="TaskStatus1">완료</span></td>
									<td>심슨</td>
									<td><button class="more">...</button></td>
								</tr>
								<tr> 
									<td class="TaskName">우측상단 개인정보설정</td>
									<td class="realTime"> </td>
									<td>192m</td>
									<td>2pts</td>
									<td><span class="TaskStatus2">진행중</span></td>
									<td>장소이</td>
									<td><button class="more">...</button></td>
								</tr>
							</tbody>		        		
		        		</table>
	        		</div>
	        	
	        	<div class="taskButtonArea">
	        		<button id="rectangle3" style="width: 100px;">Task 추가</button>
	        		<button id="rectangle3" style="width: 100px;">스프린트 종료</button>
	        	</div>
	        </div>
	        
        </div>
  </div>
  
</body>
</html>