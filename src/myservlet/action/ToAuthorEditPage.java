package myservlet.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.connector.MysqlQuery;
import mybean.author.AuthorInfo;

/**
 * Servlet implementation class ToAuthorEditPage
 */
@WebServlet("/ToAuthorEditPage")
public class ToAuthorEditPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToAuthorEditPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			AuthorInfo author = new AuthorInfo();
			String sqlString = "select * from author_info;";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			
			// 读取 author 信息
			resultSet.first();
			author.setId(resultSet.getInt("author_id"));
			author.setName(resultSet.getString("author_name"));
			author.setMotto(resultSet.getString("author_motto"));
			author.setEmail(resultSet.getString("author_email"));
			author.setEmailSub(resultSet.getString("author_email_sub"));
			author.setGithub(resultSet.getString("author_github"));
			
			// 将 author 存在 session 中
		    request.getSession().setAttribute("authorInfo", author);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/manage/authorEdit.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
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
