<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
		<img src="/agile/resources/images/indiv/main/mainpage/img_error.jpg" style="width:800px; height:550px; margin-left:300px; margin-top:80px;">
		<p style=" margin-left:470px; font-size: x-large; font-weight: bold; color: #DD0351">요청하신 페이지를 찾을 수 없습니다!</p>    
	</c:if>
	<h1 align="center"><c:out value="${ msg }"/></h1>
</body>
</html>