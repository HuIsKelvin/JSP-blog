<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="article" class="mybean.article.Article" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<%@include file="/src/components/importTop.jsp" %>
	<style type="text/css">
	#blog-edit-form input {
		color: black;
	}
	</style>
</head>
<body>

	<!-- 导航栏 navigator -->
	<jsp:include page="/src/components/myNav.jsp" flush="true"/>

	<!-- 页面内容 -->
	<div class="page-container">
		<div id="blog-edit-page" class="container blog">
            <h1 class="page-header sidebar-title">
            	<!-- page title -->
               	博客编辑
            </h1>
			<form id="blog-edit-form" name="blogEdit" action="#" method="post">
				<div class="row">
					<label for="article_title" class="control-label">标题</label>
					<input class="form-control" type="text" name="article_title" value="<%= article.getTitle() %>">
				</div>
				<div class="row">
					<label for="article_category" class="control-label">类别</label>
					<input class="form-control" type="text" name="article_category" value="<%= article.getCategory() %>">
				</div>
				<div class="row">
					<label for="article_author" class="control-label">作者</label>
					<input class="form-control" type="text" name="article_author" value="<%= article.getAuthor() %>">
				</div>
				<div class="row">
					<label for="article_description" class="control-label">摘要</label>
					<input class="form-control" type="text" name="article_description" value="<%= article.getDescription() %>">
				</div>
				<div class="row">
					<label for="article_content" class="control-label">内容</label>
					<textarea class="form-control" name="article_content" rows="10" value="<%= article.getContent() %>"></textarea>
				</div>
			</form>
			<div class="operation row text-center">
				<button type="button" class="btn btn-primary">完成编辑</button>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>