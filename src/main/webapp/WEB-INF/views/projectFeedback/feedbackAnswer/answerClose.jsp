<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <script type="text/javascript">
 	var message = '${alertmsg}';
 	var jst= '${jst}';
 	alert(message);
 	self.opener=self;
 	window.close();
 </script>
</body>
</html>