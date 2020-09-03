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
		                    <div id="today-btn"><button id="rectangle3">Today</button></div>
			                    <div id="week-dropdown">
			                    	<div class="dropdown">
								        <div class="select">
								              <span id="user-list">날짜</span>
								          <i class="fa fa-chevron-left"></i>
								        </div>
								        <ul class="dropdown-menu">
								          <li id="day">day</li>
								          <li id="week">Week</li>
								          <li id="month">Month</li>
								          <!-- <li id="Quater-Day">Quater Day</li> -->
								          <li id="Half-Day">Half Day</li>
								        </ul>
							      </div>
					     	 </div>	
		                    <div id="unsch"><button id="rectangle3" width="90px;" class="addTasks">Add-tasks</button></div>
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
		                			<!-- <div id="ep-ti">
		               					스프린트 제목
		                			</div>	 -->
	                			<!-- <div id="epic-add-btn">
	                				<button id="ep-ad-btn">
	                					<img src="/agile/resources/icon/common/icon_circle_plus.png" width="15px;" height="15px;">
	                				</button>
	                				<input type="text" id="ep-ti-tx" style="display:none;" onkeyup="enterkey();">
	                			</div> -->
	                			<!-- <table style="width:100%;">
	                				<tr>
	                					<td style="border-bottom:1px solid #E8E8E8; text-align:center; height:90px;">제목이 생겨야해</td>
	                				</tr>
	                			</table> -->
	                		</div>
                		</div>
                	</div>
                	<!-- 에픽 타이틀 영역 끝 -->
                	<!-- 에픽 달력 영역 시작 -->
                	<div id="epic-wrap">
                	<div id="epic-con-area">
                	<div class="gantt-target">
                	</div>
                	
                		<!-- <div id="epic-con-title">
                			
                		</div>
                		<div id="epic-con-cont">
                			
                		</div> -->
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
				
					
				//var monthBtn = document.getElementById("month");
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