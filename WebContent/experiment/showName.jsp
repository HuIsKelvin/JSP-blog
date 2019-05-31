<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show name</title>
</head>
<body>
	<p>
		用户输入的是： 
		<% String name = request.getParameter("name"); %>
		<%= name %>
	</p>
</body>
</html>