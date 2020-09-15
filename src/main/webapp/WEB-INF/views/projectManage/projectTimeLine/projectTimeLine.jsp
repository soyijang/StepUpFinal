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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/modal.css">
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
	<%@ include file="../../common/nav.jsp" %>
            <div id="content-nav-only">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2"></div>
                    <div id="menuTitle">로드맵</div>
                    <div id="share">
	                    	
						    <!-- Trigger/Open The Modal -->
						
	                    	<button id="shareBtn">
	                    		<img id="sharedIcon"alt="공유아이콘" src="/agile/resources/icon/common/icon_shareicon.png"><div id="share-timeline">공유</div>
	                    	</button>
						
						    <!-- The Modal -->
						    <div id="myModal" class="modal">
						      <!-- Modal content -->
						      <div class="modal-content">
						        <p align="left" class ="modaltitle" style="font-size:30px; text-align: center;">클립보드 복사하기📌</p>
						        <div id="url-form"><form name="clipboard"><input type="text" name="url" id="ShareUrl"></form></div>
						        <div id="url-form-btn">
						        <button class="close" style="margin-left:30px;" id="clip-close-btn">닫기</button>
						        <button id="clipbtn" onclick="urlClipCopy();">복사</button>
						        </div>
						      </div>
						    
						    </div>
	                </div>
                    <div id="shareArea">
	                    <div id="userArea"><!-- <img src="/agile/resources/images/profile/dayoon_202008152056.png"><img src="/agile/resources/images/profile/soyi_202008132015.png"> --></div>
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
	
	var pjCode = [];
	function drawGantt(){
		$.ajax({
			url: "timelineTask.pj",
			type:"post",
			dataType: "json",
			success: function(data){
				
				//계정이름
				var name = data.userName;
				console.log(name);
				
				var div = "";
				div= name  + " 님의 타임라인";
				$("#projectTitle2").append(div);
				
				var values;
				values = data.ProjectList;
				
				console.log(data.ProjectList);
				
				var projectHistoryStartTime = [];
				var projectHistoryEndTime = [];
				var projectHistoryIntro = [];

				
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
					Cnt++;
					projectHistoryStartTime += value.projectHistory.projectStartTime;
					if(Cnt != index){
						projectHistoryStartTime += ",";
					}
					projectHistoryEndTime += value.projectHistory.projectEndTime;
					if(Cnt != index){
						projectHistoryEndTime += ",";
					}
					projectHistoryIntro += value.projectHistory.projectIntro;
					if(Cnt != index){
						projectHistoryIntro += ",";
					}
					
					startDate = value.projectHistory.projectStartDate;
					sDate[index] = startDate;
					
					endDate = value.projectHistory.projectEndDate;
					eDate[index] = endDate;
					
					projectName = value.projectName;
					pjCode += value.projectCode;
					
					if(Cnt != index){
						pjCode += ", ";
					}
					
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
				console.log(pjCode);
		
				
				var tasks = [];
				
				for(var j=0; j<ProjectList.length; j++){
					tasks.push({start : sDate[j], end: eDate[j], name: pjNameArr[j], id: "Task " + j, progress: 100});
				}
				
					
				var gantt_chart = new Gantt(".gantt-target", tasks, {
							on_click: function (task) {
								console.log(task);
							},
							on_date_change: function(task, start, end) {
								var projectName = task.name;
								date_change(projectName, start, end, values);
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

	function date_change(projectName, start, end, values){
		var projectHistoryStartTime;
		var projectHistoryEndTime;
		var projectHistoryIntro; 
		console.log(projectName);
		console.log(values);
		/* var values;
		values = data.ProjectList; */
		
	    var ProjectList = $.each(values, function(index, value){
			if(projectName == value.projectName){
				console.log("성공");
				projectHistoryStartTime = value.projectHistory.projectStartTime;
				projectHistoryEndTime = value.projectHistory.projectEndTime;
				projectHistoryIntro = value.projectHistory.projectIntro;
				console.log(projectHistoryIntro);
				console.log(projectHistoryStartTime);
				console.log(projectHistoryEndTime);
			}
		});
		
		
		 $.ajax({
			url: "updateTimeline.pj",
			type:"post",
			data:{"projectName":projectName, "start":start, "end":end, "projectHistoryStartTime":projectHistoryStartTime, "projectHistoryEndTime":projectHistoryEndTime, "projectHistoryIntro":projectHistoryIntro},
			dataType: "json",
			success: function(data){
				console.log("projectName : " + projectName);
				console.log("start : " + start);
				console.log("end : " + end);
				console.log("pjCode : " + pjCode);
				
				
				
				
				console.log("컨트롤러 성공");
				
			}, error:function(){
				
			},beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
                
           	},complete : function(){
                   $('.wrap-loading').addClass('display-none');
           	}
		});
	};
	

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

	//클립보드 복사
	function urlClipCopy() {
			var obShareUrl = document.getElementById("ShareUrl");
			obShareUrl.value = window.document.location.href;
			
			obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다

			document.execCommand("copy"); // 클립보드에 복사합니다.

			obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.

			alert("URL이 클립보드에 복사되었습니다"); 

		}	
	
	//모달
	// Get the modal
    var modal = document.getElementById("myModal");
    
	// Get the button that opens the modal
	    var btn = document.getElementById("shareBtn");
	    
	// Get the <span> element that closes the modal
	    var span = document.getElementsByClassName("close")[0];
	    
	// When the user clicks on the button, open the modal
	    btn.onclick = function() {
	        $(modal).fadeIn(300); 
	        $(modal).css('display','block');

			var obShareUrl = document.getElementById("ShareUrl");
			obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅해 줍니다.
	    }
	    
	// When the user clicks on <span> (x), close the modal
	    span.onclick = function() {
	        $(modal).css('display','none');
	    }
	    
	// When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	      if (event.target == modal) {
	        modal.style.display = "none";
	      }
	    };
	
</script>
</html>