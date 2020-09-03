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
                    <div id="projectTitle2">프로젝트 / <c:forEach var="i" items="${ pjList }"><c:out value="${ i.projectName }"/></c:forEach></div>
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
								          <li id="week">주간</li>
								          <li id="month">월간</li>
								          <li id="half">분기</li>
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
                			<div id="epic">에픽</div>
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
			url: "timelineTask.tk",
			type:"post",
			dataType: "json",
			success: function(data){
				
				var values;
				values = data.taskList;
				
				var sCode;
				var sprintCode;
				console.log(data.taskList);
				
				var Cont = [];
				var Title = [];
				var YN = [];
				var Status =[];
				var Cnt = 0;
				
				  var taskList = $.each(values, function(index, value){
					  
					  Cnt++;
					  console.log(Cnt);
					  if(value.taskCategoryCode == "H"){
						Cont += value.taskHistValue;
							 Cont += ",";
					} else if(value.taskCategoryCode == "J"){
						Title += value.taskHistValue;
							 Title += ",";
					} else if(value.taskCategoryCode == "G"){
						YN += value.taskHistValue;
							YN += ",";
					} else if(value.taskCategoryCode == "I"){
						Status = value.taskHistValue;
							Status += ",";
					}
					 
					 sCode = value.sprint;
				 	 sprintCode = sCode.sprintCode;
					console.log("sprintCode : " + sprintCode);
					
				  
					
					});  
					  console.log(Cont);
					  console.log(Title);
					  console.log(YN);
					  console.log(Status);
				  
					  var values2;
					  values2 = data.SprintList;
					  var sprintTitle;
					  var sprintTitleArr = [];
					  var div = '';
					  
					  var SprintList = $.each(values2, function(index, value){  
						  sprintTitle = value.sprintName;
						  sprintTitleArr += value.sprintName;
						  sprintTitleArr += ",";
						  console.log("sprintTitleArr : " + sprintTitleArr);
						  console.log("sprintTitle : " + sprintTitle);
						  console.log("sprintTitle length : " + sprintTitle.length);
						  if(sprintTitle.length > 10){
							  var spTitle = sprintTitle.substring(0, 10);
					 	  	div = '<div id="ep-ti">' + spTitle + '...' + '</div>';
						  } else if(sprintTitle.length < 10){
							 div = '<div id="ep-ti">' + sprintTitle + '</div>';
						  }
						  
						  $("#epic-title-cont").append(div);
							
					  });
					  var sTitle = sprintTitleArr.split(",");
					  console.log(sTitle);
					  
					  for(var i = 1; i<=sprintTitle.length; i++){
						  var tki = {};
						  tki.start = '2020-09-14';
						  tki.end = '2020-09-30';
						  tki.name = sTitle[i-1];
						  tki.id = 'Task ' + i;
						  tki.progress = 100;
						  console.log(tki);
						  var tasks = [tki, tki, tki]
					  }
					//console.log(tk1);
					  
					  /* var tasks = [
						  {start :'2020-08-26', end:'2020-08-31', name:sprintTitleArr[0], id: "Task 0"},
						  {start :'2020-08-26', end:'2020-08-31', name:sprintTitleArr[1], id: "Task 1"},
						  {start :'2020-08-26', end:'2020-08-31', name:sprintTitleArr[2], id: "Task 2"},
					  ] */
									   /* tk = {
												start: '2020-08-26',
												end: '2020-08-31',
												name: sprintTitleArr[i],
												id: "Task 0",
												dependencies:"Task 1",
												progress: 40
											}; */ 
											var cnt = 1;
							  			//var tasks = [ tk1
							  				
							  				   /* {
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 0",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 1",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 2",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 3",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 4",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 5",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 6",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 7",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 8",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 9",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 10",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 11",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 12",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 13",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 14",
													progress: 40
												},
												{
													start: '2020-08-26',
													end: '2020-08-31',
													name: sprintTitle,
													id: "Task 15",
													progress: 40
												} ]*/
								
							
					  
						
						
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
							
							view_mode: 'Day',
							language: 'ko'
						});
						
						
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