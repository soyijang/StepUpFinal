<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userMyTasks/userStandupMeeting/userStandupMeeting.css">
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
           <div id="menuTitle">Stand Up Meeting</div>
       </div>



       <!-- content 영역 -->
       <div id="contentBox">
       		<!-- 헤더 -->
			<div id="content-box-header">
				<table id="content-box-header-table">
					<tr>
						<td></td>
						<td>
							<div id="search">
								<input class="input" type="text"/>
								<img id="icon_searchicon" src="/agile/resources/icon/common/icon_searchicon.png">
							</div>
						</td>
						<td><img id="icon_rss_feed" src="/agile/resources/icon/common/icon_rss_feed.png"></td>
						<td><img id="icon_settings" src="/agile/resources/icon/common/icon_settings.png"></td>
						<td id="today-box-td">
							<div id="today-box-wrapper">
								<img id="icon_double_left_chevron" src="/agile/resources/icon/common/icon_double_left_chevron.png">
									<div id="today-box">2020년 8월 25일 (금)</div>
								<img id="icon_double-right_chevron" src="/agile/resources/icon/common/icon_double _right_chevron.png">
							</div>
						</td>
					</tr>
				</table>
			</div>	
       		<div id="calender-box">
       			<!-- 헤더 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-box-table">
       				<tr id="calender-box-table-tr-1">
       					<td id="category"><div class="space"></div></td>
       					<td class="mon"><div class="date">MON</div></td>
       					<td class="tue"><div class="date">TUE</div></td>
       					<td class="wed"><div class="date">WED</div></td>
       					<td class="thur"><div class="date">THUR</div></td>
       					<td class="fri"><div class="date">FRI</div></td>
       					<td class="sat"><div class="date">SAT</div></td>
       					<td class="sun"><div class="date">SUN</div></td>
       				</tr>
       				<tr id="calender-box-table-tr-2">
       					<td class="category"><div class="space"></div></td>
       					<td class="mon"><div class="day">24</div></td>
       					<td class="tue"><div class="day">25</div></td>
       					<td class="wed"><div class="day">26</div></td>
       					<td class="thur"><div class="day">27</div></td>
       					<td class="fri"><div class="day">28</div></td>
       					<td class="sat"><div class="day">29</div></td>
       					<td class="sun"><div class="day">30</div></td>
       				</tr>
       			</table>
       			<!-- 미진행 테이블 -------------------------------------------------------------------------------------------------------->
       			<table  id="calender-notInProgress-table">
       				<tr>
        				<td class="category"><div class="spaces">미진행</div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       			<!-- 완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-complete-table">
       				<tr>
        				<td class="category"><div class="spaces">진행완료</div></td>
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       			
       			<!-- 미완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-incomplete-table">
       				<tr>
        				<td class="category"><div class="spaces">미완료</div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       		</div>
		</div>	
    </div>
    
   
</body>
</html>