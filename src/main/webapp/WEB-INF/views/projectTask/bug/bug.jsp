<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/bug/summernote-lite.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/bug/bug.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/dropdown.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/issueType.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">

</head>
<body>
 <%@ include file="../../common/menubar.jsp" %>
    <div id="content" class="click-area" style="width:83vw;">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2"><a href="showProjectMain.pj">🚀내 프로젝트 </a> / ${sessionScope.projectName}</div>
            <div id="menuTitle">Issues</div>
        </div>
        <div id="contentBox">
			<div id="bug-list-area">
			<div id="bug-search"><input type="text" id="searchBug" onkeyup="searchBug();"size="10"></div>
			<div id="user-search">
            		<div class="dropdown">
				        <div class="select">
				              <span id="task-level-filter">테스크 레벨</span>
				          <i class="fa fa-chevron-left"></i>
				        </div>
				        <ul class="dropdown-menu">
				          <li id="all">전체</li>
				          <li id="tk-level">상위</li>
				          <li id="tk-sublevel">서브</li>
				        </ul>
				      </div>
            	</div>
				<div id="tb_wrap">
				<div id="bug-list">
					<p id="bug-title">Tasks</p>
					<div id="bug-list-wrap">
					<c:forEach var="i" items="${ bgList }" varStatus="status">
					<div class="bug-list-detail">
						<div id="bug-ti-list" class="bug-ti-list">${ i.taskHistValue }</div>
						<input type="hidden" value="${ i.sprint.sprintCode }" id="sprint-code">
						<div id="bug-con-list">
							<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ${ i.taskCode }</div><div id="user-pro-lit" class="bug-con-list-area">${fn:substring(i.member.userName, fn:length(i.member.userName)-2, fn:length(i.member.userName))}</div>
						</div>
					</div>
					</c:forEach>
					</div>
				</div>
				</div>
			</div>
			<div id="bug-detail-area">
				<div id="bug-detail">
					<div id="bg-num">
						<!-- <div id="bugicon" style="margin-left: 30px; margin-top:25px;"></div>&nbsp;&nbsp; -->
					</div>
					<div id="bg-detail-title">
						<table width="100%" id="bg-tb-title">
						<tbody id="bg-tbody">
							<tr>
								<td id="bgtitle-td"><div id="bug-issue-title"></div></td>
								<td style="text-align:right;"><!-- <img src="/agile/resources/images/profile/dayoon_202008152056.png"> --></td>
								<td>
									<div class="dropdown2-area">
									<div class="dropdown2">
								        <div class="select2">
								              <button class="clone-delete-btn" id="clone-deleteBtn"><img src="/agile/resources/icon/common/icon_more%20horizontalicon.png" width="20px;" height="20px;"></button>
								          <i class="fa fa-chevron-left"></i>
								        </div>
								        <ul class="dropdown-menu2">
								          <li id="clone-bug">복제</li>
								          <li id="delete-bug">삭제</li>
								        </ul>
								      </div>
								      </div>
								</td>
							</tr>
							<tr>
								<td><div id="add-link-area"><div id="bug-status"></div></div></td>
								<td colspan="2"></td>
							</tr>
							</tbody>
						</table>
					</div>
					<div id="bg-detail">
						<!-- <div id="detail-ex">설명</div> -->
						<div id="detail-cont"></div>
					</div>
					<div id="re-show-area-wrap">
					<div id="re-show-area">
						<!-- <div id="re-show-pro"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div> -->
						<div id="re-show-cont">
							<div id="re-name-date-area">
								<div id="re-name"></div>
								<div id="re-date"></div>
							</div>
							<div id="re-show-cont-area"></div>
						</div>
					</div>
					</div>
					<div id="bg-reply" class="bg-reply">
						<div id="re-pro"></div>
						<div id="bg-re-cont">
						<div class="re-ed-area" style="display: none;" id="re-ed-show">
					<input id="reply-input" type="text" placeholder="댓글 추가..">
					<div id="reply-add-area" style="display: none;">
					  <textarea id="summernote" name="editordata"></textarea>
					</div>
					 
                		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/projectTask/bug/summernote-lite.js"></script>
                		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/projectTask/bug/summernote/lang/summernote-ko-KR.js"></script>
						<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/indiv/projectTask/bug/summernote/lang/summernote-ko-KR.min.js"></script>
                		<script>
                		 $(document).ready(function() {
                				//여기 아래 부분
                				$('#summernote').summernote({
                					  height: 100,                 // 에디터 높이
                					  minHeight: null,             // 최소 높이
                					  maxHeight: null,             // 최대 높이
                					  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                					  lang: "ko-KR",					// 한글 설정
                					  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
                			          
                				});
                			});
                		 
                		 
                		</script>
					 	<button id="reply-add-btn" style="display: none;">SAVE</button>
					 	<button id="reply-cancel-btn" style="display: none;">CANCEL</button>
					 </div>
						</div>
						</div>
					</div>
					
					
					
					
				</div>
			</div>
		</div>
      <div class="wrap-loading display-none">
         <div><img src="/agile/resources/icon/common/icon_loading.gif"/></div>
   </div>    
</body>
<script>
	//담당자 드롭다운
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
	
	//복제, 삭제 버튼
	$('.dropdown2').click(function() {
		$(this).attr('tabindex', 1).focus();
		$(this).toggleClass('active');
		$(this).find('.dropdown-menu2').slideToggle(300);
	});
	
	$('.dropdown2').focusout(function() {
		$(this).removeClass('active');
		$(this).find('.dropdown-menu2').slideUp(300);
	});
	
	$('.dropdown2 .dropdown-menu2 li').click(
		function() {
			$(this).parents('.dropdown2').find('span').text($(this).text());
			$(this).parents('.dropdown2').find('input').attr('value',$(this).attr('id'));
	});
	
	$('.dropdown-menu2 li').click(function() {
			var input = '<strong>' + $(this).parents('.dropdown2').find('input').val() + '</strong>', msg = '<span class="msg">Hidden input value: ';
			$('.msg').html(msg + input + '</span>');
	});
	
	
	//댓글 input 박스 누르면 에디터 활성화
	 $("#reply-input").click(function(){
		$("#reply-add-area").show();
		$(this).hide();
		$("#reply-add-btn").show();
		$("#reply-cancel-btn").show();
		return false;
	}); 
	
	//버그 리스트 중 하나 누르면 테스크 제목 가져오기
	var a;
	var bugtitle;
	var bugcode;
	var bcode;
	var bugYN;
	var bugStatus;
	var sprintCode = "";
	var taskLevel = "";
	var tLevel;
	var taskMaster;
	var headCode;
	var bugUserName = "";
	var bcode2 = "";
	
	$(document).on("click",".bug-list-detail",function(){
			a = $(this).text();
			
			var str = a.replace(/(\s*)/g, "");
			
			var start = str.indexOf(":");
			console.log(start);
			var end = str.indexOf("B", 0);
			console.log(end);
			bugcode = str.substr(end);
			console.log(bugcode);
			
			bugUserName = bugcode.slice(0,-2);
			console.log("dd : " + bugUserName);
			
			bugtitle = str.substring(start+1, end);
			console.log(bugtitle);
			
			bcode2 = bugUserName.split("-");
			console.log(bcode2);
			bcode2 = bcode2[1];
			
		});

	//첫 화면 올때 첫번째 버그의 제목, 스프린트 버그, 테스크 코드, 버그 설명 등 가져오기
	window.onload = function(){
		var a = $("#bug-code-list1").text();
		console.log(a);
		var bugCodeId3 = a.split("-");
		
		var realBugCode = bugCodeId3[1];
		console.log("아이디4 : " + realBugCode);
		realBugCode = realBugCode.trim();
			
		var b = $("#bug-ti-list").text();
		var realBugName = b;
		
		
		
		$.ajax({
			url:"selectBugCont.tk",
			type:"post",
			data:{"tCode" : realBugCode},
			dataType : "json",
			success: function(data){
				
				if(data.bgContList.length != 0){

				values = data.bgContList;
				var sCode = [];
				console.log(data.bgContList);
				 var bgList = $.each(values, function(index, value){
					 if(value.taskCategoryCode == "H"){
						if(value.taskHistValue != ""){
							bugCont = value.taskHistValue;
							console.log("bugCont1 : " + value.taskHistValue);
						}
					} else if(value.taskCategoryCode == "J"){
						bugTitle = value.taskHistValue;
					} else if(value.taskCategoryCode == "G"){
						bugYN = value.taskHistValue;
					} else if(value.taskCategoryCode == "I"){
						bugStatus = value.taskHistValue;
					}
					  sCode = value.sprint;
					  taskLevel = value.taskList;
					  
					  uName = value.member;
					  
					});
				 
				 var replyArr = data.replyHistory;
	      	      var thumbnail = [];
	      	      var replyuserName = [];
	      	      var updateDate = [];
	      	      var replyCont = [];
	      	      var cnt = 0;
	      	      
	      	      console.log("버그 설명 : " +bugCont);
	      	      console.log("버그 설명 : " +bugCont);
	      	      
				 if(replyArr != null){
	      	      var replyList = $.each(replyArr, function(index, value){
	      	    	      cnt++;
		        		  //thumbnail += (data.replyHistory.attachment.thumbnailPath);
		        		  //if(cnt != index){
		        		  //  thumbnail += ", ";
		        		  //}
		        		  replyuserName += (value.member.userName);
		        		  if(cnt != index){
		        			  replyuserName += ", ";
		        		  }
		        		  updateDate += (value.replyUpdateDate);
		        		  if(cnt != index){
		        			  updateDate += ", ";
		        		  }
		        		  replyCont += (value.replyContents);
		        		  if(cnt != index){
		        			  replyCont += ", ";
		        		  }
		        	  });
				 }
				 	console.log(replyList);
	      	      	
				 	console.log("버그 진행 : " + bugStatus);
				 	
				 	tLevel = taskLevel.taskLevel;
				 	taskMaster = taskLevel.taskMaster;
				 	headCode = taskLevel.headTaskCode;
				 	console.log("테스크레벨 : " + tLevel);
				 	console.log("테스크마스터 : " + taskMaster);
				 	console.log("헤드테스크코드 : " + headCode);
				 	
				 	sprintCode = sCode.sprintCode;
					console.log(sprintCode);
					
				 var div3 = "";
				 
				 if(bugCont == ""){
					 bugCont = "설명을 입력하세요";
					
				 } 
				 
				 div3 += '<div id="detail-ex">설명</div><div id="detail-cont">' + bugCont + '</div>';
				 $("#bg-detail").html(div3);
				 
				 
				 var div10 = "";
				 
				 div10 += realBugName + '</div>';
				 $("#bug-issue-title").html(div10);
				 
				 
				 
				var div4 = "";
				if(bugStatus == "완료"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_com_status.png" width="70px;" height="20px;"></div>';
				} else if(bugStatus == "미진행"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_non_status.png" width="70px;" height="20px;"></div>';
				} else if(bugStatus == "진행중"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_ing_status.png" width="70px;" height="20px;"></div>';
				}
				$("#bug-status").html(div4);	
				 
				var div = "";
				div += '<div id="epicicon" style="margin-left:30px; margin-top:25px; display:inline-block;"></div> SPRINT - ' + sprintCode + ' /' + '<div id="bugicon" style="margin-left: 10px; margin-top:25px;">&nbsp;&nbsp;</div> BUG - ' + realBugCode;
				$("#bg-num").html(div);
				
				
				$("#re-ed-show").show();
				
				
				if(replyArr.length > 0){
      	        var replyuserNameArr = replyuserName.split(",");
				var updateDateArr = updateDate.split(",");
				var replyContArr = replyCont.split(",");
				
				$("div#re-show-area").remove();
				  for(var i = 0; i < replyuserNameArr.length-1; i++){
					$("#re-show-area-wrap").append('<div id="re-show-area">'
					+ '<div id="re-show-pro">' + replyuserNameArr[i].slice(-2) + '</div><div id="re-show-cont">'	 
					+ '<div id="re-name-date-area"><div id="re-name">' + replyuserNameArr[i]
					+  '</div><div id="re-date">' + updateDateArr[i] + '</div></div> <div id="re-show-cont-area">'
					+ replyContArr[i] + '</div></div></div>'
					 );
				} 
			} else {
				$("div#re-show-area").remove();
			}
				}else{
					var temp = '<img src="/agile/resources/images/indiv/main/mainpage/img_timeline3.jpg" style="width:500px; height:350px; margin-left:130px; margin-top:100px;">';
					 $("#bg-detail").html(temp);
					
				}
			}, error: function(data){
			},
			 beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
             complete : function(){
                   $('.wrap-loading').addClass('display-none');
            }
		})
	};
	
	
	//버그리스트 누르면 상세 영역에 버그제목하고 코드가져오기
	$(document).on("click", ".bug-list-detail", function(){
		var showBtn = $("#clone-deleteBtn").show();  
		
		var showReply = $("#re-ed-show").show();
		
		var div2 = "";
		div2 += '<div id="bug-issue-title">' + bugtitle + '</div>';
		$("#bgtitle-td").html(div2);
		
		bcode = bugcode.substring(4, 7);
		var bugCont = "";
		var values = [];
		
		$.ajax({
			url:"selectBugCont.tk",
			type:"post",
			data:{"tCode" : bcode2},
			dataType : "json",
			success: function(data){
				
				
				values = data.bgContList;
				var sCode = [];
				console.log(data.bgContList);
				 var bgList = $.each(values, function(index, value){
					 if(value.taskCategoryCode == "H"){
						if(value.taskHistValue != ""){
							bugCont = value.taskHistValue;
							console.log("bugCont1 : " + value.taskHistValue);
						}
					} else if(value.taskCategoryCode == "J"){
						bugTitle = value.taskHistValue;
					} else if(value.taskCategoryCode == "G"){
						bugYN = value.taskHistValue;
					} else if(value.taskCategoryCode == "I"){
						bugStatus = value.taskHistValue;
					}
					  sCode = value.sprint;
					  taskLevel = value.taskList;
					  
					  uName = value.member;
					  
					});
				 
				 var replyArr = data.replyHistory;
	      	      var thumbnail = [];
	      	      var replyuserName = [];
	      	      var updateDate = [];
	      	      var replyCont = [];
	      	      var cnt = 0;
	      	
	      	      
				 if(replyArr != null){
	      	      var replyList = $.each(replyArr, function(index, value){
	      	    	      cnt++;
		        		  //thumbnail += (data.replyHistory.attachment.thumbnailPath);
		        		  //if(cnt != index){
		        		  //  thumbnail += ", ";
		        		  //}
		        		  replyuserName += (value.member.userName);
		        		  if(cnt != index){
		        			  replyuserName += ", ";
		        		  }
		        		  updateDate += (value.replyUpdateDate);
		        		  if(cnt != index){
		        			  updateDate += ", ";
		        		  }
		        		  replyCont += (value.replyContents);
		        		  if(cnt != index){
		        			  replyCont += ", ";
		        		  }
		        	  });
				 }
				 	console.log(replyList);
	      	      	
				 	console.log("버그 진행 : " + bugStatus);
				 	
				 	tLevel = taskLevel.taskLevel;
				 	taskMaster = taskLevel.taskMaster;
				 	headCode = taskLevel.headTaskCode;
				 	console.log("테스크레벨 : " + tLevel);
				 	console.log("테스크마스터 : " + taskMaster);
				 	console.log("헤드테스크코드 : " + headCode);
				 	
				 	sprintCode = sCode.sprintCode;
					console.log(sprintCode);
					
				 var div3 = "";
				 
				 if(bugCont == ""){
					 bugCont = "설명을 입력하세요";
				 } 
				 
				 div3 += bugCont + '</div>';
				 $("#detail-cont").html(div3);
				 
				var div4 = "";
				if(bugStatus == "완료"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_com_status.png" width="70px;" height="20px;"></div>';
				} else if(bugStatus == "미진행"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_non_status.png" width="70px;" height="20px;"></div>';
				} else if(bugStatus == "진행중"){
					div4 += '<img src="/agile/resources/images/indiv/main/projectTask/bug/img_bug_ing_status.png" width="70px;" height="20px;"></div>';
				}
				$("#bug-status").html(div4);	
				 
				var div = "";
				div += '<div id="epicicon" style="margin-left:30px; margin-top:25px; display:inline-block;"></div> SPRINT-' + sprintCode + ' /' + '<div id="bugicon" style="margin-left: 10px; margin-top:25px;">&nbsp;&nbsp;</div> ' + bugUserName;
				$("#bg-num").html(div);
				
				
				
				if(replyArr.length > 0){
      	        var replyuserNameArr = replyuserName.split(",");
				var updateDateArr = updateDate.split(",");
				var replyContArr = replyCont.split(",");
				
				$("div#re-show-area").remove();
				  for(var i = 0; i < replyuserNameArr.length-1; i++){
					$("#re-show-area-wrap").append('<div id="re-show-area">'
					+ '<div id="re-show-pro">' + replyuserNameArr[i].slice(-2) + '</div><div id="re-show-cont">'	 
					+ '<div id="re-name-date-area"><div id="re-name">' + replyuserNameArr[i]
					+  '</div><div id="re-date">' + updateDateArr[i] + '</div></div> <div id="re-show-cont-area">'
					+ replyContArr[i] + '</div></div></div>'
					 );
				} 
			} else {
				$("div#re-show-area").remove();
			}
      	      
			}, error: function(data){
			},
			 beforeSend : function(){
                $('.wrap-loading').removeClass('display-none');
            },
             complete : function(){
                   $('.wrap-loading').addClass('display-none');
            }
         
		});
		
	});

	
	//복제 클릭 이벤트
	$(document).on("click","#clone-bug",function(){
		$.ajax({
			url:"insertCloneBug.tk",
			type:"post",
			data:{"tCode" : bcode2, "bugtitle": bugtitle, "sprintCode":sprintCode, "bugCont":bugCont, "taskLevel":tLevel, "taskMaster":taskMaster, "headTaskCode" :headCode},
			dataType : "json",
			success: function(data){
				location.href="selectBugTask.tk";
				//location.reload(true);
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});
	
	//삭제 클릭 이벤트
	$(document).on("click","#delete-bug",function(){
		$.ajax({
			url:"deleteCloneBug.tk",
			type:"post",
			data:{"tCode" : bcode2},
			dataType : "json",
			success: function(data){
				location.href="selectBugTask.tk";
				//location.reload(true);
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});

	
	//검색 이벤트
	 function searchBug(){
			if(window.event.keyCode == 13){
			var searchBug = $("#searchBug").val();
			console.log(searchBug);
			
			$.ajax({
				url:"searchBug.tk",
				type:"post",
				data:{"taskHistValue" : searchBug},
				dataType : "json",
				success: function(data){
					
					//검색어에 내용있을 때 결과
					var searchArr = data.searchBugList2;
					console.log(data.searchBugList2);
					
					var searchBugTitle =[];
					var searchBugContent;
					var searchCnt = 0;
					var uName = [];
					
					var searchTaskCode = [];
					var searchTitle = $.each(searchArr, function(index, value){
							searchBugTitle += value.taskHistValue;
							console.log(searchBugTitle);
							searchCnt++;
							if(searchCnt != index){
								searchBugTitle += ",";
							}
							
							searchTaskCode += value.taskCode;
							console.log(searchTaskCode);
							if(searchCnt != index){
								searchTaskCode += ",";
							}
						
							uName += value.member.userName;
							if(searchCnt != index){
								uName += ",";
							}
							console.log(uName);
					});
					
					
					//아무것도 입력안하고 검색했을 때
					var searchArr2 = data.searchBugList1;
					
					var searchTitle = $.each(searchArr2, function(index, value){
							searchBugTitle += value.taskHistValue;
							searchCnt++;
							if(searchCnt != index){
								searchBugTitle += ",";
							}
							searchTaskCode += value.taskCode;
							if(searchCnt != index){
								searchTaskCode += ",";
							}
							uName += value.member.userName;
							if(searchCnt != index){
								uName += ",";
							}
							console.log(uName);
					});
					
					
					var titleArr = searchBugTitle.split(",");
					var tCodeArr = searchTaskCode.split(",");
					var userName = uName.split(",");
					var accountName = userName.slice(-2);
					console.log(accountName);
					
					$(".bug-list-detail").remove();
					 for(var i = 0; i < searchCnt; i++){
						 $("#bug-list-wrap").append('<div class="bug-list-detail">'
						+ '<div id="bug-ti-list" class="bug-ti-list">' + titleArr[i] + '</div><input type="hidden" value="' + sprintCode + '"id="sprint-code"><div id="bug-con-list">'	 
						+ '<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ' + tCodeArr[i]
						+  '</div><div id="user-pro-lit" class="bug-con-list-area">' + userName[i].slice(-2) + '</div></div></div>' 
						 );
					} 
						
						
				},
				error: function(data){
					console.log("실패");
				}
				/* ,
				 beforeSend : function(){
		            $('.wrap-loading').removeClass('display-none');
		        },
		          complete : function(){
		            $('.wrap-loading').addClass('display-none');
		        } */
			});
		}
	} 
	//필터링 전체 검색 이벤트
	$(document).on('click', '#all', function(){
		$.ajax({
			url:"searchBug.tk",
			type:"post",
			data:{"taskHistValue" : searchBug},
			dataType : "json",
			success: function(data){
				
				var searchArr2 = data.searchBugList1;
				var searchAllBugTitle =[];
				var searchBugContent;
				var searchCnt = 0;
				var searchAllTaskCode = [];
				var uName = [];
				
				var searchTitle = $.each(searchArr2, function(index, value){
						searchAllBugTitle += value.taskHistValue;
						searchCnt++;
						if(searchCnt != index){
							searchAllBugTitle += ",";
						} 
						searchAllTaskCode += value.taskCode;
						if(searchCnt != index){
							searchAllTaskCode += ",";
						}
						uName += value.member.userName;
						if(searchCnt != index){
							uName += ",";
						}
				});
				
				var titleAllArr = searchAllBugTitle.split(",");
				var tCodeAllArr = searchAllTaskCode.split(",");
				var userName = uName.split(",");
				
				
				$(".bug-list-detail").remove();
				 for(var i = 0; i < searchCnt; i++){
					 $("#bug-list-wrap").append('<div class="bug-list-detail">'
					+ '<div id="bug-ti-list" class="bug-ti-list">' + titleAllArr[i] + '</div><input type="hidden" value="' + sprintCode + '"id="sprint-code"><div id="bug-con-list">'	 
					+ '<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ' + tCodeAllArr[i]
					+  '</div><div id="user-pro-lit" class="bug-con-list-area">' + userName[i].slice(-2) + '</div></div></div>' 
					 );
				} 
					
					
			},
			error: function(data){
				console.log("실패");
			}
			,
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});
	
	//필터링 상위 테스크 검색 이벤트
	$(document).on('click', '#tk-level', function(){
		$.ajax({
			url:"searchBug.tk",
			type:"post",
			data:{"taskHistValue" : searchBug},
			dataType : "json",
			success: function(data){
				if(!data.searchBugList1){
				var searchArr2 = data.searchBugList1;
				var searchBugTitle =[];
				var searchBugContent;
				var searchCnt = 0;
				var searchTaskCode = [];
				console.log(searchArr2);
				var uName = [];
				
				var searchTitle = $.each(searchArr2, function(index, value){
					if(value.taskList.taskLevel == "상위"){
						searchBugTitle += value.taskHistValue;
						console.log("상위 : " + searchBugTitle);
						searchCnt++;
						if(searchCnt != index){
							searchBugTitle += ",";
						}
						
						searchTaskCode += value.taskCode;
						if(searchCnt != index){
							searchTaskCode += ",";
						}
						uName += value.member.userName;
						if(searchCnt != index){
							uName += ",";
						}
					}
				});
				
				
				var titleArr = searchBugTitle.split(",");
				var tCodeArr = searchTaskCode.split(",");
				var userName = uName.split(",");
				
				console.log(titleArr.length);
				
				$(".bug-list-detail").remove();
				 for(var i = 0; i < titleArr.length; i++){
					 $("#bug-list-wrap").append('<div class="bug-list-detail">'
					+ '<div id="bug-ti-list" class="bug-ti-list">' + titleArr[i] + '</div><input type="hidden" value="' + sprintCode + '"id="sprint-code"><div id="bug-con-list">'	 
					+ '<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ' + tCodeArr[i]
					+  '</div><div id="user-pro-lit" class="bug-con-list-area">' + userName[i].slice(-2) + '</div></div></div>' 
					 );
				} 
					
			}
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});
	
	//필터링 서브 테스크 검색 이벤트
	$(document).on('click', '#tk-sublevel', function(){
		$.ajax({ 
			url:"searchBug.tk",
			type:"post",
			data:{"taskHistValue" : searchBug},
			dataType : "json",
			success: function(data){
				if(!data.searchBugList1){
				var searchArr2 = data.searchBugList1;
				var searchBugTitle2 =[];
				var searchBugContent;
				var searchCnt = 0;
				var searchTaskCode2 = [];
				var uName = [];
				console.log(searchBugTitle2);
				console.log(searchTaskCode2);
				
				var searchTitle = $.each(searchArr2, function(index, value){
					if(value.taskList.taskLevel == "서브"){
						searchBugTitle2 += value.taskHistValue;
						console.log("서브 : " + searchBugTitle2);
						searchCnt++;
						if(searchCnt != index){
							searchBugTitle2 += ",";
						}
						
						searchTaskCode2 += value.taskCode;
						if(searchCnt != index){
							searchTaskCode2 += ",";
						}
						
						uName += value.member.userName;
						if(searchCnt != index){
							uName += ",";
						}
					}
				});
						console.log(searchCnt);
				
				
				var titleArr2 = searchBugTitle2.split(",");
				var tCodeArr2 = searchTaskCode2.split(",");
				var userName = uName.split(",");
				
				console.log(titleArr2);
				console.log(tCodeArr2);
				
				$("div.bug-list-detail").remove();
				  for(var i = 0; i < titleArr2.length-1; i++){
					$("#bug-list-wrap").append('<div class="bug-list-detail">'
					+ '<div id="bug-ti-list" class="bug-ti-list">' + titleArr2[i] + '</div><input type="hidden" value="' + sprintCode + '"id="sprint-code"><div id="bug-con-list">'	 
					+ '<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ' + tCodeArr2[i]
					+  '</div><div id="user-pro-lit" class="bug-con-list-area">' + userName[i].slice(-2) + '</div></div></div>' 
					 );
				} 
				 
				}	
			},
			error: function(data){
				console.log("실패");
			},
			 beforeSend : function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	          complete : function(){
	            $('.wrap-loading').addClass('display-none');
	        }
		});
	});
	
	//댓글 추가
	$(document).on('click', '#reply-add-btn', function(){
		var cont = $("#summernote").val();
		var cont2 = cont.replace('<p>','');
		var content = cont2.replace('</p>','');
		
	    console.log(content);
	    console.log(bcode);
	    
	     $.ajax({
	           type:"post",
	           url:"insertReply.pj",
	           dataType : "json",
	           data: {
	              "replyContents": content,
	              "taskCode": bcode2
	           }, success:function(data){
	        	      var replyArr = data.replyHistory;
	        	      console.log(replyArr);
	        	      var thumbnail = [];
	        	      var replyuserName = [];
	        	      var updateDate = [];
	        	      var replyCont = [];
	        	      var cnt = 0;
	        	      
	        	      var replyList = $.each(replyArr, function(index, value){
	        	    	  cnt++;
		        		  //thumbnail += (data.replyHistory.attachment.thumbnailPath);
		        		  //if(cnt != index){
		        		  //  thumbnail += ", ";
		        		  //}
		        		  replyuserName += (value.member.userName);
		        		  if(cnt != index){
		        			  replyuserName += ", ";
		        		  }
		        		  updateDate += (value.replyUpdateDate);
		        		  if(cnt != index){
		        			  updateDate += ", ";
		        		  }
		        		  replyCont += (value.replyContents);
		        		  if(cnt != index){
		        			  replyCont += ", ";
		        		  }
					  	
		        	  });
	        	      console.log(updateDate, replyCont);
	        	       
	        	
	        	      
	        	    var replyuserNameArr = replyuserName.split(",");
	  				var updateDateArr = updateDate.split(",");
	  				var replyContArr = replyCont.split(",");
	  				console.log(replyuserName);
	  				
	  				$("div#re-show-area").remove();
	  				  for(var i = 0; i < replyuserNameArr.length-1; i++){
	  					$("#re-show-area-wrap").append('<div id="re-show-area">'
	  					+ '<div id="re-show-pro">' + replyuserNameArr[i].slice(-2) + '</div><div id="re-show-cont">'	 
	  					+ '<div id="re-name-date-area"><div id="re-name">' + replyuserNameArr[i]
	  					+  '</div><div id="re-date">' + updateDateArr[i] + '</div></div> <div id="re-show-cont-area">'
	  					+ replyContArr[i] + '</div></div></div>'
	  					 );
	  				} 
	  				$('#reply-add-area').hide();
	  				$('#reply-input').show();
	  				$("#reply-add-btn").hide();
	  				$("#reply-cancel-btn").hide();    
	        	      
	        	      
	           }, error : function(){
	        	   console.log("실패!");
	        	   
	        	   
	           }, beforeSend : function(){
	                 $('.wrap-loading').removeClass('display-none');
	           }, complete : function(){
	                 $('.wrap-loading').addClass('display-none');
	           }

	           }); 
		return false;
	});
	
	$(document).on('click', '#reply-cancel-btn', function(){
		$('#reply-add-area').hide();
		$('#reply-input').show();
		$("#reply-add-btn").hide();
		$("#reply-cancel-btn").hide();
		
		/* var cont = $("#summernote").val();
		$('#summernote').remove(); */
	});

	
	</script>
	
</html>