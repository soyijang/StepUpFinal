<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectManage/projectTimeLine/projectTimeLine.css">
<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="content">
                <!-- 상단 프로젝트 제목 및 메뉴 이름 영역 -->
                <div id="contentTitle">
                    <div id="projectTitle2">프로젝트 / 이름땡땡땡!!</div>
                    <div id="menuTitle">로드맵</div>
                    <div id="shareArea">
	                    <div id="userArea">사용자추가하는 공간</div>
	                    <div id="share">
	                    	<button id="shareBtn">
	                    		<img id="sharedIcon"alt="공유아이콘" src="${pageContext.request.contextPath}/resources/icon/common/icon_shareicon.png">공유
	                    	</button>
	                    </div>
                    </div>
                    <div id="line"></div>
                </div>
                <div id="contentBox2">
                	<div id="epic-area">
                		
                		<div id="epic-title">
                			에픽
                		</div>
                		<div id="epic-title-cont">
                		
                		</div>
                	</div>
                	<div id="epic-con-area">
                		<div id="epic-con-title">
                		
                		</div>
                		<div id="epic-con-cont">
                		
                		</div>
                	</div>
                </div>
             </div>
</body>
</html>