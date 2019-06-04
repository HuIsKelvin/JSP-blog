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
import mybean.article.ArticleList;

/**
 * Servlet implementation class ToBlogMangePage
 */
@WebServlet("/ToBlogMangePage")
public class ToBlogMangePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToBlogMangePage() {
        super();
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
		if(request.getSession().getAttribute("account") == null) {
			// 如果未登录
			response.sendRedirect("./src/pages/manage/signIn.jsp");
			// response.sendRedirect("/BlogSystem/signin");
		} else {
			try {
				String sqlString = "select * from articles where article_ifShow=1 ORDER BY article_date DESC";
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
				// 将 hot article list 存在 session 中
			    request.getSession().setAttribute("articleList", articleList);
			    request.getSession().setAttribute("pageTitle", "博客管理");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/manage/blogManage.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
