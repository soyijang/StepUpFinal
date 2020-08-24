<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/nav.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectTask/bug/bug.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/dropdown.css">
</head>
<body>
 <%@ include file="../../common/menubar.jsp" %>
    <div id="content">
        <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
        <div id="contentTitle">
            <div id="projectTitle2">프로젝트 / 너무졸려요</div>
            <div id="menuTitle">이슈 게시판</div>
            <div id="search-area">
            	<div id="bug-search"><input type="text" value="BUG" size="10" style="height:25px; border: 1px solid #E8E8E8; "></div>
            	<div id="user-search">
            		<div class="dropdown">
				        <div class="select">
				              <span id="employeeStatus">담당자</span>
				          <i class="fa fa-chevron-left"></i>
				        </div>
				        <!-- <input type="hidden" name="employee" id="employeeTcode"> -->
				        <ul class="dropdown-menu">
				          <li id="work">High</li>
				          <li id="rest">Medium</li>
				          <li id="travel">Low</li>
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
				          <li id="work">High</li>
				          <li id="rest">Medium</li>
				          <li id="travel">Low</li>
				        </ul>
				      </div>
            	</div>
            </div>
        </div>
        <div id="contentBox">
			<div id="bug-list-area">
				<div>
				
				</div>
			</div>
			<div id="bug-detail-area">
				
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
</script>
</html>