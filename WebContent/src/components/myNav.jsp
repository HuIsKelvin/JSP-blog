<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybean.account.Account" %>
<%
	Account account = new Account();
	String name = "";
	boolean login = false;
	if(session.getAttribute("account") != null ) {
		account = (Account)session.getAttribute("account");
		name = account.getUsername();
		if(name != null && name.length() != 0) {
			login = true;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
					<img src="/BlogSystem/src/assets/images/logo.png" alt="company logo" />
				</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right custom-menu">
					<li><a href="/BlogSystem/src/pages/home.jsp">Home</a></li>
					<li><a href="/BlogSystem/about">About</a></li>
					<li><a href="/BlogSystem/blogList">Blog</a></li>
					<%
						if(!login) {
							// 如果未登录
					%>
							<li><a href="/BlogSystem/src/pages/manage/signIn.jsp">登录</a></li>
							<li><a href="#">注册</a></li>
					<% 
						} else {
					%>
							<li class="dropdown">
					        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= name %> <span class="caret"></span></a>
					        	<ul class="dropdown-menu">
		        	<%
		        					if(account.isAdmin()) {
		        						// 如果是博主的账号
		        	%>
						        		<li><a href="/BlogSystem/blogManage">我的博客</a></li>
						            	<li><a href="#">个人信息</a></li>
						            	<li role="separator" class="divider"></li>
					<%
		        					} 
					%>
					            		<li><a href="/BlogSystem/signout">退出登录</a></li>
					          	</ul>
					        </li>
					<%
						}
							
					%>
					
				</ul>
			</div>
		</div>
	</nav>
	
</body>
</html>