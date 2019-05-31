<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bloglist" class="mybean.article.BlogList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<%@ include file="/src/common/importTop.jsp" %>

</head>
<body>

	<!-- 导航栏 navigator -->
	<%@include file="/src/common/myNav.jsp" %>

	<!-- 页面内容 -->
	<div class="page-container">
		<h1>blog list</h1>
		<% 
			bloglist.setMsg("this mag");
			String msg = bloglist.getMsg();
		%>
		<%= msg %>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/common/myFooter.jsp" %>
	
	<%@ include file="/src/common/importBottom.jsp" %>
	 
</body>
</html>