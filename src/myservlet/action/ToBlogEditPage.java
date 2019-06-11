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
import mybean.article.Article;

/**
 * Servlet implementation class ToBlogEdit
 */
@WebServlet("/ToBlogEdit")
public class ToBlogEditPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToBlogEditPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aid = request.getParameter("aid");
		try {
			String sqlString = "select * from articles where article_id='" + aid + "' ORDER BY article_date DESC;";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			// ��ȡ article ��Ϣ
			resultSet.first();
			Article article = new Article();
			article.setId(resultSet.getInt("article_id"));
			article.setTitle(resultSet.getString("article_title"));
			article.setCategory(resultSet.getString("article_category"));
			article.setDate(resultSet.getString("article_date"));
			article.setDescription(resultSet.getString("article_description"));
			article.setAuthor(resultSet.getString("article_author"));
			article.setContent(resultSet.getString("article_content"));
			
			// �� hot article list ���� session ��
		    request.getSession().setAttribute("article", article);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/manage/blogEdit.jsp");
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
