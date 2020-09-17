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
				
			</div>
			<div id="bug-detail-area">
				<div id="bug-detail"  style="background-color:white; border:0;">
					<div id="bg-num">
						<!-- <div id="bugicon" style="margin-left: 30px; margin-top:25px;"></div>&nbsp;&nbsp; -->
					</div>
					<div id="bg-detail-title">
						
					</div>
					<div id="bg-detail" style="border:0;">
					<img src="/agile/resources/images/indiv/main/mainpage/img_timeline3.jpg" style="width:500px; height:350px; margin-left:130px; margin-top:100px;">
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
</html>