<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/userProjectMain/userProjectMain.css">
<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="main-cont">
                <div id="main-cont-area">
                	<div id="status-area">
                		<div id="not-task">
                			미진행
                		</div>
                		<div id="task-ing">
                			진행중
                		</div>
                		<div id="com-task">
                			진행완료
                		</div>
                		<div id="tot-task">
                			전체 업무
                		</div>
                	</div>
                	<div id="pj-alm-area">
                		<div id="pro-cont-area">
                			<div id="pro-cont-title">
                				<p id="project">Project</p>
                			</div>
                			<div id="pro-cont">
                				
                			</div>
                		</div>
                		<div id="alm-cont-area">
                			<div id="alm-cont-title">
                				<p id="alarm">Alarm</p>
                			</div>
                			<div id="alm-cont">
                			
                			</div>
                		</div>
                	</div>
                	<div id="task-cht-area">
                		<div id="task-cont-area">
                			<div id="task-cont-title">
                				<p id="task">Task</p>
                			</div>
                			<div id="task-cont">
                			
                			</div>
                		</div>
                		<div id="cht-cont-area">
                			<div id="cht-cont-title">
                				<p id="chart">Chart</p>
                			</div>
                			<div id="cht-cont">
                			
                			</div>
                		</div>
                	</div>
                </div>
                <div id="calendar-area">
                	<div id="cal-cont-title">
                		<p id="calendar">Calendar</p>
                	</div>
                	<div id="cal-cont">
                		
                	</div>
                </div>
             </div>
</body>
<script>
	var today = null;
	var year = null;
	var month = null;
	var firstDay = null;
	var lastDay = null;
	var $tdDay = null;
	var $tdSche = null;

	$(document).ready(function() {
		
	    drawCalendar();
	    initDate();
	    drawDays();
	    drawSche();
	    $("#movePrevMonth").on("click", function(){movePrevMonth();});
	    $("#moveNextMonth").on("click", function(){moveNextMonth();});
	    
	});
	
	//calendar 그리기
	function drawCalendar() {
		
	    var setTableHTML = "";
	    setTableHTML+='<table class="calendar" style="table-layout: fixed">';
	    setTableHTML+='<tr id="cal-tr"><th style="color: red;">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:blue;">토</th></tr>';
	    for(var i=0;i<6;i++){
	        setTableHTML+='<tr height="100">';
	        for(var j=0;j<7;j++){
	            setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:10%">';
	            setTableHTML+='    <div class="cal-day" style="width:10%; "></div>';
	            setTableHTML+='    <div class="cal-schedule" style="width:10%"></div>';
	            setTableHTML+='</td>';
	        }
	        setTableHTML+='</tr>';
	    }
	    setTableHTML+='</table>';
	    $("#cal_tab").html(setTableHTML);
	    
	}
	
	//날짜 초기화
	function initDate() {
		
	    $tdDay = $("td div.cal-day")
	    $tdSche = $("td div.cal-schedule")
	    dayCount = 0;
	    today = new Date();
	    year = today.getFullYear();
	    month = today.getMonth()+1;
	    firstDay = new Date(year,month-1,1);
	    lastDay = new Date(year,month,0);
	    
	}
	
	//calendar 날짜표시
	function drawDays() {
	    $("#cal_top_year").text(year);
	    $("#cal_top_month").text(month);
	    for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
	        $tdDay.eq(i).text(++dayCount);
	    }
	    for(var i=0;i<42;i+=7) {
	        $tdDay.eq(i).css("color","red");
	    }
	    for(var i=6;i<42;i+=7) {
	        $tdDay.eq(i).css("color","blue");
	    }
	}
	
	//스케줄표시
	function drawSche() {
		
		$tdSche.eq(today.getDate()+firstDay.getDay()-1).text("🤴🏻오늘 뷰 다 끝날수있나?");
		$tdSche.eq(today.getDate()+firstDay.getDay()).text("🎃금요일인데 아직 뷰 못끝냈겠찌?");
		$tdSche.eq(today.getDate()).css("color", "black");
		
	}
	
	//calendar 월 이동
	function movePrevMonth() {
	   
		month--;
	    if(month<=0) {
	        month=12;
	        year--;
	    }
	    if(month<10) {
	        month=String("0"+month);
	    }
	    getNewInfo();
	
	}
	
	function moveNextMonth() {
	   
		month++;
	    if(month>12) {
	        month=1;
	        year++;
	    }
	
	    if(month<10) {
	        month=String("0"+month);
	    }
	
	    getNewInfo();
	
	}
	
	function getNewInfo() {
		
	    for(var i=0;i<42;i++) {
	        $tdDay.eq(i).text("");
	        $tdSche.eq(i).text("");
	    }
	    dayCount=0;
	    firstDay = new Date(year,month-1,1);
	    lastDay = new Date(year,month,0);
	    drawDays();
	    drawSche();
	}
</script>
</html>