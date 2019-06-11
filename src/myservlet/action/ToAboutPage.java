package myservlet.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import myUtil.connector.*;
import mybean.author.AuthorInfo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetAuthorInfo
 */
@WebServlet("/GetAuthorInfo")
public class ToAboutPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToAboutPage() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthorInfo aInfo = new AuthorInfo();
		/*
		 * try { Class.forName("com.mysql.cj.jdbc.Driver"); } catch(Exception e) {
		 * System.out.print(e); }
		 */
		try {
			String sqlString = "select * from author_info;";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			// 读取数据
			while(resultSet.next()) {
				aInfo.setId(resultSet.getInt("author_id"));
				aInfo.setName(resultSet.getString("author_name"));
				aInfo.setEmail(resultSet.getString("author_email"));
				aInfo.setMotto(resultSet.getString("author_motto"));
				aInfo.setGithub(resultSet.getString("author_github"));
			}
			
			// 将 author info 存在 session 中
		    request.getSession().setAttribute("authorInfo", aInfo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/about.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
