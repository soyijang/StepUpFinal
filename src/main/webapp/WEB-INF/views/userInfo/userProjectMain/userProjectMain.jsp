<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/indiv/userInfo/userProjectMain/userProjectMain.css">
<body>
	<%@ include file="../../common/menubar.jsp" %>
            <div id="main-cont">
                <div id="main-cont-area">
                	<div id="status-area">
                		<div id="not-task">
                			미진행
                		</div>
                		<div id="task-ing">
                			진행중
                		</div>
                		<div id="com-task">
                			진행완료
                		</div>
                		<div id="tot-task">
                			전체 업무
                		</div>
                	</div>
                	<div id="pj-alm-area">
                		<div id="pro-cont-area">
                			<div id="pro-cont-title">
                				<p id="project">Project</p>
                			</div>
                			<div id="pro-cont">
                				
                			</div>
                		</div>
                		<div id="alm-cont-area">
                			<div id="alm-cont-title">
                				<p id="alarm">Alarm</p>
                			</div>
                			<div id="alm-cont">
                			
                			</div>
                		</div>
                	</div>
                	<div id="task-cht-area">
                		<div id="task-cont-area">
                			<div id="task-cont-title">
                				<p id="task">Task</p>
                			</div>
                			<div id="task-cont">
                			
                			</div>
                		</div>
                		<div id="cht-cont-area">
                			<div id="cht-cont-title">
                				<p id="chart">Chart</p>
                			</div>
                			<div id="cht-cont">
                			
                			</div>
                		</div>
                	</div>
                </div>
                <div id="calendar-area">
                	<div id="cal-cont-title">
                		<p id="calendar">Calendar</p>
                	</div>
                	<div id="cal-cont">
                		
                	</div>
                </div>
             </div>
</body>
</html>