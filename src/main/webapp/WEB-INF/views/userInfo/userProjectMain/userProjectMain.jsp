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
                			<div id="n-tk" class="status">2 </div>
                			<p id="n-tk-ti" class="ing">미진행</p>
                		</div>
                		<div id="task-ing">
                			<div id="tk-ing" class="status">8 </div>
                			<p id="tk-ing-ti" class="ing">진행중</p>
                		</div>
                		<div id="com-task">
                			<div id="co-tk" class="status">1 </div>
                			<p id="co-tk-ti" class="ing">진행완료</p>
                		</div>
                		<div id="tot-task">
                			<div id="to-tk" class="status">11 </div>
                			<p id="ti-tk-ti" class="ing">전체 업무</p>
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
                	<div id="cal-cont">
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
		
		/* if(today == '0') {
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
		} */
		
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
		
		drawCalendar(today, mon, day);
		
		
	});
	
	function drawCalendar(today, mon, day){
		var setTableHTML = "";
	    setTableHTML+='<table style="width:100%;">';
	    setTableHTML+='<thead">';
	    setTableHTML+='<tr><th class="th-title" style="font-size: 27px;">Calendar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
	    +'<img src="/agile/resources/icon/common/icon_gear.png" width="20px;" height="20px;""></th>';
	    setTableHTML+='<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + day + ", " + mon + '</td></tr>';
	    setTableHTML+='<tbody style="padding: 20px;">';
	    
	    for(var i=0;i<7;i++){
	        setTableHTML+='<tr style="border: 1px solid #F6F6F6; font-size: 12px;">';
	        setTableHTML+='<td style="height:30px;">';
	        setTableHTML+='';
	        setTableHTML+='<br>';
	        
		        var num = String(today);
		     	
		        if(today == 0) {
		        	num = 'Sun';
				} else if(today == 1){
					num = 'Mon';
				} else if(today == 2){
					num = 'Tue';
				} else if(today == 3){
					num = 'Wed';
				} else if(today == 4){
					num = 'Tur';
				} else if(today == 5){
					num = 'Fri';
				} else if(today == 6){
					num = 'Sat';
				}
		        
		        today++;
		     	if(today >= 7){
		     		today = 0;
		     	}
		        
		        
	        setTableHTML+= num;
	        
	     	
	        setTableHTML+= "</td>";
	        setTableHTML+='</tr>';
	        
	    }
	    setTableHTML+='</tbody>';
	    setTableHTML+='</thead>';
	    setTableHTML+='</table>';
	    
	    $("#cal-cont").html(setTableHTML);
	}

</script>
</html>