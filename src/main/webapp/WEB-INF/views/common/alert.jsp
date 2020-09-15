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
 	var returnUrl= '${url}';
 	console.log('알럿다녀감..' + message)
 	alert(message);
 	document.location.href = returnUrl;
 	
 </script>
</body>
</html>