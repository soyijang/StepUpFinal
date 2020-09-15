<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userMyTasks/userStandupMeeting/userStandupMeeting.css">
   	<!-- CDN -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

   <%@ include file="../../common/menubar.jsp" %>
   <div id="content">
       <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
       <div id="contentTitle">
           <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
           <div id="menuTitle">Stand Up Meeting</div>
       </div>
		<input type="hidden" value="<c:set var="now" value="<%=new java.util.Date()%>"/>">


       <!-- content 영역 -->
       <div id="contentBox">
       		<!-- 헤더 -->
			<div id="content-box-header">
				<table id="content-box-header-table">
					<tr>
						<td></td>
						<td>
							<!-- <div id="search">
								<input class="input" type="text"/>
								<img id="icon_searchicon" src="/agile/resources/icon/common/icon_searchicon.png">
							</div> -->
						</td>
						<td><img id="icon_rss_feed" src="/agile/resources/icon/common/icon_rss_feed.png"></td>
						<td><img id="icon_settings" src="/agile/resources/icon/common/icon_settings.png"></td>
						<td id="today-box-td">
							<div id="today-box-wrapper">
								<img id="icon_double_left_chevron" src="/agile/resources/icon/common/icon_double_left_chevron.png">
									<div id="today-box"></div>
									<input type="hidden" id="today" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
								<img id="icon_double-right_chevron" src="/agile/resources/icon/common/icon_double _right_chevron.png">
							</div>
						</td>
					</tr>
				</table>
			</div>	
       		<div id="calender-box">
       			<!-- 헤더 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-box-table">
       				<tr id="calender-box-table-tr-1">
       					<td id="category"><div class="space"></div></td>
       					<td class="sun"><div class="date">SUN</div></td>
       					<td class="mon"><div class="date">MON</div></td>
       					<td class="tue"><div class="date">TUE</div></td>
       					<td class="wed"><div class="date">WED</div></td>
       					<td class="thur"><div class="date">THUR</div></td>
       					<td class="fri"><div class="date">FRI</div></td>
       					<td class="sat"><div class="date">SAT</div></td>
       				</tr>
       				<tr id="calender-box-table-tr-2" class="date">
       					<td class="category"><div class="space"></div></td>
       					<td class="sun"><div class="day">j</div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       			</table>
       			<!-- 미진행 테이블 -------------------------------------------------------------------------------------------------------->
       			<table  id="calender-notInProgress-table">
       				<tr>
        				<td class="category"><div class="spaces">미진행</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">sss</div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       			</table>
       			<!-- 완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-complete-table">
       				<tr>
        				<td class="category"><div class="spaces">진행완료</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       			</table>
       			
       			<!-- 미완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-incomplete-table">
       				<tr>
        				<td class="category"><div class="spaces">미완료</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       				</tr>
       			</table>
       		</div>
		</div>	
    </div>
    
   
</body>


<script>

//컨트롤러에서 보낸 리스트 가져오기
var selectMytaskShareList = JSON.parse('${selectMytaskShareList}');
console.log("공유된 일정 조회");
console.log(selectMytaskShareList);

//오늘 날짜 확인
var today = new Date();
//input hidden에 저장
$("#today").val(today);
//요일
var day = today.getDay();

/* ------------------------------------------------------------------------------------- */
//캘린더 제목에 오늘날짜 다시 써주기
var title = $('#today-box');
title.html(today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + today.getDate() + "일");

//주간 캘린더 시작일
//일자가 m일이고 요일이 n인경우 주간 캘린더 일자 시작은 m-n, 종료일은 m+6-n
var start = new Date(today.getFullYear(), today.getMonth(), today.getDate());//오늘 날짜에서 시작
start.setDate(start.getDate() - day);//setDate로 변경. 기존 날짜에서 getDate 한 후 요일값 만큼 빼주면 주간 캘린더 시작일 나옴

var end = new Date(today.getFullYear(), today.getMonth(), today.getDate());
end.setDate(end.getDate() + 6 - day);

//날짜 그리기
$(".date .day").each(function(index, item){
	$(item).html(start.getDate());
	start.setDate(start.getDate() + 1);
});
/* ------------------------------------------------------------------------------------- */




//공유 내용 그려주기
for(var i = 0; i < selectMytaskShareList.length; i++){	
	//공유한 일자 Date로 변환
	var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
	console.log("1 공유일 : "+mytasksShareDate.getTime());
	console.log("2 시작일 : "+start.getTime());
	console.log("3 종료일 : "+end.getTime());
	console.log(end.getTime() - mytasksShareDate.getTime() );
	console.log( mytasksShareDate.getTime() - start.getTime() );
	//주간 캘린더 시작일보다 작거나 종료일보다 크면 건너뛰기
	if(end.getTime() - mytasksShareDate.getTime() >= 0 && mytasksShareDate.getTime() - start.getTime() >= 0){
		console.log("표시 하기");
	}else if(end.getTime() - mytasksShareDate.getTime() < 0 || mytasksShareDate.getTime() - start.getTime() < 0){
		console.log("표시안함");
	}else{
		console.log("오류");
	}
}



//왼쪽으로 가기 아이콘 클릭시
$(document).on('click','#icon_double_left_chevron', function(){
	/* ------------------------------------------------------------------------------------- */
	//담아옴
	var today = new Date($("#today").val());
	//7일 더해줌
	today.setDate(today.getDate() - 7);
	//input hidden에 다시 저장
	$("#today").val(today)

	//캘린더 제목에 오늘날짜 다시 써주기
	var title = $('#today-box');
	title.html(today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + today.getDate() + "일");

	//주간 캘린더 시작일
	//일자가 m일이고 요일이 n인경우 주간 캘린더 일자 시작은 m-n, 종료일은 m+6-n
	var start = new Date(today.getFullYear(), today.getMonth(), today.getDate());//오늘 날짜에서 시작
	start.setDate(start.getDate() - day);//setDate로 변경. 기존 날짜에서 getDate 한 후 요일값 만큼 빼주면 주간 캘린더 시작일 나옴
	console.log("왼쪽 start" + start);
	
	var end = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	end.setDate(end.getDate() + 6 - day);
	console.log("왼쪽 end" + end);
	
	//날짜 그리기
	$(".date .day").each(function(index, item){
		$(item).html(start.getDate());
		start.setDate(start.getDate() + 1);
	});
	/* ------------------------------------------------------------------------------------- */
	
	
	//공유 내용 그려주기
	for(var i = 0; i < selectMytaskShareList.length; i++){	
		//공유한 일자 Date로 변환
		var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
		console.log("1 공유일 : "+mytasksShareDate.getTime());
		console.log("2 시작일 : "+start.getTime());
		console.log("3 종료일 : "+end.getTime());
		console.log(end.getTime() - mytasksShareDate.getTime() );
		console.log( mytasksShareDate.getTime() - start.getTime() );
		//주간 캘린더 시작일보다 작거나 종료일보다 크면 건너뛰기
		if(end.getTime() - mytasksShareDate.getTime() >= 0 && mytasksShareDate.getTime() - start.getTime() >= 0){
			console.log("표시 하기");
		}else if(end.getTime() - mytasksShareDate.getTime() < 0 || mytasksShareDate.getTime() - start.getTime() < 0){
			console.log("표시안함");
		}else{
			console.log("오류");
		}
	}
	
	
	
	
});


//오른쪽으로 가기 아이콘 클릭시
$(document).on('click','#icon_double-right_chevron', function(){
	/* ------------------------------------------------------------------------------------- */
	//담아옴
	var today = new Date($("#today").val());
	//7일 더해줌
	today.setDate(today.getDate() + 7);
	//input hidden에 다시 저장
	$("#today").val(today)

	//캘린더 제목에 오늘날짜 다시 써주기
	var title = $('#today-box');
	title.html(today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + today.getDate() + "일");

	//주간 캘린더 시작일
	//일자가 m일이고 요일이 n인경우 주간 캘린더 일자 시작은 m-n, 종료일은 m+6-n
	var start = new Date(today.getFullYear(), today.getMonth(), today.getDate());//오늘 날짜에서 시작
	start.setDate(start.getDate() - day);//setDate로 변경. 기존 날짜에서 getDate 한 후 요일값 만큼 빼주면 주간 캘린더 시작일 나옴
	console.log("오른쪽 start" + start);
	
	var end = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	end.setDate(end.getDate() + 6 - day);
	console.log("오른쪽 end" + end);
	
	//날짜 그리기
	$(".date .day").each(function(index, item){
		$(item).html(start.getDate());
		start.setDate(start.getDate() + 1);
	});
	/* ------------------------------------------------------------------------------------- */

	
	
	//공유 내용 그려주기
	for(var i = 0; i < selectMytaskShareList.length; i++){	
		//공유한 일자 Date로 변환
		var mytasksShareDate = new Date(selectMytaskShareList[i].myTaskShare.mytasksShareDate);
		console.log("1 공유일 : "+mytasksShareDate.getTime());
		console.log("2 시작일 : "+start.getTime());
		console.log("3 종료일 : "+end.getTime());
		console.log(end.getTime() - mytasksShareDate.getTime() );
		console.log( mytasksShareDate.getTime() - start.getTime() );
		//주간 캘린더 시작일보다 작거나 종료일보다 크면 건너뛰기
		if(end.getTime() - mytasksShareDate.getTime() >= 0 && mytasksShareDate.getTime() - start.getTime() >= 0){
			console.log("표시 하기");
		}else if(end.getTime() - mytasksShareDate.getTime() < 0 || mytasksShareDate.getTime() - start.getTime() < 0){
			console.log("표시안함");
		}else{
			console.log("오류");
		}
	}
	
	
	
	
	
	
});


</script>



</html>