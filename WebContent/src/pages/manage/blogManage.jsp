<%@page import="mybean.article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="articleList" class="mybean.article.ArticleList" scope="session"></jsp:useBean>
<% 
	request.setCharacterEncoding("utf-8");
	String pageTitle = (String)session.getAttribute("pageTitle"); 
	if(pageTitle == null || pageTitle.length() == 0) { pageTitle = "我的博客"; }
%>
<!DOCTYPE html>
<html>
<head>
	<!-- 检查账号权限 -->
	<%@include file="/src/components/checkAccount.jsp" %>
	
	<%@include file="/src/components/importTop.jsp" %>
	<style type="text/css">
		#newBlogForm input[type="text"] {
			color: black;
		}
	</style>
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
	            
	            <!-- 新建博客 -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newBlogModal" data-whatever="@getbootstrap">新建博客</button>
	            
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
		                            <img class="img-responsive" src="<%= request.getContextPath() %>/src/assets/images/blog-photo1.jpg" alt="photo">
		                        </a>
		                    </div>
		                </div> -->
		                <div class="col-sm-8 col-md-8">
		                    <h2 class="blog-title">
		                        <a href="<%= request.getContextPath() %>/blogShow?aid=<%= article.getId() %>"><%= article.getTitle() %></a>
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
	                    	<!--
		                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, veritatis, tempora, necessitatibus inventore nisi quam quia repellat ut tempore laborum possimus eum dicta id animi corrupti debitis ipsum officiis rerum.</p>
		                	 -->
		                </div>
		                <div class="col-sm-4 col-md-4 ">
		                    <div class="operator pull-right">
		                    <a href="<%= request.getContextPath() %>/blogEdit?aid=<%= article.getId() %>" class="btn btn-plain"><i class="fa fa-edit"></i> 修改</a>
		                    <a href="<%= request.getContextPath() %>/deleteBlog?aid=<%= article.getId() %>" class="btn btn-plain" onclick="return confirm('确定删除？')"><i class="fa fa-trash-alt"></i> 删除</a>
		                    </div>
		                </div>
		            </div>
	            <%
	            	}
	            %>
			</div>
		</section>
		
		<!-- modal 模态框 -->
		<!-- new blog -->
		<div class="modal fade" id="newBlogModal" tabindex="-1" role="dialog" aria-labelledby="newBlogModalLabel">
		  <div class="modal-dialog  modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<!-- close button -->
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">输入新建博客名</h4>
		      </div>
		      <form id="newBlogForm" action="<%= request.getContextPath() %>/newBlog" method="post">
			      <div class="modal-body">
			        <label for="article_title" class="control-label">博客名：</label>
			        <input class="form-control" type="text" id="article-name" name="article_title">
			      </div>
			      <div class="modal-footer">
			      	<input class="btn btn-primary" type="submit" value="新建博客">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>