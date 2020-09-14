<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 현재 페이지 전체 css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userMyTasks/userStandupMeeting/userStandupMeeting.css">
    <!-- 소이모달용,버튼용CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/modal.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">
    
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

       <!-- content 영역 -->
       <div id="contentBox">
       		<!-- 헤더 -->
			<div id="content-box-header">
				<table id="content-box-header-table">
					<tr>
						<td></td>
						<td>
							<div id="search">
								<input class="input" type="text"/>
								<img id="icon_searchicon" src="/agile/resources/icon/common/icon_searchicon.png">
							</div>
						</td>
						<td onclick="updateRss();"><img id="icon_settings" src="/agile/resources/icon/common/icon_settings.png"></td>
						<td id="today-box-td">
							<div id="today-box-wrapper">
								<img id="icon_double_left_chevron" src="/agile/resources/icon/common/icon_double_left_chevron.png">
									<div id="today-box">2020년 8월 25일 (금)</div>
								<img id="icon_double-right_chevron" src="/agile/resources/icon/common/icon_double _right_chevron.png">
							</div>
						</td>
						<td id="rssBtn" onclick="closeRss();">열려라달력스!</td>
						<td id="rssBtn" onclick="openRss();"><img id="icon_rss_feed" src="/agile/resources/icon/common/icon_rss_feed.png">팀 rss 구독하기</td>
						<td width="30px;"></td>
					</tr>
				</table>
			</div>	
			<!-- -----------------------------------------rss 목록보기------------------------------------ -->
			<form action="updateRss.mt" method="post">
				<div id="selectRss" class="modal">
					<div class="modal-content-big rssSelectcontent">
						<p align="left" class="modaltitle">📳 우리 팀 RSS 목록</p>
						<table class="rssSelectModalTable" width="90%" align="center">
							<colgroup>
								<col width="20%"/>
								<col width="20%"/>
								<col width="*"/>
								<col width="15%"/>
							</colgroup>
								<tr align="center">
									<td><b>구독명칭</b></td>
									<td><b>RSS키워드</b></td>
									<td><b>URL</b></td>
									<td><b>RSS사이트명</b></td>
								</tr>
								<c:forEach var="i" begin="0" end="${fn:length(rssList)-1}">
						 			<tr class="rsslistout">
										<td><input type="text" class="updateInput" id="rssModifyNickname" name="rssModifyNickname" value="${rssList.get(0).rssModifyNickname}" autocomplete="off"></td>
										<td><input type="text" class="updateInput" id="rssModifyKeyword" name="rssModifyKeyword" value="${rssList.get(0).rssModifyKeyword}" ></td>
										<td><input type="text" class="updateInput" id="rssurlget" name="rssModifyUrl" value="${rssList.get(0).rssModifyUrl}" ></td>
										<td><input type="text" class="updateInput" id="rssModifySite" name="rssModifySite" value="${rssList.get(0).rssModifySite}" ></td>
										<td><input type="hidden" name="rssProjectCode" value="${rssList.get(0).rssProjectCode}" ></td>
									</tr> 
								</c:forEach>
						</table>
						<div class="modalButtonArea">
							<button class="rectangle6" type="submit">저장</button>
							<div class="rssSelectClose" id="rectangle7">취소</div>
						</div>
						<input type="hidden" name="userProjectCode" value=""> 
					</div>
				</div>
			</form>
			<!-- ----------------------------소이js-------------------------- -->
			<script type="text/javascript">
				//목록모달끄기
			    $(document).on('click', '.rssSelectClose', function(){
			    	$('#selectRss').css('display','none');
			    	
			    });
				
				
				//rss설정 모달열기
				function updateRss() {
			    	$('#selectRss').fadeIn(300); 
			    	$('#selectRss').css('display','block');
				}
				
				
				//rss로 바꾸기
			    function openRss() {
			    	$('#rssbox').css('display','block');
			    	$('#calender-box').css('display','none');
			    	
			    	var url = $('#rssurlget').val();
			    	
			    	$.ajax({
						url:"showRssContent.mt",
						type:"post",
						data: {url:url},
						dataType : "json",
						success: function(data){
							
							//하위요소 비우고시작
							$('#rssbox').children().remove();
							
							//rss컨텐츠들의 갯수가 50개 이상이면 50개까지만 보이고 아니면 다보이게
							var maxAmount;
							if(data.rssContent.length > 50){
								maxAmount = 50;
							}else{
								maxAmount = data.rssContent.length;
							}
							
							//반복해서 카드형태로 넣어줌
							for(var i = 0; i < maxAmount; i++){
								
								//제목 길면 자르기
								var maxTitle;
								if(data.rssContent[i].title.length > 18){
									maxTitle = data.rssContent[i].title.substring(0,18) + '...';
								}else{
									maxTitle = data.rssContent[i].title;
								}
							
								var rsslink = "'" +  data.rssContent[i].link + "'";
								$('#rssbox').append(
									'<table class="rssContent" onclick="window.open('+ rsslink + ')" style="table-layout: fixed"><tr>'
									+ '<td class="rssimg" rowspan="3"><img class="rssCountentImg" src="/agile/resources/images/logo/logo_stepup.png"></td><td class="rssauthor">'
									+ data.rssContent[i].author +'</td>'
									+ '<td class="rsstitle" nowrap>'+ maxTitle +'</td></tr><tr>'
									+ '<td class="rssdescription" colspan="2">'+ data.rssContent[i].description +'</td></tr><tr>'
									+ '<td class="rsspubdate" colspan="2">'+ data.rssContent[i].pubdate +'</td></tr></table>'
								);	
							}
							
						},
						error : function () {
							console.log('rss 못가져옴');
						},
						beforeSend : function(){
					        $('.wrap-loading').removeClass('display-none');
						},
						complete : function(){
						    $('.wrap-loading').addClass('display-none');
						}
					})
			    	
				}
				
				//열려라달력스
				function closeRss() {
			    	$('#calender-box').css('display','block');
			    	$('#rssbox').css('display','none');
			    	
				}
			</script>
			
			
       		<div id="calender-box">
       			<!-- 헤더 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-box-table">
       				<tr id="calender-box-table-tr-1">
       					<td id="category"><div class="space"></div></td>
       					<td class="mon"><div class="date">MON</div></td>
       					<td class="tue"><div class="date">TUE</div></td>
       					<td class="wed"><div class="date">WED</div></td>
       					<td class="thur"><div class="date">THUR</div></td>
       					<td class="fri"><div class="date">FRI</div></td>
       					<td class="sat"><div class="date">SAT</div></td>
       					<td class="sun"><div class="date">SUN</div></td>
       				</tr>
       				<tr id="calender-box-table-tr-2">
       					<td class="category"><div class="space"></div></td>
       					<td class="mon"><div class="day">24</div></td>
       					<td class="tue"><div class="day">25</div></td>
       					<td class="wed"><div class="day">26</div></td>
       					<td class="thur"><div class="day">27</div></td>
       					<td class="fri"><div class="day">28</div></td>
       					<td class="sat"><div class="day">29</div></td>
       					<td class="sun"><div class="day">30</div></td>
       				</tr>
       			</table>
       			<!-- 미진행 테이블 -------------------------------------------------------------------------------------------------------->
       			<table  id="calender-notInProgress-table">
       				<tr>
        				<td class="category"><div class="spaces">미진행</div></td>
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
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       			<!-- 완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-complete-table">
       				<tr>
        				<td class="category"><div class="spaces">진행완료</div></td>
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       				<tr>
        				<td class="category"><div class="spaces"></div></td>
       					<td class="mon"><div class="day">ss</div></td>
       					<td class="tue"><div class="day">ss</div></td>
       					<td class="wed"><div class="day">ss</div></td>
       					<td class="thur"><div class="day">ss</div></td>
       					<td class="fri"><div class="day">ss</div></td>
       					<td class="sat"><div class="day">ss</div></td>
       					<td class="sun"><div class="day"></div></td>      				
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
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       			
       			<!-- 미완료 테이블 -------------------------------------------------------------------------------------------------------->
       			<table id="calender-incomplete-table">
       				<tr>
        				<td class="category"><div class="spaces">미완료</div></td>
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
       					<td class="mon"><div class="day"></div></td>
       					<td class="tue"><div class="day"></div></td>
       					<td class="wed"><div class="day"></div></td>
       					<td class="thur"><div class="day"></div></td>
       					<td class="fri"><div class="day"></div></td>
       					<td class="sat"><div class="day"></div></td>
       					<td class="sun"><div class="day"></div></td>      				
       				</tr>
       			</table>
       		</div>
       		
       		
       		<!-- --------------------------바뀐창------------------------- -->
       		<div id="rssbox" style="display: none">
			<!-- ajax append구역 -->
       		</div>
	
			<div class="wrap-loading display-none">
		   		<div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
			</div>   
	       		
		</div>	
    </div>
    
   
</body>
</html>