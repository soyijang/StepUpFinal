<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectTimeLine/projectTimeLine.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">

<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="content">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
                    <div id="menuTitle">로드맵</div>
                    <div id="share">
	                    	<button id="shareBtn">
	                    		<img id="sharedIcon"alt="공유아이콘" src="/agile/resources/icon/common/icon_shareicon.png">공유
	                    	</button>
	                </div>
                    <div id="shareArea">
	                    <div id="userArea"><img src="/agile/resources/images/profile/dayoon_202008152056.png"><img src="/agile/resources/images/profile/soyi_202008132015.png"></div>
	                    <div id="btn-share-area">
		                    <div id="today-btn"><button id="rectangle3">Today</button></div>
		                    <div id="week-dropdown"><button id="rectangle3">Today</button></div>
		                    <div id="unsch"><button id="rectangle3" width="90px;">Unscheduled</button></div>
	                    </div>
                    </div>
                    <div id="line"></div>
                </div>
                <!-- 프로젝트 제목 및 메뉴 이름 영역 끝 -->
                <!-- 에픽 영역 시작 -->
                <div id="contentBox2">
                
                	<!-- 에픽 타이틀 영역 시작 -->
                	<div id="epic-area">
                		
                		<div id="epic-title">
                			<div id="epic">에픽</div>
                		</div>
                		<div id="epic-title-cont">
                			<div id="ep-ti">
               					여기에 에픽 제목
                			</div>
                			<div id="epic-add-btn">
                				<button id="ep-ad-btn">
                					에픽 만들기
                				</button>
                				<input type="text" id="ep-ti-tx" style="display:none;" onkeyup="enterkey();">
                			</div>
                			<!-- <table style="width:100%;">
                				<tr>
                					<td style="border-bottom:1px solid #E8E8E8; text-align:center; height:90px;">제목이 생겨야해</td>
                				</tr>
                			</table> -->
                		</div>
                	</div>
                	<!-- 에픽 타이틀 영역 끝 -->
                	<!-- 에픽 달력 영역 시작 -->
                	<div id="epic-wrap">
                	<div id="epic-con-area">
                		<div id="epic-con-title">
                			<!-- <div id="epic-mon">8월</div>
                			<div id="epic-dd">화 수</div>
                			<div id="epic-day">25 26</div> -->
                		</div>
                		<div id="epic-con-cont">
                		
                		</div>
                	</div>
                	</div>
                	<!-- 에픽 달력 영역 끝 -->
                </div>
                <!-- 에픽 영역 끝 -->
             </div>
</body>
<script>
	//input type text에서 엔터치면 실행되는 함수
	function enterkey() {
		if(window.event.keyCode == 13){
			createEpic();
			noneinput();
		}
	}
	function noneinput(){
		$("#ep-ti-tx").hide();
		$("#ep-ad-btn").hide();
	}
	
	
	//에픽제목 버튼 누르면 input type text활성화, 버튼 비활성화 되는 함수
	$("#ep-ad-btn").on('click',function(e){
		$("#ep-ti-tx").show();
		$("#ep-ad-btn").hide();
	});
	
	//에픽 제목 div 영역 누르면 버튼 활성화, text창 비활성화 되는 함수
	$(document).on("click",function(e){
		if($("#epic-title-cont").is(e.target)){
			
			$("#ep-ti-tx").hide();
			$("#ep-ad-btn").show();
			
		}
	});
	
	function createEpic(){
		var epdiv = $("#ep-ti");
		
		var ti = document.getElementById('ep-ti-tx').value;
		console.log(ti);
		/* var div = document.createElement('div');

	    div.innerHTML = document.getElementById('ep-ti-tx').value;

	    document.getElementById('epic-title-cont').appendChild(div); */
	    $('#epic-add-btn').remove();
	    $('#ep-ad-btn').remove();
	    $('#ep-ti-tx').remove();
	    
	    $('#epic-title-cont').append('<div id="ep-ti">' + ti + '</div>');
	    $('#ep-ti').append('<div id="epic-add-btn">');
	    $('#epic-add-btn').append('<button id="ep-ad-btn">');
	    $('#epic-add-btn').append('<input type="text" id="ep-ti-tx" style="display:none;" onkeyup="enterkey();">');
	
	    
	}
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
        //setTableHTML+='<tr id="cal-tr">8월<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
            setTableHTML+='<tr id="cal-daytr">';
        for(var i=0;i<6;i++){
            for(var j=0;j<32;j++){
                setTableHTML+='<td style="width:10%">';
                setTableHTML+='    <div class="cal-day" style="width:10%; display:inline-block;"></div>';
                setTableHTML+='    <div class="cal-schedule" style="width:10% display:inline-block;"></div>';
                setTableHTML+='</td>';
            setTableHTML+='</tr>';
            }
        }
        setTableHTML+='</table>';
        $("#epic-con-title").html(setTableHTML);
        
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
            $tdDay.eq(i).css("color","#a30000");
        }
        for(var i=6;i<42;i+=7) {
            $tdDay.eq(i).css("color","#1e019e");
        }
    }
    
    //스케줄표시
    function drawSche() {
    	
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