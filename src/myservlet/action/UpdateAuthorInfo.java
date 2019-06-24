package myservlet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.connector.MysqlUpdate;

/**
 * Servlet implementation class UpdateAuthorInfo
 */
@WebServlet("/UpdateAuthorInfo")
public class UpdateAuthorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAuthorInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("author_id"));
		String name = request.getParameter("author_name");
		String motto = request.getParameter("author_motto");
		String email = request.getParameter("author_email");
		String emailSub = request.getParameter("author_email_sub");
		String github = request.getParameter("author_github");
		
		// 构造 sql 语句
		String sqlString = "UPDATE author_info ";
		sqlString += "SET author_name='" + name + "'";
		sqlString += ", author_motto='"+ motto +"'";
		sqlString += ", author_email='"+ email +"'";
		sqlString += ", author_email_sub='"+ emailSub +"'";
		sqlString += ", author_github='"+ github +"'";
		sqlString += " WHERE author_id=" + id;
		
		// 执行 sql
		boolean flag = (new MysqlUpdate()).executeSql(sqlString);
		if(flag) {
			response.sendRedirect("about");
		} else {
			request.getSession().setAttribute("message", "更新信息过程中出现错误！");
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
