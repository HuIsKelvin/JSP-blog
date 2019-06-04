<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="authorInfo" class="mybean.author.AuthorInfo" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<%@include file="/src/components/importTop.jsp" %>

</head>
<body>

	<!-- 导航栏 navigator -->
	<jsp:include page="/src/components/myNav.jsp" flush="true"/>

	<!-- 页面内容 -->
	<div class="page-container">
		<div class="container">
			<h1>about page</h1>
			<div>
				<%= authorInfo.getName() %>
			</div>
			<div>
				<%= authorInfo.getEmail() %>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>