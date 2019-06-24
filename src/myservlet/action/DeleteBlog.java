package myservlet.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.connector.MysqlUpdate;

/**
 * Servlet implementation class DeleteBlog
 */
@WebServlet("/DeleteBlog")
public class DeleteBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aid = request.getParameter("aid");
		String sqlString = "UPDATE articles SET article_ifshow = 0 WHERE article_id=" + aid;
		
		// 执行 sql
		boolean flag = (new MysqlUpdate()).executeSql(sqlString);
		System.out.println("Delete blog! blog id = " + aid);
		if(flag) {
			response.sendRedirect("blogManage");
		} else {
			request.getSession().setAttribute("message", "删除操作出现错误！");
			response.sendRedirect(request.getContextPath() + "/error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
