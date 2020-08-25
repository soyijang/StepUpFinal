<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/gh/ka215/jquery.timeline@master/dist/jquery.timeline.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/ka215/jquery.timeline@master/dist/jquery.timeline.min.js"></script>
</head>
<body>
<div id="myTimeline">
  <ul class="timeline-events">
    <li data-timeline-node="{ start:'2019-02-26 10:00',end:'2019-02-26 13:00',content:'<p>Event Body...</p>' }">Event Label</li>
    <li data-timeline-node="{ start:'2019-03-01 23:10',end:'2019-03-02 1:30' }">
      <span class="event-label">Event Label</span>
      <span class="event-content"><p>Event Body...</p></span>
    </li>
  </ul>
</div>
</body>
<script>
$(function () {
    $("#myTimeline").Timeline()
})
</script>
</html>