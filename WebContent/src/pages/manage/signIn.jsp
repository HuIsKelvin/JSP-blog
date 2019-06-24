<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = null;
	if(session.getAttribute("alertMsg") != null) {
		alertMsg = (String)session.getAttribute("alertMsg");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	/* .sign-form {
		min-height: 900px;
	}

	.sign-form form {
		margin: 0 auto;
	} */
	.input-group input[type="text"],
	.input-group input[type="password"] {
		color: #000;
	}
	</style>

	<%@include file="/src/components/importTop.jsp" %>

</head>
<body>

	<!-- 导航栏 navigator -->
	<jsp:include page="/src/components/myNav.jsp" flush="true"/>

	<!-- 页面内容 -->
	<div class="page-container">
		<div class="container blog">
			<div class="sign-form">
				<form class="input-group searchbar" action="<%= request.getContextPath() %>/signin" method="post" name="login">
					<%if(alertMsg != null) { out.print("<p style='color: red;'>" + alertMsg + "</p>"); } %>
					<p>用户名：<input type="text" class="form-control" name="username"></p>
					<br/>
					<p>密码：<input type="password" class="form-control" name="password"></p>
					<br/>
					<p><button class="btn btn-default" type="submit">登录</button></p>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>