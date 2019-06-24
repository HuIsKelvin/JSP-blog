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
		<div class="container blog">
			<div id="about-page">
				<div class="row">
		        	<!-- Blog Column -->
		        	<div class="col-md-8">
						<h1 class="page-header sidebar-title">
			            	<!-- page title -->
			                about me
			            </h1>
						<div class="detail-item">
							<h2 class="blog-title author-name">
								<a href="#"><%= authorInfo.getName() %></a>
							</h2>
						</div>
						<p><i class="fa fa-star"></i> <%= authorInfo.getMotto() %></p>
						<p><i class="fa fa-envelope"></i> <%= authorInfo.getEmail() %></p>
						<p>GitHub: <a href="<%= authorInfo.getGithub() %>"><%= authorInfo.getGithub() %></a></p>
					</div>
					
			        <!-- side bar -->
					<div class="col-md-4 sidebar-padding">
						<div class="blog-sidebar">
							<!-- search bar -->
							<%@include file="/src/components/searchBar.jsp" %>
						</div>
						
						<!-- recent article list -->
						<div class="iframe-container">
							<iframe id="ifm-hot-article" class="embed-responsive-item iframe" src="<%= request.getContextPath() %>/showHotArticle"></iframe>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>