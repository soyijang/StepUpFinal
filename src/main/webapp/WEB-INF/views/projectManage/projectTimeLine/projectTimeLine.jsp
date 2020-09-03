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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/agile/resources/js/indiv/projectManage/projectTimeLine/projectTimeLine.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectTimeLine/frappe-gantt.css" />
<script src="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectTimeLine/frappe-gantt.js"></script>
<style>
.container {
	width: 80%;
	margin: 0 auto;
}
/* custom class */
.gantt .bar-milestone .bar {
	fill: tomato;
}
	</style>
<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="content">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <%-- <div id="projectTitle2">프로젝트 / <c:forEach var="i" items="${ pjList }"><c:out value="${ i.projectName }"/></c:forEach></div> --%>
                    <div id="menuTitle">로드맵</div>
                    <div id="share">
	                    	<button id="shareBtn">
	                    		<img id="sharedIcon"alt="공유아이콘" src="/agile/resources/icon/common/icon_shareicon.png">공유
	                    	</button>
	                </div>
                    <div id="shareArea">
	                    <div id="userArea"><img src="/agile/resources/images/profile/dayoon_202008152056.png"><img src="/agile/resources/images/profile/soyi_202008132015.png"></div>
	                    <div id="btn-share-area">
		                    <div class="today-btn"><button id="day" class="dayBtn">Day</button></div>
		                    <div class="today-btn"><button id="week" class="dayBtn">Week</button></div>
		                    <div class="today-btn"><button id="month" class="dayBtn">Month</button></div>
		                    <div class="today-btn"><button id="Half-Day" class="dayBtn2">Half Day</button></div>
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
                			<div id="epic">프로젝트</div>
                		</div>
                		<div id="epic-title-wrap">
	                		<div id="epic-title-cont">
	                		</div>
                		</div>
                	</div>
                	<!-- 에픽 타이틀 영역 끝 -->
                	<!-- 에픽 달력 영역 시작 -->
                	<div id="epic-wrap">
                	<div id="epic-con-area">
                	<div class="gantt-target">
                	</div>
                	
                	</div>
                	</div>
                	<!-- 에픽 달력 영역 끝 -->
                </div>
                <!-- 에픽 영역 끝 -->
             </div>
              <div class="wrap-loading display-none">
         <div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
   </div>    
</body>
<script>
	window.onload = function(){
		
	    drawGantt();
	    
	};
	
	function drawGantt(){
		$.ajax({
			url: "timelineTask.pj",
			type:"post",
			dataType: "json",
			success: function(data){
				
				var values;
				values = data.ProjectList;

				console.log(data.ProjectList);
				
				var Cont = [];
				var startDate = [];
				var endDate = [];
				var projectName =[];
				var Cnt = 0;
				var div = '';
				
				var sDate = [];
				var eDate = [];
				var pjNameArr = [];
				
				var ProjectList = $.each(values, function(index, value){
					startDate = value.projectHistory.projectStartDate;
					sDate[index] = startDate;
					
					endDate = value.projectHistory.projectEndDate;
					eDate[index] = endDate;
					
					projectName = value.projectName;
					pjNameArr[index] = projectName;
					if(projectName.length > 10){
						var pjName = projectName.substring(0, 10);
						div = '<div id="ep-ti">' + pjName + '...' + '</div>';
					} else if(projectName.length <= 10){
						div = '<div id="ep-ti">' + projectName + '</div>';
					}
					
					$("#epic-title-cont").append(div);
				}); 
				console.log(startDate);
				console.log(endDate);
				console.log(projectName);
				console.log(sDate);
				console.log(eDate);
		
				
				var tasks = [];
				
				for(var j=0; j<ProjectList.length; j++){
					tasks.push({start : sDate[j], end: eDate[j], name: pjNameArr[j], id: "Task " + j, progress: 100});
				}
				
					
				var gantt_chart = new Gantt(".gantt-target", tasks, {
							on_click: function (task) {
								console.log(task);
							},
							on_date_change: function(task, start, end) {
								console.log(task, start, end);
							},
							on_progress_change: function(task, progress) {
								console.log(task, progress);
							},
							on_view_change: function(mode) {
								console.log(mode);
							},
							
							
							language: 'ko',
							//view_mode: 'Month'
				});
					
				
				 if(
					$(document).on('click', '#week', function(){
						gantt_chart.change_view_mode('Week');
					})
				)
				if(
					$(document).on('click', '#month', function(){
						gantt_chart.change_view_mode('Month');
					})	
				)
				/* if(
					$(document).on('click', '#Quater-Day', function(){
						gantt_chart.change_view_mode('Quater Day');
					})	
				)  */
				if(
					$(document).on('click', '#day', function(){
						gantt_chart.change_view_mode('Day');
					})	
				) 
				
				if(
					$(document).on('click', '#Half-Day', function(){
						gantt_chart.change_view_mode('Half Day');
					})	
				)
							
				console.log(gantt_chart);
						
						var YEAR = 'year';
						var MONTH = 'month';
						var DAY = 'day';
						var HOUR = 'hour';
						var MINUTE = 'minute';
						var SECOND = 'second';
						var MILLISECOND = 'millisecond';
					  
				
			},
			error:function(){
				console.log("실패");
			},
			beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
           	},
           	complete : function(){
                   $('.wrap-loading').addClass('display-none');
           	}
		});
	}


    //드롭다운
   $('.dropdown').click(function() {
	$(this).attr('tabindex', 1).focus();
	$(this).toggleClass('active');
	$(this).find('.dropdown-menu').slideToggle(300);
	});
	
	$('.dropdown').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.dropdown-menu').slideUp(300);
	});
	
	$('.dropdown .dropdown-menu li').click(
		function() {
			$(this).parents('.dropdown').find('span').text($(this).text());
			$(this).parents('.dropdown').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.dropdown-menu li').click(function() {
			var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
	});
</script>
</html>