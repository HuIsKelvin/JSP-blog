<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input name</title>
</head>
<body>
	<form action="/BlogSystem/postman" method="post">
		<p>输入名字<input type="text" name="name"></p>
		<p><input type="submit" value="提交"></p>
	</form>
</body>
</html>