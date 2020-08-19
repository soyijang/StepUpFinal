<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.calendar{
		width: 75%;
	}

</style>
</head>
<body>

    <%@ include file="../../common/menubar.jsp" %>
    <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
            <div id="menuTitle">예시 개인일정관리</div>
        </div>
        <div id="contentBox">
			<div id="calendar">				
				<div class="cal_top">
					<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
					<span id="cal_top_year"></span>
					<span id="cal_top_month"></span>
					<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
				</div>
			
				 <div class="cal-func">
					<div class="date-type">
						<span class="type-r"><div></div><em>개인일정</em></span>
						<span class="type-e"><div></div><em>프로젝트일정</em></span>
					</div>
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
	        $("#movePrevMonth").on("click", function(){movePrevMonth();});
	        $("#moveNextMonth").on("click", function(){moveNextMonth();});
	        
	    });
	
	    //calendar 그리기
	    function drawCalendar() {
	    	
	        var setTableHTML = "";
	        setTableHTML+='<table class="calendar">';
	        setTableHTML+='<tr id="cal-tr"><th style="color: red;">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:blue;">토</th></tr>';
	        for(var i=0;i<6;i++){
	            setTableHTML+='<tr height="100">';
	            for(var j=0;j<7;j++){
	                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
	                setTableHTML+='    <div class="cal-day"></div>';
	                setTableHTML+='    <div class="cal-schedule"></div>';
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
	        }
	        dayCount=0;
	        firstDay = new Date(year,month-1,1);
	        lastDay = new Date(year,month,0);
	        drawDays();
	        
	    }
	
	</script>
	
	<script>
	
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
	</script>

</body>
</html>