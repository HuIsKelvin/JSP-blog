package myservlet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import myUtil.connector.MysqlUpdate;

/**
 * Servlet implementation class EditBlog
 */
@WebServlet("/EditBlog")
public class EditBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBlog() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String id = request.getParameter("article_id");
		String title = request.getParameter("article_title");
		String category = request.getParameter("article_category");
		String author = request.getParameter("article_author");
		String description = request.getParameter("article_description");
		String content = request.getParameter("article_content");
		String sqlString = "UPDATE articles";
		String updateString = "SET article_title='" + title + "', article_category='" + category + "', article_author='" + author + "', article_description='" + description + "', article_content='" + content + "'";
		String conditionString = "WHERE article_id=" + id;
		sqlString = sqlString + " " + updateString + " " + conditionString;
		// System.out.println(sqlString);
		
		boolean flag = (new MysqlUpdate()).executeSql(sqlString);
		if(flag) {
			response.sendRedirect(request.getContextPath() + "/blogManage");
		} else {
			request.getSession().setAttribute("message", "更新博客过程中出现错误！");
			response.sendRedirect(request.getContextPath()+"/error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
