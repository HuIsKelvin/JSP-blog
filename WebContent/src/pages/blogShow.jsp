<%@page import="mybean.article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="article" class="mybean.article.Article" scope="session"></jsp:useBean>
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
	    	<!-- Page Content -->
		    <div class="container blog singlepost">
				<div class="row">
					<article class="col-md-8">
						<!-- blog title -->
				        <h1 class="page-header sidebar-title"><%= article.getTitle() %></h1>
				        
				        <!-- single blog info -->
						<div class="row">
							<div class="col-md-12">
								<div class="entry-meta">
									 <span><i class="fa fa-calendar-o"></i> <%= article.getDate() %></span>
									 <!-- blog author -->
									 <span><% if(article.getAuthor() != null && article.getAuthor().length() > 0 ) { %> <i class="fa fa-user"></i> Posted by <a href="#"><%= article.getAuthor() %></a> <% } %> </span>
									 <!-- blog category -->
									 <span><% if(article.getCategory() != null && article.getCategory().length() > 0 ) { %> <i class="fa fa-tag"></i> <a href="#" rel="tag"><%= article.getCategory() %></a> <% } %> </span>
									 <!-- <div class="pull-right"><span><i class="fa fa-eye"></i> 184</span> <span><i class="fa fa-comment"></i> 4</span></div> -->
								</div>
							</div>
						</div>
						
						<!-- blog content -->
						<div class="blog-content">
						<%= article.getContent() %>
						
						<!-- 
						<p>This is some dummy copy. You&rsquo;re not really supposed to read this dummy copy, it is just a place holder for people who need some type to visualize what the actual copy might look like if it were real content.</p>
						</div>
						<p>If you want to read, I might suggest a good book, perhaps <a title="Hemingway" href="http://en.wikipedia.org/wiki/Ernest_Hemingway">Hemingway</a> or <a title="Melville" href="http://en.wikipedia.org/wiki/Herman_Melville">Melville</a>. That&rsquo;s why they call it, the dummy copy. This, of course, is not the real copy for this entry. Rest assured, the words will expand the concept. With clarity. Conviction. And a little wit.</p>
						<p>In today&rsquo;s competitive <a title="market environment" href="http://en.wikipedia.org/wiki/Market_environment">market environment</a>, the body copy of your entry must lead the reader through a series of <strong>disarmingly simple thoughts</strong>.</p>
						<p>All your supporting arguments must be communicated with simplicity and charm. And in such a way that the reader will read on. (After all, that&rsquo;s a reader&rsquo;s job: to read, isn&rsquo;t it?) And by the time your readers have reached this point in the finished copy, you will have convinced them that you not only respect their intelligence, but you also <strong>understand their needs as consumers</strong>.</p>
						<p>As a result of which, your entry will repay your <a title="writing" href="http://en.wikipedia.org/wiki/Writing">efforts</a>. Take your sales; simply put, they will rise. Likewise your credibility. There&rsquo;s every chance your competitors will wish they&rsquo;d placed this entry, not you. While your customers will have probably forgotten that your competitors even exist. Which brings us, by a somewhat circuitous route, to another small point, but one which we feel should be raised.</p>
						<h3>Long copy or short – You decide</h3>
						<p>As a marketer, you probably don&rsquo;t even believe in body copy. <strong>Let alone long body copy</strong>. (Unless you have a long body yourself.) Well, truth is, who&lsquo;s to blame you? Fact is, too much long body copy is dotted with such indulgent little phrases like <a title="truth" href="http://en.wikipedia.org/wiki/Truth">truth</a> is, fact is, and who&rsquo;s to blame you. Trust us: we guarantee, with a hand over our heart, that no such indulgent rubbish will appear in your entry. That&rsquo;s why God gave us big blue pencils. So we can expunge every example of witted waffle.</p>
						<blockquote>
						  <p>For you, the skies will be blue, the birds will sing, and your copy will be crafted by a dedicated little man whose wife will be sitting at home, knitting, wondering why your entry demands more of her husband&lsquo;s time than it should.</p>
						</blockquote>
						<p>But you will know why, won&lsquo;t you? You will have given her husband a chance to immortalize himself in print, writing some of the most persuasive prose on behalf of a truly enlightened purveyor of <a title="widgets" href="http://en.wikipedia.org/wiki/Widgets">widgets</a>. And so, while your dedicated reader, enslaved to each mellifluous paragraph, clutches his newspaper with increasing interest and intention to purchase, you can count all your increased profits and take pots of money to your bank. Sadly, this is not the real copy for this entry. <strong>But it could well be</strong>. All you have to do is look at the <a title="account executive" href="http://en.wikipedia.org/wiki/Account_executive">account executive</a> sitting across your desk (the fellow with the lugubrious face and the calf-like eyes), and say &rdquo;Yes! Yes! Yes!&ldquo; And anything you want, body copy, dinners, women, will be yours. Couldn&rsquo;t be fairer than that, could we?</p>
 						-->
 						
				    </article>
					<!-- Blog Sidebar Column -->
					<aside class="col-md-4 sidebar-padding">
					
						<div class="blog-sidebar">
							<!-- search bar -->
							<%@include file="/src/components/searchBar.jsp" %>
						</div>
						
						<!-- Recent Posts -->
						<div class="blog-sidebar">
							<!-- recent article list -->
							<div class="iframe-container">
								<iframe id="ifm-hot-article" class="embed-responsive-item iframe" src="<%= request.getContextPath() %>/showHotArticle"></iframe>
							</div>
						</div>
	
					</aside>
				</div>
		    </div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>