  var today = null;
	    var year = null;
	    var month = null;
	    var firstDay = null;
	    var lastDay = null;
	    var $tdDay = null;
	    var $tdSche = null;
	
	    window.onload = function(){
	    	
	        drawCalendar();
	        initDate();
	        drawDays();
	        drawSche();
	        $("#movePrevMonth").on("click", function(){movePrevMonth();});
	        $("#moveNextMonth").on("click", function(){moveNextMonth();});
	        
	    };
	
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
	