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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/issueType.css">

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
				              <span id="user-list">담당자</span>
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
				<div id="tb_wrap">
				<div id="bug-list">
					<p id="bug-title">Tasks</p>
					<table class="bg-tb" style="width:95%; background-color: white; margin:auto;">
						<tbody style="background-color: white;">
							<tr>
								<td class="tb-bd" colspan="2" style="height:45px; text-align:left; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;버그 이슈 제목</td>
							</tr>
							<tr>
								<td class="tb-st" style="width:150px; height:40px; text-align:center;"><div id="bugicon">B</div>&nbsp;BUG-01</td>
								<td class="tb-st" style="height:40px; text-align:center;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
							</tr>
							<tr>
								<td class="tb-sd" style="height:5px;" colspan="2"></td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
			</div>
			<div id="bug-detail-area">
				<div id="bug-detail">
					<div id="bg-num">
						<div id="bugicon" style="margin-left: 30px; margin-top:25px;"></div>&nbsp;&nbsp;BUG-01
					</div>
					<div id="bg-detail-title">
						<table width="100%">
							<tr>
								<td>버그 이슈 제목</td>
								<td style="text-align:right;"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></td>
								<td><img src="/agile/resources/icon/common/icon_more%20horizontalicon.png" width="20px;" height="20px;"></td>
							</tr>
							<tr>
								<td><button>첨부</button><button>연결</button></td>
								<td colspan="2"></td>
							</tr>
						</table>
					</div>
					<div id="bg-detail">
						<div id="detail-ex">설명</div>
						<div id="detail-cont">아 거기서 오류나고 여기서 오류났어요</div>
					</div>
					<div id="bg-reply">
						<div id="re-pro"><img src="/agile/resources/images/profile/dayoon_202008152056.png"></div>
						<div id="bg-re-cont"><input type="text" width="100px;" height="70px;"></div>
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
</script>
</html>