<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="./assets/css/main.css">
<title>Index Page</title>
</head>
<body>
<jsp:forward page="./src/pages/blogList.jsp"></jsp:forward>
</body>
</html>