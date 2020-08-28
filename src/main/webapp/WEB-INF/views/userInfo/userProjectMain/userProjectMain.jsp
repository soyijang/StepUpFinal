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
                   <c:forEach var="list" items="${ taskIngList }" varStatus="status">
                      <div id="not-task">
                         <div id="n-tk" class="status">${ taskNonList[status.index].taskHistValue }</div>
                         <p id="n-tk-ti" class="ing">미진행</p>
                      </div>
                      <div id="task-ing">
                         <div id="tk-ing" class="status">${ list.taskHistValue }</div>
                         <p id="tk-ing-ti" class="ing">진행중</p>
                      </div>
                      <div id="com-task">
                         <div id="co-tk" class="status">${ taskComList[status.index].taskHistValue } </div>
                         <p id="co-tk-ti" class="ing">진행완료</p>
                      </div>
                      <div id="tot-task">
                         <div id="to-tk" class="status">${ taskSumList[status.index].taskHistValue } </div>
                         <p id="ti-tk-ti" class="ing">전체 업무</p>
                      </div>
                      </c:forEach>
                   </div>
                   <div id="pj-alm-area">
                      <div id="pro-cont-area">
                         <div id="pro-cont-title">
                            <p id="project">Project</p>
                         </div>
                         <div id="tb_wrap">
                         <div id="pro-cont">
                         
                         <c:forEach var="i" items="${ pjList }">
                         <div id="pro-list">
                         	<table class="tb" style=" width:100%";>
                         		<tbody>
                         		
	                             <tr>
	                            	<td rowspan="2" style=" width:50px;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
	                            	<td rowspan="2" style=" width:170px;"><div name="projectName">${ i.projectName }</div></td>
	                            	<td style=" width:110px;">진행중 이슈</td>
	                            	<td style=" width:30px;">3</td>
	                            </tr>
	                            <tr>
	                            	<td style="width:110px;">미해결 이슈</td>
	                            	<td style=" width:30px;">2</td>
	                            </tr>
	                            <tr>
	                            	<td colspan="3" style="">status</td>
	                            	<td style="text-align:right; width:50px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_ing.png" width="70px;" height="20px;"></td>
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
                         		<c:forEach var="taskTitleList" items="${ taskTitleList }" varStatus="status">
                         		<div id="task-list">
                         		<table class="task-tb" width="100%">
                         			<tr style="height:30px;">
                         				<td style="width:800px;">${ taskTitleList.taskHistValue }</td>
                         				<td style="width:240px;"><img src="/agile/resources/icon/common/icon_clock.png" width="15px;" height="15px;">&nbsp;&nbsp;${ taskDateList[status.index].taskHistValue }</td>
                         			</tr>
                         			<tr>
                         				<td style="width:800px;">Status</td>
                         				<c:if test="${ taskStatusList[status.index].taskHistValue eq '진행중'}">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_ing.png" width="70px;" height="20px;"></td>
                         				</c:if>
                         				<c:if test="${ taskStatusList[status.index].taskHistValue eq '완료'}">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_com.png" width="70px;" height="20px;"></td>
                         				</c:if>
                         				<c:if test="${ taskStatusList[status.index].taskHistValue eq '미진행'}">
                         				<td style="width:240px;"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_status_non.png" width="70px;" height="20px;"></td>
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
                                <c:forEach var="list" items="${ taskIngList }" varStatus="status">
                               <div class="pie-chart1"><span class="center"><p id="to-ch">${ taskSumList[status.index].taskHistValue }</p><p id="to-ch-ti">전체업무</p></span></div>
                                <div id="cht-st" style="width:50%">
	                               <div id="no-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_over_task.png" width="10px;" height="10px;"> 미진행</div><span id="no-ch-to">${ taskNonList[status.index].taskHistValue }</span><br>
		                           <div id="ing-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_ing_task.png" width="10px;" height="10px;"> 진행중 </div><span id="ing-ch-to">${ list.taskHistValue }</span><br>
		                           <div id="com-ch" class="cht-tt"><img src="/agile/resources/images/indiv/main/userInfo/userProjectMain/img_com_task.png" width="10px;" height="10px;"> 완료</div><span id="com-ch-to">${ taskComList[status.index].taskHistValue }</span>
	                           </div>
	                           </c:forEach>
                            </div>
                           
	                           
                            
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
	<!-- 캘린더 -->
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
		var num = String(today);
		
	    setTableHTML+='<table width="100%;">';
	    setTableHTML+='<thead>';
	    setTableHTML+='<tr><th class="th-title" style="font-size: 27px;">Calendar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>';
	    setTableHTML+='<th><img src="/agile/resources/icon/common/icon_gear.png" width="20px;" height="20px;""></th>';
	    setTableHTML+='<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + day + ", " + mon + '</td>';
	    setTableHTML+='<td></td></tr>';
	    setTableHTML+='</thead>';
	    setTableHTML+='<tbody style="padding: 20px;">';
	    
	    for(var i=0;i<7;i++){
	        setTableHTML+='<tr style="font-size: 12px;">';
	        setTableHTML+='<td width="10"  height="100">';
	        setTableHTML+='';
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
	        setTableHTML+= "<td width='200' height='100'><div class='cal-schedule' style='width:10%'></div></td>";
	        setTableHTML+='</tr>';
	        
	    }
	    setTableHTML+='</tbody>';
	    setTableHTML+='</table>';
	    
	    $("#cal-cont").html(setTableHTML);
	}
	
	var $tdSche = null;
	
	//스케줄표시
    function drawSche() {
    	$tdSche = $("td div.cal-schedule");
		
		
    	$tdSche.eq(3).text("🤴🏻오늘 뷰 다 끝날수있나?");
    	$tdSche.eq(today.getDate()+firstDay.getDay()).text("🎃금요일인데 아직 뷰 못끝냈겠찌?");
    	$tdSche.eq(today.getDate()).css("color", "black");
    	
	}
	
	
	//차트
	$(window).ready(function(){
    var i=1;
    var non=$("#no-ch-to").text();
    console.log(non);
    var ing=$("#ing-ch-to").text();
    console.log(ing);
    var com=$("#com-ch-to").text();
    console.log(com);
    var tot=$("#to-ch").text();
    console.log(tot);
    
    var non2 = non/tot*100;
    var ing2 = ing/tot*100;
    var com2 = com/tot*100;
    
    
    
    console.log(Math.ceil(non2));
    console.log(Math.ceil(ing2));
    console.log(Math.ceil(com2));
  /*   (Math.ceil(ing2)) = ing/tot*100;
    (Math.ceil(non2)) = non/tot*100;
    (Math.ceil(com2)) = tot/tot*100; */
    
    var func1 = setInterval(function(){
        if(i<Math.ceil(non2)){
            color1(i);
            i++;
        } else if(i<Math.ceil(non2) + Math.ceil(ing2)){
            color2(i);
            i++;
        } else if(i<Math.ceil(non2) + Math.ceil(ing2) + Math.ceil(com2)){
            color3(i);
            i++;
        } else {
            clearInterval(func1);
        }
		},10);
	});

	function color1(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#F04758 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    
	}
	function color2(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#F04758 0% 25%, #81DBCA 25% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color3(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#F04758 0% 25%, #81DBCA 25% 70%, #63B2E3 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
</script>
</html>