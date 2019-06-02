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
 * Servlet implementation class showHotArticleList
 */
@WebServlet("/showHotArticleList")
public class showHotArticleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showHotArticleList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			String sqlString = "select article_id id, article_title title, article_date date , article_description description from articles ORDER BY date DESC LIMIT 5;";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			HotArticleList hotArticleList = new HotArticleList();
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				Article article = new Article(id, title);
				article.setDescription(resultSet.getString("description"));
				hotArticleList.add(article);
			}
			System.out.println("num of recent blog: " + hotArticleList.getArticleNum());
			// ½« hot article list ´æÔÚ session ÖÐ
		    request.getSession().setAttribute("hotArticleList", hotArticleList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/components/hotArticleList.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
