<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" class="mybean.article.Article" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<!-- 检查账号权限 -->
	<%@include file="/src/components/checkAccount.jsp" %>
	
	<%@include file="/src/components/importTop.jsp" %>
	
	<link rel="stylesheet" href="<%= request.getContextPath() %>/src/assets/css/editor.css">
	<script src="<%= request.getContextPath() %>/src/assets/squire/squire-raw.js"></script>
	<style type="text/css">
		#blog-edit-form input,
		#blog-edit-form textarea {
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
			<form id="blog-edit-form" name="blogEdit" action="<%= request.getContextPath() %>/updateBlog" method="post" onsubmit="return submitBlogEdit()">
				<input type="hidden" type="text" name="article_id" value="<%= article.getId() %>">
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
					<input id="article_content" type="hidden" name="article_content">
					<%-- <textarea class="form-control" name="content" rows="10"><%= article.getContent() %></textarea> --%>
				</div>
				
				<!-- squire -->
				<div id="squire-pane">
					<!-- format operator -->
					<div id="squire-operator">
				        <div class="row">
				        	<!-- bold -->
				            <span id="bold"><i class="fa fa-bold"></i></span>
				            <!-- remove bold -->
				            <span id="removeBold"> <i class="fa fa-times"></i> <i class="fa fa-bold"></i></span>
				            <!-- italic -->
				            <span id="italic"><i class="fa fa-italic"></i></span>
				            <!-- remove italic -->
				            <span id="removeItalic"> <i class="fa fa-times"></i> <i class="fa fa-italic"></i></span>
				            <!-- underline -->
				            <span id="underline"><i class="fa fa-underline"></i></span>
				            <!-- remove underline -->
				            <span id="removeUnderline"> <i class="fa fa-times"></i> <i class="fa fa-underline"></i></span>
				        	<!-- color -->
				            <span id="setTextColour" class="prompt"><i class="fa fa-palette"></i></span>
				            <!-- highlight -->
				            <span id="setHighlightColour" class="prompt"><i class="fa fa-highlighter"></i></span>
				            <!-- Remove formatting -->
				            <span id="removeAllFormatting"> <i class="fa fa-remove-format"></i></span>
				        </div>
				        
				        <div class="row">
				        	<!-- Make Header -->
				            <span id="makeHeader"><i class="fa fa-heading"></i></span>
				            <!-- quote -->
				            <span id="increaseQuoteLevel"><i class="fa fa-quote-right"></i></span>
				            <!-- dequote -->
				            <span id="decreaseQuoteLevel"> <i class="fa fa-times"></i> <i class="fa fa-quote-right"></i></span>
				            <!-- list -->
				            <span id="makeUnorderedList"><i class="fa fa-list"></i></span>
				            <!-- unlist -->
				            <span id="removeList"> <i class="fa fa-times"></i> <i class="fa fa-list"></i></span>
				            <!-- code -->
				            <span id="code"><i class="fa fa-code"></i></span>
				            <!-- uncode -->
				            <span id="removeCode"> <i class="fa fa-times"></i> <i class="fa fa-code"></i></span>
				            <!-- image -->
				            <span id="insertImage" class="prompt"><i class="fa fa-image"></i></span>
				            <!-- Link -->
				            <span id="makeLink" class="prompt"><i class="fa fa-link"></i></span>
				        </div>
				        
				        <div class="row">
				            <!-- undo -->
				            <span id="undo"><i class="fa fa-undo"></i></span>
				            <!-- redo -->
				            <span id="redo"><i class="fa fa-redo"></i></span>
				        </div>
				        
					</div>
					
					<div id="content-editor"></div>
				</div>
				<div class="row text-center">
					<br/>
					<button type="submit" class="btn btn-primary">完成编辑</button>
					<br/>
				</div>
			</form>
			<!-- <div class="operation row text-center">
				<button type="button" class="btn btn-primary">完成编辑</button>
			</div> -->
		</div>
	</div>
	
	<script type="text/javascript">
			
		var squireOperatior = document.getElementById("squire-operator");
		
		var divEditor = document.getElementById("content-editor");
		var editor = new Squire(divEditor, {
		    blockTag: 'p',
		    blockAttributes: {
		        'class': 'paragraph'
		    },
		    tagAttributes: {
		        ul: {
		            'class': 'UL'
		        },
		        ol: {
		            'class': 'OL'
		        },
		        li: {
		            'class': 'listItem'
		        },
		        a: {
		            'target': '_blank'
		        },
		        pre: {
		            style: 'border-radius:3px;border:1px solid #ccc;padding:7px 10px;background:#f6f6f6;font-family:menlo,consolas,monospace;font-size:90%;white-space:pre-wrap;word-wrap:break-word;overflow-wrap:break-word;'
		        },
		        code: {
		            style: 'border-radius:3px;border:1px solid #ccc;padding:1px 3px;background:#f6f6f6;font-family:menlo,consolas,monospace;font-size:90%;'
		        },
		    }
		});
		
		Squire.prototype.makeHeader = function () {
		    return this.modifyBlocks(function (frag) {
		        var output = this._doc.createDocumentFragment();
		        var block = frag;
		        while (block = Squire.getNextBlock(block)) {
		            output.appendChild(
		                this.createElement('h2', [Squire.empty(block)])
		            );
		        }
		        return output;
		    });
		};
		
		squireOperatior.addEventListener('click', function (e) {
			// console.log("click" + e.target.tagName);
			// console.log(e.target.parentNode);
			
		    var ev = e || window.event;
		    var target = ev.target || ev.srcElement;
		    
			while(target.tagName.toLowerCase() !== "span") {
				console.log(target.tagName.toLowerCase());
				if(target.id === "squire-operator") break;
				target = target.parentNode;
				// console.log(target);
			}
		    
	           // var id = ev.target.id,
	           var id = target.id,
	              	value;
	           if (id && editor && editor[id]) {
	               if (target.className === 'prompt') {
	                   value = prompt('Value:');
	               }
	               editor[id](value);
	           }
		});
		
		var h1 = document.createElement("h1");
		h1.innerHTML = "title";
		// editor.setHTML("<h1>title</h1>");
		var string = '<%= article.getContent() %>';
		editor.setHTML(string);

		var submitBlogEdit = function() {
			var contentInput = document.getElementById("article_content");
			contentInput.value = editor.getHTML();
			console.log(contentInput.value);
			return true;
		}
	</script>
	
	<!-- footer -->
	<%@ include file="/src/components/myFooter.jsp" %>
	
	<%@include file="/src/components/importBottom.jsp" %>
	 
</body>
</html>