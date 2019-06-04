<%@page import="mybean.article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="articleList" class="mybean.article.ArticleList" scope="session"></jsp:useBean>
<% 
	String pageTitle = (String)session.getAttribute("pageTitle"); 
	if(pageTitle == null || pageTitle.length() == 0) { pageTitle = "我的博客"; }
%>
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
		<!-- page content -->
		<section class="container blog">
			<div class="row">
		            <h1 class="page-header sidebar-title">
		            	<!-- page title -->
		                <%= pageTitle %>
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
			              <!--   <div class="col-sm-4 col-md-4 ">
			                    <div class="blog-thumb">
			                        <a href="#">
			                            <img class="img-responsive" src="/BlogSystem/src/assets/images/blog-photo1.jpg" alt="photo">
			                        </a>
			                    </div>
			                </div> -->
			                <div class="col-sm-8 col-md-8">
			                    <h2 class="blog-title">
			                        <a href="#"><%= article.getTitle() %></a>
			                    </h2>
			                    <p>
			                    	<i class="fa fa-calendar-o"></i> <%= article.getDate() %>
			                        <span class="comments-padding"></span>
			                        <% if(article.getAuthor() != null && article.getAuthor().length() > 0 ) { %> <i class="fa fa-user"></i> <%= article.getAuthor() %> <% } %>
			                        <span class="comments-padding"></span>
			                        <% if(article.getCategory() != null && article.getCategory().length() > 0 ) { %> <i class="fa fa-tag"></i> <%= article.getCategory() %> <% } %>
			                    </p>
			                    <%
			                    	if(article.getDescription() != null && article.getDescription().length() > 0) {
			                    %>
			                    	<p><%= article.getDescription() %></p>
			                    <% 
			                    	} 
		                    	%>
			                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum.</p>
			                </div>
			                <div class="col-sm-4 col-md-4 ">
			                    <div class="operator pull-right">
			                    <a href="#" class="btn"><i class="fa fa-trash"></i> 删除</a>
			                    <a href="#" class="btn"><i class="fa fa-pencil"></i> 修改</a>
			                    </div>
			                </div>
			            </div>
		            <%
		            	}
		            %>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>