<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://cdn.ckeditor.com/ckeditor5/21.0.0/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/bug/bug.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/dropdown.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/issueType.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/button.css">
<script type="module" src="${pageContext.request.contextPath}/resources/js/indiv/projectTask/bug/ckeditor.js"></script>

<!-- 테ㅡ트 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
</head>
<body>
 <%@ include file="../../common/menubar.jsp" %>
    <div id="content" class="click-area">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 너무졸려요</div>
            <div id="menuTitle">이슈 게시판</div>
        </div>
        <div id="contentBox">
			<div id="bug-list-area">
			<div id="bug-search"><input type="text" id="searchBug" onkeyup="searchBug();"size="10"></div>
			<div id="user-search">
            		<div class="dropdown">
				        <div class="select">
				              <span id="user-list">담당자</span>
				          <i class="fa fa-chevron-left"></i>
				        </div>
				        <ul class="dropdown-menu">
				          <li id="work">심</li>
				          <li id="rest">다</li>
				          <li id="travel">윤</li>
				        </ul>
				      </div>
            	</div>
				<div id="tb_wrap">
				<div id="bug-list">
					<p id="bug-title">Tasks</p>
					<c:forEach var="i" items="${ bgList }" varStatus="status">
					<div id="bug-list-wrap">
					<div class="bug-list-detail">
						<div id="bug-ti-list" class="bug-ti-list">${ i.taskHistValue }</div>
						<input type="hidden" value="${ i.sprint.sprintCode }" id="sprint-code">
						<div id="bug-con-list">
							<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ${ i.taskCode }</div><div id="user-pro-lit" class="bug-con-list-area"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div>
						</div>
					</div>
					</div>
					</c:forEach>
				</div>
				</div>
			</div>
			<div id="bug-detail-area">
				<div id="bug-detail">
					<div id="bg-num">
						<div id="bugicon" style="margin-left: 30px; margin-top:25px;"></div>&nbsp;&nbsp;BUG
					</div>
					<div id="bg-detail-title">
						<table width="100%" id="bg-tb-title">
						<tbody id="bg-tbody">
							<tr>
								<td id="bgtitle-td"><div id="bug-issue-title">제목</div></td>
								<td style="text-align:right;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
								<td>
									<div class="dropdown2-area">
									<div class="dropdown2">
								        <div class="select2">
								              <button class="clone-delete-btn"><img src="/agile/resources/icon/common/icon_more%20horizontalicon.png" width="20px;" height="20px;"></button>
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
						<div id="detail-ex">설명</div>
						<div id="detail-cont"></div>
					</div>
					<div id="bg-reply" class="bg-reply">
						<div id="re-pro"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div>
						<div id="bg-re-cont">
						<!-- <div class="container mt-4 mb-4">
						  <div class="row justify-content-md-center">
						    <div class="col-md-12 col-lg-8">
						      <div class="form-group">
						         <textarea id="editor"></textarea>
						      </div>
						      <button type="submit" class="btn btn-primary">Submit</button>
						    </div>
						  </div>
						</div> -->
						<div class="re-ed-area">
					<input id="reply-input" type="text" placeholder="댓글 추가..">
					 <div id="editor-box" class="editor-box"style="display:none;">
					 
					 <textarea id="editor" style="width:100; height:40"></textarea>
					 	<button id="reply-add-btn">SAVE</button>
					 	<button id="reply-cancel-btn">CANCEL</button>
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
		$("#editor-box").show();
		$(this).hide();
		return false;
	});
	
	/* $(document).on('click', function(e){
		if(e.target.className == "editor-box"){
			return false;
		}
		$("#editor-box").hide();
		$("#reply-input").show();
			
	}); */
	
	/* window.onclick = function(e){
		if(e.target == ".bug-list-detail") {
			var index = document.getElementById("buglist" + 0);
			console.log("제발");
			console.log(index);
		}
	}; */

	
	//에디터 영역 제외한 곳 누르면 에디터 없어지게
	/* window.onclick = function(e){
		if(e.target == "") {
			return false;
			$("#editor-box").hide();
			$("#reply-input").show();
			console.log("제발");
		}
	}; */
	
	//버그 리스트 중 하나 누르면 테스크 제목 가져오기
	var a;
	var bugtitle;
	var bugcode;
	var bcode;
	var bugYN;
	var bugStatus;
	var bugCont;
	var sprintCode;
	
	$(document).on("click",".bug-list-detail",function(){
			a = $(this).text();
			
			var str = a.replace(/(\s*)/g, "");
			
			var start = str.indexOf(":");
			var end = str.indexOf("B", start+1);
			
			bugcode = str.substring(end);
			bugtitle = str.substring(start+1, end);
			
		});

	
	//버그리스트 누르면 상세 영역에 버그제목하고 코드가져오기
	$(document).on("click", ".bug-list-detail", function(){
		var div = "";
		div += '<div id="epicicon" style="margin-left:30px; margin-top:25px; display:inline-block;"></div> SPRINT-' + sprintCode + ' /' + '<div id="bugicon" style="margin-left: 10px; margin-top:25px;">&nbsp;&nbsp;</div> ' + bugcode;
		$("#bg-num").html(div);
		
		var div2 = "";
		div2 += '<div id="bug-issue-title">' + bugtitle + '</div>';
		$("#bgtitle-td").html(div2);
		
		bcode = bugcode.substring(4, 7);
		
		var values = [];
		
		$.ajax({
			url:"selectBugCont.tk",
			type:"post",
			data:{"tCode" : bcode},
			dataType : "json",
			success: function(data){
				
				
				values = data.bgContList;
				var sCode = [];
				console.log(data.bgContList);
				 var bgList = $.each(values, function(index, value){
					 if(value.taskCategoryCode == "H"){
						bugCont = value.taskHistValue;
					} else if(value.taskCategoryCode == "J"){
						bugTitle = value.taskHistValue;
					} else if(value.taskCategoryCode == "G"){
						bugYN = value.taskHistValue;
					} else if(value.taskCategoryCode == "I"){
						bugStatus = value.taskHistValue;
					}
					  sCode = value.sprint;
					}); 
				 	console.log("버그 진행 : " + bugStatus);
				 	
				 	sprintCode = sCode.sprintCode;
					console.log(sprintCode);
					
				 var div3 = "";
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
				 
				return data;
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
			data:{"tCode" : bcode, "bugtitle": bugtitle, "sprintCode":sprintCode, "bugCont":bugCont},
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
			data:{"tCode" : bcode},
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
			console.log("제발");
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
					
					var searchTaskCode = [];
					var searchTitle = $.each(searchArr, function(index, value){
							searchBugTitle += value.taskHistValue;
							searchCnt++;
							if(searchCnt != index){
								searchBugTitle += ",";
							}
							
							searchTaskCode += value.taskCode;
							if(searchCnt != index){
								searchTaskCode += ",";
							}
						
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
					});
					
					
					var titleArr = searchBugTitle.split(",");
					var tCodeArr = searchTaskCode.split(",");
					
					
					$(".bug-list-detail").remove();
					 for(var i = 0; i < searchCnt; i++){
						 $("#bug-list-wrap").append('<div class="bug-list-detail">'
						+ '<div id="bug-ti-list" class="bug-ti-list">' + titleArr[i] + '</div><input type="hidden" value="' + sprintCode + '"id="sprint-code"><div id="bug-con-list">'	 
						+ '<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG - ' + tCodeArr[i]
						+  '</div><div id="user-pro-lit" class="bug-con-list-area"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div></div></div>' 
						 );
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
		}
	} 
	
	
	</script>
	
	
	
	
	
	<!-- <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

	<script>
	  tinymce.init({
	    selector: 'textarea#editor',
	    menubar: false
	  });
	</script> -->
	<script>
	  ClassicEditor
     .create( document.querySelector( '#editor' ) )
     .catch( error => {
         console.error( error );
     } ); 
	 
	  //댓글입력
	 $(document).on("click","#reply-add-btn",function(){
		var reply = CKEDITOR.instances.editor.getData();
		console.log(CKEDITOR.instances.editor.getData());
		 
	 });
	  
	  
	  
	  
	  
	 
	/* $(document).ready(function() {
		  $('#summernote').summernote();
	}); */
</script>
</html>