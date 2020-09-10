<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/userProjectMain/userProjectMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<body>
	<body>
   <%@ include file="../../common/menubar.jsp" %>
            <div id="content">
                <div id="main-cont-area">
                   <div id="status-area">
                      <div id="not-task">
                         <div id="n-tk" class="status">${ nonTaskCnt }</div>
                         <p id="n-tk-ti" class="ing">미진행</p>
                      </div>
                      <div id="task-ing">
                         <div id="tk-ing" class="status">${ ingTaskCnt }</div>
                         <p id="tk-ing-ti" class="ing">진행중</p>
                      </div>
                      <div id="com-task">
                         <div id="co-tk" class="status">${ comTaskCnt } </div>
                         <p id="co-tk-ti" class="ing">진행완료</p>
                      </div>
                      <div id="tot-task">
                         <div id="to-tk" class="status">${ nonTaskCnt+ingTaskCnt+comTaskCnt } </div>
                         <p id="ti-tk-ti" class="ing">전체 업무</p>
                      </div>
                   </div>
                   <div id="pj-alm-area">
                      <div id="pro-cont-area">
                         <div id="pro-cont-title">
                            <p id="project">Project</p>
                         </div>
                         <div id="tb_wrap">
                         <div id="pro-cont">
                         
                         <c:forEach var="i" items="${ pjList }" varStatus="status">
                         <div id="pro-list">
                         	<table class="tb" style=" width:100%";>
                         		<tbody>
                         		
	                             <tr>
	                            	<td rowspan="2" style=" width:50px;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
	                            	<td rowspan="2" style=" width:170px;"><div name="projectName">${ i.projectName }</div></td>
	                            	<td style=" width:140px; background-color:#2B2B49; border-radius:7px; color:white;">진행중 테스크</td>
	                            	<td style=" width:30px; ">${ pjList2[status.index].taskCnt }</td>
	                            </tr>
	                            <tr>
	                            	<td style="width:140px; background-color:#C4C4C4; border-radius:7px;">미진행 테스크</td>
	                            	<td style=" width:30px;">${ i.taskCnt }</td>
	                            </tr>
	                            <tr>
	                            	<td colspan="3" style="">Status</td>
	                            	<c:if test="${ 0 ne i.taskCnt }">
	                            	<td style="text-align:right; width:30px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_ing2.png" width="70px;" height="20px;"></td>
	                            	</c:if>
	                            	<c:if test="${ 0 eq i.taskCnt and 0 eq pjList2[status.index].taskCnt }">
	                            	<td style="text-align:right; width:30px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_non2.png" width="70px;" height="20px;"></td>
	                            	</c:if>
	                            </tr>
	                            </tbody>
                            </table>
                            </div>
	                            </c:forEach>
                         </div>
                         </div>
                      </div>
                      <div id="alm-cont-area">
                         <div id="alm-cont-title">
                            <p id="alarm">Alarm</p>
                         </div>
                         <div id="tb_wrap">
	                         <div id="alm-cont">
	                         	<table class="alm-tb" style="cellpadding:30px; width:100%;">
	                         		<tr>
	                         			<th colspan="2" style="font-weight:100; text-align: left;">2020년 8월</th>
	                         			
	                         		</tr>
	                         		<tr>
	                         			<th colspan="2"></th>
	                         		</tr>
	                         		<tr>
	                         			<th colspan="2"></th>
	                         		</tr>
	                         		<tr>
	                         			<th colspan="2"></th>
	                         		</tr>
	                         		<tr>
	                         			<th colspan="2"></th>
	                         		</tr>
	                         		<tr>
	                         			<td style="border-bottom:1px solid #E8E8E8; font-weight:300; width:20%; text-align: center;">심다윤</td>
	                         			<td style="border-bottom:1px solid #E8E8E8; font-weight:300;">얼른 하고싶다..</td>
	                         		</tr>
	                         	</table>
	                         </div>
	                     </div>
                      </div>
                   </div>
                   <!-- 테스크와 차트 영역 시작 -->
                   <div id="task-cht-area">
                   		<!-- 테스크 영역 시작 -->
                      <div id="task-cont-area">
                         <div id="task-cont-title">
                            <p id="task">My tasks</p>
                         </div>
                         <div id="tb_wrap">
                         	<div id="task-cont">
                   		<c:forEach var="taskTitle" items="${ taskTitle }" varStatus="status">
                   			<div id="task-list">
                         		<table class="task-tb" width="100%">
                         			<tr style="height:30px;">
                         				<td style="width:800px;">${ taskTitle }</td>
                         				<c:if test="${ !empty taskDate[status.index] }">
                         				<td style="width:240px;"><img src="/agile/resources/icon/common/icon_clock.png" width="15px;" height="15px;">&nbsp;&nbsp;${ taskDate[status.index] }</td>
                         				</c:if>
                         				<c:if test="${ empty taskDate[status.index] }">
                         				<td style="width:240px;"><img src="/agile/resources/icon/common/icon_clock.png" width="15px;" height="15px;">&nbsp;&nbsp;예상시간 없음</td>
                         				</c:if>
                         			</tr>
                         			<tr>
                      
                         				<td style="width:800px;">Status</td>
                         				<c:if test="${ taskStatus[status.index] eq '진행중' }">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_ing2.png" width="70px;" height="20px;"></td>
                         				</c:if>
                         				<c:if test="${ taskStatus[status.index] eq '완료' }">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_com2.png" width="70px;" height="20px;"></td>
                         				</c:if>
                         				<c:if test="${ taskStatus[status.index] eq '미진행' }">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_non2.png" width="70px;" height="20px;"></td>
                         				</c:if>
                         				<c:if test="${ empty taskStatus[status.index] }">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_nonexist.png" width="75px;" height="20px;"></td>
                         				</c:if>
                         			</tr>
                         		</table>
                         		</div>
                         </c:forEach>
                         	</div>
                         </div>
                       </div>
                       <!-- 테스크 영역 끝 -->
                    	<!-- 차트 영역 시작 -->
                      <div id="cht-cont-area">
                         <div id="cht-cont-title">
                            <p id="chart">Chart</p>
                         </div>
                         <div id="cht-cont">
                            <div id="cht">
                               <div class="pie-chart1"><span class="center"><p id="to-ch">${ nonTaskCnt + ingTaskCnt + comTaskCnt }</p><p id="to-ch-ti">전체업무</p></span></div>
                                <div id="cht-st">
	                               <div id="no-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_non_task.png" width="10px;" height="10px;"> 미진행</div><span id="no-ch-to">${ nonTaskCnt }</span><br>
		                           <div id="ing-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_ing_task.png" width="10px;" height="10px;"> 진행중 </div><span id="ing-ch-to">${ ingTaskCnt }</span><br>
		                           <div id="com-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_com_task.png" width="10px;" height="10px;"> 완료</div><span id="com-ch-to">${ comTaskCnt }</span>
	                           </div>
                            </div>
                           <!--  <script src="https://www.amcharts.com/lib/4/core.js"></script>
							<script src="https://www.amcharts.com/lib/4/charts.js"></script>
							<div id="chartdiv"></div> -->
                         </div>
                      </div>
                      <!-- 차트 영역 끝 -->
                      </div>
                      <!-- 테스크와 차트 영역 끝 -->
                </div>
                <!-- 캘린더 영역 시작 -->
                <div id="calendar-area">
                   <div id="cal-area"> 
                      <div id="cal-cont">
                        
                      </div>
                   </div>
             	</div>
             	<!-- 캘린더 영역 끝 -->
             	</div>
</body>
</body>
<script>
	/* 이번주 일주일 구하기 */
	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = Number(currentDay.getMonth() + 1);
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();
	
	console.log("currentDay" + currentDay);
	console.log("theYear " + theYear);
	console.log("theMonth" + theMonth);
	console.log("theDate" + theDate);
	console.log("theDayOfWeek" + theDayOfWeek);
	
	var thisWeek = [];
	for(var i=0; i<7; i++) {
	  var resultDay = new Date(theYear, theMonth, theDate + i);
	  var yyyy = resultDay.getFullYear();
	  var mm = resultDay.getMonth();
	  var dd = resultDay.getDate();
	 
	  console.log("result day : " + resultDay);
	  console.log("yyyy" + yyyy);
	  console.log("mm : " + mm);
	  console.log("dd" + dd);
	  
	  mm = String(mm).length === 1 ? '0' + mm : mm;
	  dd = String(dd).length === 1 ? '0' + dd : dd;
	 
	  console.log("연산자 mm : " + mm);
	  console.log("연산자 mm : " + dd);
	  
	  thisWeek[i] = dd;
	  //thisWeek[i] = yyyy + '-' + mm + '-' + dd;
	}
	console.log("thisweek" + thisWeek);
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
		date = getFormatDate(date);
		console.log("포맷팅된 날짜 : " + date);
		
		var year;
		year = date.substring(0,4);
		console.log("올해 : " + year);
		
		var day;
		day = date.substring(6, 8);
		console.log("오늘 몇일 : " + day);
		
		var today;
		today = date.substring(10, 8);
		console.log("오늘 요일 : " + today);

		var mon;
		mon = date.substring(6, 4);
		
		var mon2;
		
		if(mon == '01'){
			mon2 = 'Jan';
			console.log(mon);
		} else if(mon == '02'){
			mon2 = 'Feb';
			console.log(mon);
		} else if(mon == '03'){
			mon2 = 'Mar';
			console.log(mon);
		} else if(mon == '04'){
			mon2 = 'Apr';
			console.log(mon);
		} else if(mon == '05'){
			mon2 = 'May';
			console.log(mon);
		} else if(mon == '06'){
			mon2 = 'Jun';
			console.log(mon);
		} else if(mon == '07'){
			mon2 = 'Jul';
			console.log(mon);
		} else if(mon == '08'){
			mon2 = 'Aug';
			console.log(mon);
		} else if(mon == '09'){
			mon2 = 'Sep';
			console.log(mon);
		} else if(mon == '10'){
			mon2 = 'Oct';
			console.log(mon);
		} else if(mon == '11'){
			mon2 = 'Nov';
			console.log(mon);
		} else if(mon == '12'){
			mon2 = 'Dec';
			console.log(mon);
		}
		
		drawCalendar(year, today, mon, mon2, day);
		
		
	});
	
	function drawCalendar(year, today, mon, mon2, day){
		var myTasksDate =[];
		var myTasksContent =[];
		
		var myTaskMonth = [];		
		var myTaskday = [];
		
		$.ajax({
			url: "selectMyTasks.me",
			dataType: "json",
			type:"post",
			success: function(data){
				var myTasksArr = data.myTasks;
				console.log(data.myTasks);
				
				var Cnt = 0;
				
			    var searchTitle = $.each(myTasksArr, function(index, value){
						myTasksContent += value.myTaskscontents;
						Cnt++;
						if(Cnt != index){
							myTasksContent += ",";
						}
						
						myTasksDate += value.myTasksstartDate;
						if(Cnt != index){
							myTasksDate += ",";
						}
						/* myTaskMonth += myTasksDate.substring(5, 7);
						myTaskMonth += ",";
						myTaskday += myTasksDate.substring(8, 11);
						myTaskday += ","; */
					
				});
				console.log(myTaskMonth);
				console.log(myTaskday);
				
				  
				
				
				
				var setTableHTML = "";
				var num = String(today);
				
			    setTableHTML+='<table width="100%;">';
			    setTableHTML+='<thead>';
			    setTableHTML+='<tr><th class="th-title" style="font-size: 27px;" colspan="2">Calendar</th>';
			    setTableHTML+='<tr><td colspan="2" style="text-align:center;">' + day + ", " + mon2 + '</td></tr>';
			    setTableHTML+='</thead>';
			    setTableHTML+='<tbody style="padding: 20px;">';
			    
			    for(var i=0;i<7;i++){
			        setTableHTML+='<tr style="font-size: 12px;">';
			        setTableHTML+='<td width="60px" height="100px">';
			        setTableHTML+= '<div id="cal-day'+ j + '" style="display:inline-block;">' + thisWeek[i] + '</div>';
			        setTableHTML+='<br>';
				     	
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
			        setTableHTML+= "<td class='cal-schedule' style='width:200px height:100px' id='mytasks-sche'>";
			        setTableHTML+= "<div class='cal-schedule'>";
			        
			        setTableHTML+='</div>';
			        setTableHTML+='</td>';
			        setTableHTML+='</td>';
			        setTableHTML+='</td>';
			        setTableHTML+='</tr>';
			        
			    }
			    setTableHTML+='</tbody>';
			    setTableHTML+='</table>';
			    
			    $("#cal-cont").html(setTableHTML);
				
			    $tdSche = $("td div.cal-schedule");
			    //firstDay = new Date(year,mon-1,1);
		        //lastDay = new Date(year,mon,0);
			    var temp;
						//for(var j=0; j<7; j++){
				for(var i=0; i<data.myTasks.length; i++){
					
					if(data.myTasks[i].myTasksShareYN != temp){
						
						var startDateArr = data.myTasks[i].myTasksstartDate.split('-');
						var startYear = startDateArr[0];
						var startMonth = startDateArr[1];
						var startDate = startDateArr[2];
						
						console.log(startYear);
						console.log(startMonth);
						console.log(startDate);
						
						//시작일자 캘린더에 넣어주기
						//console.log($('#cal-day'+j).text());
							if($('#cal-day').html() == startDate){
							    var myTaskscontents = ('<li>' + data.myTasks[i].myTaskscontents + '</li>');
							    
								console.log(myTaskscontents);
								$tdSche.append(myTaskscontents);
							}
						 
						}
					//}
					
				}
			    
			    
			},error: function(){
				
			}
			});
		
		
	}
	
	
	
	//차트
    var non=$("#n-tk").text();
    var ing=$("#tk-ing").text();
    var com=$("#co-tk").text();
    var tot=$("#to-tk").text();

    var non2 = Math.round((non/tot)*100);
    var ing2 = Math.round((ing/tot)*100);
    var com2 = Math.round((com/tot)*100);
	
	$(window).ready(function(){
    
    
  /*   var max = 0;
	var mid = 0;
	var min = 0;
	
	  max = (num1>num2)&&(num1>num3)?num1:(num3>num2?num3:num2);
      //num1이 num2보다 큰지 비교,num1이 num3보다 큰지 비교 둘 다 참이면 num1이 가장크다. 
      min = (num2>num1)&&(num3>num1)?num1:(num2>num3?num3:num2);
      //num2이 num1보다 큰지 비교,num3이 num1보다 큰지 비교해서 num1이 제일 작으면 저장 아니면 뒤의 수식 수행
      mid = (num1>num2)?((num1>num3)?((num2>num3)?num2:num3):num1):((num2>num3)?((num1>num3)?num1:num3):num2);
	
      console.log(max);
      console.log(mid);
      console.log(min); */
    
    var func1 = setInterval(function(){
	    	color1(non2);
	 		color2(ing2);
	 		color3(com2);
		},10);
    
	});

	
	function color1(non2){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#C4C4C4 0% "+0+"%, #ffffff "+non2+"% 100%)"
	        });
	    
	}
	function color2(ing2){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#C4C4C4 0% 25%, #DD0351 25% "+non2+"%, #ffffff "+ing2+"% 100%)"
	        });
	     
	}
	function color3(com2){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#C4C4C4 0% 25%, #DD0351 25% 70%, #2B2B49 70% "+non2+ing2+"%, #ffffff "+com2+"% 100%)"
	        });
	     
	}
	
</script>
</html>