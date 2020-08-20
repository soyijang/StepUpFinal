<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.calendar{
		width: 75%;
		margin-top: 15px;
	}

	#cal-tr > th{
		text-align: left;
	
	}
	.cal-schedule{
		font-size: small;
	}
	
	.cal_top{
		width: 75%;
		text-align: left;
		font-size: xx-large;
	}
	
	.all_cal-func{
		width: 75%;
	}
	
	.cal-func{
		margin: 5px;
		height: 40px;
		width: 140px;
		background-color: black;
		color: white;
		float: right;
		text-align: center;
		line-height: 40px;
		font-size: small;
		border-radius: 10px;
	}
	
	#prevMonth > img , #nextMonth > img {
		width: 30px;
		height: 30px;
		vertical-align: middle;
	}
	
	
</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 앤티앤스프레즐맛있네요</div>
            <div id="menuTitle">개인일정관리</div>
        </div>
        <div id="contentBox">
			<div id="calendar">				
				 <div class="all_cal-func">
					<div class="cal_top">
						<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img src="${contextPath}/resources/icon/common/icon_left_chevron.png"></span></a>
						<span id="cal_top_year"></span>.
						<span id="cal_top_month"></span>
						<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img src="${contextPath}/resources/icon/common/icon_right_chevron.png"></span></a>
					</div>
					<div class="cal-func">공유되지않은 일정</div>
					<div class="cal-func">공유된 일정</div>
					<div class="cal-func">전체 개인 일정</div>
				</div>	
			
				<div id="cal_tab" class="cal"></div>				   		
			</div>
		</div>
    </div>

	<script type="text/javascript">
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
	        setTableHTML+='<tr id="cal-tr"><th style="color: red;">Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th style="color:blue;">Sat</th></tr>';
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
	    	
	    	$tdSche.eq(today.getDate()+firstDay.getDay()-1).text("🤴🏻오늘 js 다 끝날수있나?");
	    	$tdSche.eq(today.getDate()+firstDay.getDay()).text("🎃금요일인데 아직 못끝내겠찌?");
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