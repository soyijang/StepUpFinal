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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="main-cont">
                <div id="main-cont-area">
                	<div id="status-area">
                		<div id="not-task">
                			<div id="n-tk" class="status">2</div>
                			<p id="n-tk-ti">미진행</p>
                		</div>
                		<div id="task-ing">
                			<div id="tk-ing" class="status">8</div>
                			<p id="tk-ing-ti">진행중</p>
                		</div>
                		<div id="com-task">
                			<div id="co-tk" class="status">1</div>
                			<p id="co-tk-ti">진행완료</p>
                		</div>
                		<div id="tot-task">
                			<div id="to-tk" class="status">11</div>
                			<p id="ti-tk-ti">전체 업무</p>
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
                	<!-- <div id="cal-cont-title">
                		<p id="calendar">Calendar</p>
                	</div> -->
                	<div id="cal-cont">
                		<!-- <table width="100%" height="100%">
                			<thead style="font-size: 27px;">
                				<tr>
                					<th class="th-title">Calendar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                					<img src="/agile/resources/icon/common/icon_gear.png" width="20px;" height="20px;""></th>
                				</tr>
                			</thead>
                			<tbody style="boder-spacing:20px;">
                				<tr>
                					<td></td>
                				</tr>
	                			<tr>
	                				<td>17<br>월</td>
	                			</tr>
	                			
	                			<tr>
	                				<td>18<br>화</td>
	                			</tr>
	                		
	                			<tr>
	                				<td>19<br>수</td>
	                			</tr>
	                		
	                			<tr>
	                				<td>20<br>목</td>
	                			</tr>
	                			
	                			<tr>
	                				<td>21<br>금</td>
	                			</tr>
	                		
	                			<tr>
	                				<td>22<br>토</td>
	                			</tr>
	                		
	                			<tr>
	                				<td>23<br>일</td>
	                			</tr>
                			</tbody>
                		</table> -->
                		<!-- <div id="mon" class=""></div>
                		<div id="tue" class=""></div>
                		<div id="wed" class=""></div>
                		<div id="thu" class=""></div>
                		<div id="fri" class=""></div>
                		<div id="sat" class=""></div>
                		<div id="sun" class=""></div> -->
                	</div>
                	<!-- <div id="cal-cont">
                		<div id="mon" class=""></div>
                		<div id="tue" class=""></div>
                		<div id="wed" class=""></div>
                		<div id="thu" class=""></div>
                		<div id="fri" class=""></div>
                		<div id="sat" class=""></div>
                		<div id="sun" class=""></div>
                		<div id="mon2" class=""></div>
                		<div id="tue2" class=""></div>
                		<div id="wed2" class=""></div>
                		<div id="thu2" class=""></div>
                		<div id="fri2" class=""></div>
                		<div id="sat2" class=""></div>
                		<div id="sun2" class=""></div>
                	</div> -->
                </div>
             </div>
</body>
<script>
	/**
	 *  yyyyMMdd 포맷으로 반환
	 */
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    var today = date.getDay();
	    return  year + '' + month + '' + day + '' + today;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	
	$(document).ready(function(){
		var date = new Date();
		console.log(date);
		date = getFormatDate(date);
		
		console.log("포맷팅된 날짜 : " + date);
		
		var day;
		day = date.substring(6, 8);
		console.log("오늘 몇일 : " + day);
		
		var today;
		today = date.substring(10, 8);
		console.log("오늘 요일 : " + today);
		
		/*  if(today == '0') {
			today = '일';
		} else if(today == '1'){
			today = '월';
		} else if(today == '2'){
			today = '화';
		} else if(today == '3'){
			today = '수';
		} else if(today == '4'){
			today = '목';
		} else if(today == '5'){
			today = '금';
		} else if(today == '6'){
			today = '토';
		}  */
		
		console.log(today);
		
		for(i=day; i<8; i++){
			
		}
		
		
		var mon;
		mon = date.substring(6, 4);
		console.log(mon);
		
		if(mon == '01'){
			mon = 'Jan';
			console.log(mon);
		} else if(mon == '02'){
			mon = 'Feb';
			console.log(mon);
		} else if(mon == '03'){
			mon = 'Mar';
			console.log(mon);
		} else if(mon == '04'){
			mon = 'Apr';
			console.log(mon);
		} else if(mon == '05'){
			mon = 'May';
			console.log(mon);
		} else if(mon == '06'){
			mon = 'Jun';
			console.log(mon);
		} else if(mon == '07'){
			mon = 'Jul';
			console.log(mon);
		} else if(mon == '08'){
			mon = 'Aug';
			console.log(mon);
		} else if(mon == '09'){
			mon = 'Sep';
			console.log(mon);
		} else if(mon == '10'){
			mon = 'Oct';
			console.log(mon);
		} else if(mon == '11'){
			mon = 'Nov';
			console.log(mon);
		} else if(mon == '12'){
			mon = 'Dec';
			console.log(mon);
		}
		
		drawCalendar(today);
		
		
	});
	
	function drawCalendar(today){
		var setTableHTML = "";
	    setTableHTML+='<table>';
	    setTableHTML+='<thead style="font-size: 27px;">';
	    setTableHTML+='<tr><th class="th-title">Calendar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
	    +'<img src="/agile/resources/icon/common/icon_gear.png" width="20px;" height="20px;""></th>';
	    setTableHTML+='<tbody style="boder-spacing:20px;">';
	    
	    var j = 0;
	    /* for(j=today; j < 7; j++) {
        	if(j == '0') {
    			j = '일';
    		} else if(j == '1'){
    			j = '월';
    		} else if(j == '2'){
    			j = '화';
    		} else if(j == '3'){
    			j = '수';
    		} else if(j == '4'){
    			j = '목';
    		} else if(j == '5'){
    			j = '금';
    		} else if(j == '6'){
    			j = '토';
    		} 
        } */
	    for(var i=0;i<7;i++){
	        setTableHTML+='<tr>';
	        setTableHTML+='<td>' + '<br>';
	        
		        if(today == 0) {
					today = '일';
				} else if(today == 1){
					today = '월';
				} else if(today == 2){
					today = '화';
				} else if(today == 3){
					today = '수';
				} else if(today == 4){
					today = '목';
				} else if(today == 5){
					today = '금';
				} else if(today == 6){
					today = '토';
				}
		        
	        setTableHTML+= today;
	        
		    today++;
	        today = "";
	        
	        	
	        setTableHTML+= "</td>";
	        setTableHTML+='</tr>';
	    }
	    setTableHTML+='</tbody>';
	    setTableHTML+='</thead>';
	    setTableHTML+='</table>';
	    
	    $("#cal-cont").html(setTableHTML);
	}
	
	/*var firstDay = null;
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
	} */
</script>
</html>