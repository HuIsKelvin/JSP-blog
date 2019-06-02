package myservlet.action;

import myUtil.connector.*;
import mybean.article.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToBlogListPage
 */
@WebServlet("/ToBlogListPage")
public class ToBlogListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToBlogListPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sqlString = "select * from articles ORDER BY article_date DESC";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			ArticleList articleList = new ArticleList();
			while (resultSet.next()) {
				Article article = new Article();
				article.setId(resultSet.getInt("article_id"));
				article.setTitle(resultSet.getString("article_title"));
				article.setCategory(resultSet.getString("article_category"));
				article.setDate(resultSet.getString("article_date"));
				article.setDescription(resultSet.getString("article_description"));
				article.setAuthor(resultSet.getString("article_author"));
				article.setContent(resultSet.getString("article_content"));
				articleList.add(article);
			}
			// ½« hot article list ´æÔÚ session ÖÐ
		    request.getSession().setAttribute("articleList", articleList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/blogList.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
