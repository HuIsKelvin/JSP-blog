<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="authorInfo" class="mybean.author.AuthorInfo" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<!-- 检查账号权限 -->
	<%@include file="/src/components/checkAccount.jsp" %>
	
	<%@include file="/src/components/importTop.jsp" %>
	
	<style type="text/css">
		#author-edit-form input { color: #000; }
	</style>
</head>
<body>

	<!-- 导航栏 navigator -->
	<jsp:include page="/src/components/myNav.jsp" flush="true"/>

	<!-- 页面内容 -->
	<div class="page-container">
		<div class="container blog">
        	<div class="row">
            	<div class="col-sm-12 col-md-8">
            		<h1 class="page-header sidebar-title">
         			<!-- page title -->
           				我的信息
  	    			</h1>
					<form id="author-edit-form" name="authorEdit" action="updateAuthor" method="post">
						<input type="hidden" type="text" name="author_id" value="<%= authorInfo.getId() %>">
						<div class="row">
							<label for="author_name" class="control-label">名字</label>
							<input class="form-control" type="text" name="author_name" value="<%= authorInfo.getName() %>">
						</div>
						<br/>
						<div class="row">
							<label for="author_motto" class="control-label">MOTTO</label>
							<input class="form-control" type="text" name="author_motto" value="<%= authorInfo.getMotto() %>">
						</div>
						<br/>
						<div class="row">
							<label for="author_email" class="control-label">Email</label>
							<input class="form-control" type="text" name="author_email" value="<%= authorInfo.getEmail() %>">
						</div>
						<br/>
						<div class="row">
							<input class="form-control" type="hidden" name="author_email_sub" value="<%= authorInfo.getEmailSub() %>">
						</div>

						<div class="row">
							<label for="author_github" class="control-label">GitHub</label>
							<input class="form-control" type="text" name="author_github" value="<%= authorInfo.getGithub() %>">
						</div>
						<br/>
						<div class="row text-center">
							<br/>
							<button type="submit" class="btn btn-primary">完成编辑</button>
							<br/>
						</div>
					</form>
					<br/>          		
           		</div>
           	</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>