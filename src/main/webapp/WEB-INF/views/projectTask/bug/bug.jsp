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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
 <%@ include file="../../common/menubar.jsp" %>
    <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 너무졸려요</div>
            <div id="menuTitle">이슈 게시판</div>
            <div id="search-area">
            	<div id="bug-search"><input type="text" size="10" style="height:25px; border: 1px solid #E8E8E8; border-radius:8px;"></div>
            	<div id="user-search">
            		<div class="dropdown">
				        <div class="select">
				              <span id="user-list">담당자</span>
				          <i class="fa fa-chevron-left"></i>
				        </div>
				        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
				        <ul class="dropdown-menu">
				          <li id="work">심</li>
				          <li id="rest">다</li>
				          <li id="travel">윤</li>
				        </ul>
				      </div>
            	</div>
            	<div id="sta-search">
            		<div class="dropdown">
				        <div class="select">
				              <span id="employeeStatus">상태</span>
				          <i class="fa fa-chevron-left"></i>
				        </div>
				        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
				        <ul class="dropdown-menu">
				          <li id="non-bug">미진행</li>
				          <li id="ing-bug">진행중</li>
				          <li id="com-bug">완료</li>
				        </ul>
				      </div>
            	</div>
            </div>
        </div>
        <div id="contentBox">
			<div id="bug-list-area">
				<div id="tb_wrap">
				<div id="bug-list">
					<p id="bug-title">Tasks</p>
					
					<div class="bug-list-detail">
						<div id="bug-ti-list">
							DB task 제약조건 오류
						</div>
						<div id="bug-con-list">
							<div id="bugicon" class="bug-con-list-area"></div><div class="bug-con-list-area" id="bug-code-list1">&nbsp;&nbsp;BUG-01</div><div id="user-pro-lit" class="bug-con-list-area"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div>
						</div>
					</div>
					
					<!-- <table class="bg-tb" style="width:95%; background-color: white; margin:auto;">
						<tbody style="background-color: white;" id="bugCodeTB">
							<tr>
								<td class="tb-bd" colspan="2" style="height:45px; text-align:left; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;버그 이슈 제목</td>
							</tr>
							<tr>
								<td class="tb-st" style="width:150px; height:40px; text-align:center;"><div id="bugicon">B</div>&nbsp;<div class="bug-code" style="display:inline-block;">BUG-01</div></td>
								<td class="tb-st" style="height:40px; text-align:center;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
							</tr>
							<tr>
								<td class="tb-sd" style="height:5px;" colspan="2"></td>
							</tr>
							
							<tr>
								<td class="tb-bd" colspan="2" style="height:45px; text-align:left; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;버그 이슈 제목</td>
							</tr>
							<tr>
								<td class="tb-st" style="width:150px; height:40px; text-align:center;"><div id="bugicon">B</div>&nbsp;<div class="bug-code" style="display:inline-block;">BUG-02</div></td>
								<td class="tb-st" style="height:40px; text-align:center;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
							</tr>
							<tr>
								<td class="tb-sd" style="height:5px;" colspan="2"></td>
							</tr>
						</tbody>
					</table> -->
				</div>
				</div>
			</div>
			<div id="bug-detail-area">
				<div id="bug-detail">
					<div id="bg-num">
						<div id="bugicon" style="margin-left: 30px; margin-top:25px;"></div>&nbsp;&nbsp;BUG-01
					</div>
					<div id="bg-detail-title">
						<table width="100%" id="bg-tb-title">
						<tbody id="bg-tbody">
							<tr>
								<td>버그 이슈 제목</td>
								<td style="text-align:right;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
								<td>
									<div class="dropdown2-area">
									<div class="dropdown2">
								        <div class="select2">
								              <button class="clone-delete-btn"><img src="/agile/resources/icon/common/icon_more%20horizontalicon.png" width="20px;" height="20px;"></button>
								          <i class="fa fa-chevron-left"></i>
								        </div>
								        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
								        <ul class="dropdown-menu2">
								          <li id="non-bug">복제</li>
								          <li id="ing-bug">삭제</li>
								        </ul>
								      </div>
								      </div>
								</td>
							</tr>
							<tr>
								<td><button id="rectangle5"><img src="/agile/resources/icon/common/icon_clip.png" width="15px;" height="15px;">첨부</button><button id="rectangle5"><img src="/agile/resources/icon/common/icon_link.png"  width="15px;" height="15px;">연결</button></td>
								<td colspan="2"></td>
							</tr>
							</tbody>
						</table>
					</div>
					<div id="bg-detail">
						<div id="detail-ex">설명</div>
						<div id="detail-cont">아 거기서 오류나고 여기서 오류났어요</div>
					</div>
					<div id="bg-reply">
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
					<input id="reply-input" type="text">
					 <div id="editor-box" style="display:none;"><div id="editor"></div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
<script>
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
	});
	
	//버그리스트 누르면 상세보기에 뜨게
	$(".bug-list-detail").click(function(){
		console.log("성공");
		var bugcode = $(".bug-code").text();
			console.log(bugcode);
		
			
			
		var div = "";
		div += '<div id="bugicon" style="margin-left: 30px; margin-top:25px;">&nbsp;&nbsp;</div>' + bugcode;
		$("#bg-num").html(div);
	});
	
	
	</script>
	
	<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

	<script>
	  tinymce.init({
	    selector: 'textarea#editor',
	    menubar: false
	  });
	</script>
	<script>
	  ClassicEditor
     .create( document.querySelector( '#editor' ) )
     .catch( error => {
         console.error( error );
     } ); 
	 
	 
	/* $(document).ready(function() {
		  $('#summernote').summernote();
	}); */
</script>
</html>