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
 * Servlet implementation class ToBlogShowPage
 */
@WebServlet("/ToBlogShowPage")
public class ToBlogShowPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToBlogShowPage() {
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
		String aid = request.getParameter("aid");
		System.out.println("blog aid: "+aid);
		// String atitle = request.getParameter("atitle");
		try {
			String sqlString = "select * from articles where article_id=" + aid + ";";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			// ��ȡ article ��Ϣ
//			resultSet.next();
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/src/pages/blogShow.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

}
