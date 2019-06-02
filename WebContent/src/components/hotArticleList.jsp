<jsp:useBean id="hotArticleList" class="mybean.article.HotArticleList" scope="session"></jsp:useBean>
<%@ page import="mybean.article.Article" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/src/components/importTop.jsp" %>
	<style type="text/css">

	</style>
</head>
<body>
	<div id="hot-article-list">
        <!-- Recent Posts -->
        <div class="blog-sidebar">
            <h4 class="sidebar-title">
            	<i class="fa fa-align-left"></i> 
            	Recent Posts
           	</h4>
            <hr style="margin-bottom: 5px;">
            <%
				// int num = hotArticleList.getHotArticleList().size();
            	int num = hotArticleList.getArticleNum();
				for(int i=0; i< num ; i++) {
					Article article = hotArticleList.getHotArticleList().get(i);
			%>
	            <div class="media">
	          		<a class="pull-left" href="#">
	                    <img class="img-responsive media-object" src="/BlogSystem/src/assets/images/blog1.jpg" alt="Media Object">
	                </a>
	                <div class="media-body">
	                    <h4 class="media-heading"><a href="#"><%= article.getTitle() %></a></h4>
	                </div>
	            </div>
           	<%
				}
			%>
        </div>
	</div>
	
	<%@ include file="/src/components/importBottom.jsp" %>
</body>
</html>