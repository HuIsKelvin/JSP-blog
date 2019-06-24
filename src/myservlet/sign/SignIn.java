package myservlet.sign;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

// import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.connector.MysqlQuery;
import mybean.account.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
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
			String username = request.getParameter("username");
			String pwd = request.getParameter("password");
			int degree = 0;
			
			if(request.getSession().getAttribute("alertMsg") != null) {
				request.getSession().removeAttribute("alertMsg");
			};
			
			if(username == null || username.length() == 0 || pwd == null || pwd.length() ==0) {
				response.sendRedirect("./src/pages/manage/signIn.jsp");
			}
			
			String sqlString = "select * from account where account_name='" + username + "' AND account_password='" + pwd + "';";
			ResultSet resultSet = (new MysqlQuery()).executeSql(sqlString);
			if(resultSet.isBeforeFirst()) {
				// 读取 article 信息
				resultSet.first();
				username = resultSet.getString("account_name");
				degree = resultSet.getInt("account_degree");
				
				Account account = new Account();
				account.setUsername(username);
				account.setDegree(degree);
				request.getSession().setAttribute("account", account);
				
				if (degree == 1) {
					response.sendRedirect("./src/pages/home.jsp");
				} else if(degree == 2) {
					response.sendRedirect("/BlogSystem/blogManage");
				}
				// response.sendRedirect("./src/pages/home.jsp");
			} else {
				// 若结果集无数据
				request.getSession().setAttribute("alertMsg", "用户名或密码错误！");
				response.sendRedirect("./src/pages/manage/signIn.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
