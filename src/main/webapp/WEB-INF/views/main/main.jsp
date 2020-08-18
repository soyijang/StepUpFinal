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
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	<div class="loginArea" align="center">
		<c:if test="${ empty sessionScope.loginUser }">
			<form action="login.me" method="post">
				<table id="lginTable" style="text-align: center;">
					<tr>
						<td><input type="text" name="userId"
							placeholder="Enter your email"></td>
					</tr>
					<tr>
						<td><input type="text" name="password"
							placeholder="Enter your password"></td>
					</tr>
					<tr>
						<td><button id="loginBtn">Continue</button><td>
					</tr>
				</table>
						<a href="memberJoinForm.me">Sign up for account</a>
			</form>
		</c:if>
	</div>
</body>
</html>