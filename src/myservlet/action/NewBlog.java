package myservlet.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.connector.MysqlQuery;
import myUtil.connector.MysqlUpdate;
import mybean.article.Article;

/**
 * Servlet implementation class NewArticle
 */
@WebServlet("/NewArticle")
public class NewBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String article_title = request.getParameter("article_title");
		
		if(article_title == null || article_title.length() == 0) {
			// 转到 error页面
			request.getSession().setAttribute("message", "请输入正确的博客名！");
			response.sendRedirect("/BlogSystem/error");
		} else {
			try {
				String sqlString;
				// 获取当前时间，并格式化时间戳
			    Date nowDate = new Date();
			    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			    String formatDate = ft.format(nowDate);
			    System.out.println("创建新博客： \n" + formatDate + ", \n" + article_title);
				// 向数据库插入新博客记录
				sqlString = "INSERT INTO articles (article_title, article_date) VALUES ('" + article_title + "', '" + formatDate + "')";
				boolean isInsert = (new MysqlUpdate()).executeSql(sqlString);
				
				if(!isInsert) {
					// 若插入不成功
					// 转到 error页面
					request.getSession().setAttribute("message", "新建博客失败！");
					response.sendRedirect("/BlogSystem/error");
				} else {
					// 插入成功
					// sqlString = "select * from articles where article_id=" + aid + ";";
					sqlString = "select * from articles where article_title='" + article_title + "' ORDER BY article_date DESC;";
					ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
					// 读取 article 信息
					resultSet.first();
					int aid = resultSet.getInt("article_id");
					response.sendRedirect("/BlogSystem/blogEdit?aid=" + aid);
					
					/*
					 * Article article = new Article();
					 * article.setId(resultSet.getInt("article_id"));
					 * article.setTitle(resultSet.getString("article_title"));
					 * article.setCategory(resultSet.getString("article_category"));
					 * article.setDate(resultSet.getString("article_date"));
					 * article.setDescription(resultSet.getString("article_description"));
					 * article.setAuthor(resultSet.getString("article_author"));
					 * article.setContent(resultSet.getString("article_content"));
					 * 
					 * // 将 hot article list 存在 session 中
					 * request.getSession().setAttribute("article", article); RequestDispatcher
					 * dispatcher = request.getRequestDispatcher("/src/pages/manage/blogEdit.jsp");
					 * dispatcher.forward(request, response);
					 */
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
