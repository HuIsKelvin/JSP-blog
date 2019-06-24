<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@page import="mybean.account.Account"%>
<%
	Account account = (Account)session.getAttribute("account");
	if(account == null || account.getDegree() <=1) {
		response.sendRedirect(request.getContextPath() + "/src/pages/manage/signIn.jsp");
	}
%>
</body>
</html>