<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/calendar.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/calendar.js"></script>

</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 앤티앤스프레즐맛있네요</div>
            <div id="menuTitle">개인일정관리</div>
        </div>
        
        <!-- 캘린더영역 -->
        <div id="contentBox">
			
			<div id="calendar">			
				
				<!-- 캘린더상단영역 -->
				 <div class="all_cal-func">
					<div class="cal_top">
						<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img src="/agile/resources/icon/common/icon_left_chevron.png"></span></a>
						<span id="cal_top_year"></span>.
						<span id="cal_top_month"></span>
						<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img src="/agile/resources/icon/common/icon_right_chevron.png"></span></a>
						<div id="calendarbtn">
							<div class="cal-func">공유되지않은 일정</div>
							<div class="cal-func">공유된 일정</div>
							<div class="cal-func">전체 개인 일정</div>
						</div>
					</div>
				</div>	

				<!-- 캘린더영역 -->
				<div id="cal_tab" class="cal"></div>				   		
				
				
				<!-- 우측영역 -->
				<div class="checkList">
					<div id="toDoList">

						<div class="checkListToday">
							<div id="todayDay">2020년 08월 13일</div>
							<div id="todayDate">목요일</div><br>
							<p>할일 50654개 남음</p><hr>
						</div>

						<table class="checkListTodayTable">
							<tbody>
								<tr>
									<td class="toDoCheckBox"><input id="check1" type="checkbox"></td>
									<td class="toDoToday"><label for="check1"> 오늘안에 캘린더라도 하자 소이야ㅎㅎ</label></td>
								</tr>
								<tr>
									<td class="toDoCheckBox"><input type="checkbox"></td>
									<td class="toDoToday">오늘안하면 내일해야되잖아?</td>
								</tr>

							</tbody>
						</table>
						
						<img id="plusMyTask" onclick="" src="/agile/resources/icon/common/icon_circle_plus_red.png">
						
					</div>
					
					<div id="sharedList">

						<div class="checkListToday">
							<div id="todayDay">공유된 오늘의 일정</div>
							<p>진행 한 일</p><hr>
							<p>진행 할 일</p><hr>
							<p>변경/취소/미달성 된 일</p><hr>
							
						</div>


					</div>
					
				</div>
			
			</div>
				
			</div>
		
		
    </div>
	
<!-- 	<script>
	
		$(document).ready(function() {
			
			$('#searchBtn').on("click",function(event) {
				self.location = "${contextPath}/ktdi1/ktdi1050"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&yyyy=" + $("#yyyy").val() + "&mmmm="
						+ $("#mmmm").val() + "&keyword="
						+ encodeURI($('#keyword').val());
			});
	
			$('#newBtn').on("click", function(evt) {
				self.location = "${contextPath}/ktdi1/ktdi1052";	
			});
	
			$('#sub_code').on("change",function(evt) {
				location.href = "?yyyy=" + $("#yyyy").val()
						+ "&mmmm=" + $("#mmmm").val()
						+ "&sub_code="
						+ encodeURI($("#sub_code").val());
			});
	
			$('#yyyy').on("change",function(evt) {
				location.href = "?yyyy=" + $("#yyyy").val()
						+ "&mmmm=" + $("#mmmm").val()
						+ "&sub_code="
						+ encodeURI($("#sub_code").val());
			});
	
			$('#mmmm').on("change",function(evt) {
				location.href = "?yyyy=" + $("#yyyy").val()
						+ "&mmmm=" + $("#mmmm").val()
						+ "&sub_code="
						+ encodeURI($("#sub_code").val());
			});
			
		});
	</script>
	
	<script>
		function goYearMonth() {
			location.href = "?yyyy=" + $("#yyyy").val() + "&mmmm=" + $("#mmmm").val();
		}
	</script> -->

</body>
</html>