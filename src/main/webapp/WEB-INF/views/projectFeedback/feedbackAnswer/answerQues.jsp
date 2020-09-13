<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문응답페이지2</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/projectFeedback/feedbackAnswer/answerMain.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/sprintBacklog/button.css">

</head>
<body onload="showSurvey()">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
		<div id="wrapper">
		
		
	   		<div class=surveyInfo>
	   			
	   			<c:forEach var="i" begin="0" end="${fn:length(surveyChoiceList)-1}">

	   				Q.${surveyChoiceList.get(i).surveyQuesList.surveyQuesName}

	   				<c:if test="${surveyChoiceList.get(i).surveyQuesList.surveyQuesType == '01'}">
						<input type="checkbox" id="choice${i}"/><label for="choice${i}">${surveyChoiceList.get(i).surveyChoiceContent}</label>
	   				</c:if>
	   				<br>
	   			</c:forEach>
   			</div>
   			<div id="man"><img src="${ contextPath }/resources/images/files/login_man.png"></div>
   			<div id="woman"><img src="${ contextPath }/resources/images/files/login_woman.png"></div>
   			<div><img src="${ contextPath }/resources/images/logo/logo_trans.png" id="bottomlogo"></div>
   		</div>
</body>


<script type="text/javascript">

	function showSurvey() {
		
		}


</script>


</html>