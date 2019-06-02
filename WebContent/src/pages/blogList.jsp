<%@page import="mybean.article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="articleList" class="mybean.article.ArticleList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

	<%@ include file="/src/components/importTop.jsp" %>

</head>
<body>

	<!-- 导航栏 navigator -->
	<%@ include file="/src/components/myNav.jsp" %>

	<!-- 页面内容 -->
	<div class="page-container">
		<!-- Page Content -->
		<section class="container blog">
			<div class="row">
		        <!-- Blog Column -->
		        <div class="col-md-8">
		            <h1 class="page-header sidebar-title">
		                My blogs
		            </h1>
		            
		            <!-- Blog List -->
		        	<%
		            	int blogListNum = articleList.getArticleNum();
		            	for(int blogIndex = 0; blogIndex < blogListNum; blogIndex++) {
		  					Article article = articleList.getArticleList().get(blogIndex);
		            %>
		            	<!-- single blog -->
		            	<hr>
			            <div class="row single-blog">
			                <div class="col-sm-4 col-md-4 ">
			                    <div class="blog-thumb">
			                        <a href="#">
			                            <img class="img-responsive" src="/BlogSystem/src/assets/images/blog-photo1.jpg" alt="photo">
			                        </a>
			                    </div>
			                </div>
			                <div class="col-sm-8 col-md-8">
			                    <h2 class="blog-title">
			                        <a href="#"><%= article.getTitle() %></a>
			                    </h2>
			                    <p>
			                    	<i class="fa fa-calendar-o"></i> <%= article.getDate() %>
			                        <span class="comments-padding"></span>
			                        <% if(article.getCategory() != null && article.getCategory().length() >0 ) { %> <i class="fa fa-comment"></i> <%= article.getCategory() %> <% } %>
			                    </p>
			                    <p><%= article.getDescription() %></p>
			                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum.</p>
			                </div>
			            </div>
		            <%
		            	}
		            %>
					<!-- ----------- -->
					
		            <hr>
		            <div class="text-center"> 
		                <ul class="pagination"> 
		                    <li class="active"> <a href="#">1</a> </li> 
		                    <li> <a href="#">2</a> </li> 
		                    <li> <a href="#">3</a> </li> 
		                    <li> <a href="#">4</a> </li> 
		                    <li> <a href="#">5</a> </li> 
		                    <li> <a href="#">Next</a> </li> 
		                </ul> 
		            </div>
		        </div>
		        
		        <!-- side bar -->
				<div class="col-md-4 sidebar-padding">
					<!-- hot article list -->
					<div class="iframe-container">
						<iframe id="ifm-hot-article" class="embed-responsive-item iframe" src="/BlogSystem/showHotArticle"></iframe>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@ include file="/src/components/importBottom.jsp" %>
</body>
</html>