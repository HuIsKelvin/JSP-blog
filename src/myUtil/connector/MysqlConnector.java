package myUtil.connector;

import java.sql.*;

public class MysqlConnector {
	private String uri;
	private String user;
    private String password;
	// �������ݿ�
    protected Connection connection;
    protected Statement sqlStatement;
    protected String sqlString;
    protected ResultSet resultSet;
    
	public MysqlConnector() {
		super();
		this.uri = "jdbc:mysql://localhost:3306/blogsystem?serverTimezone=UTC";
		this.user ="root";
	    this.password ="kelvin1075";
    	try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(Exception e) { 
			System.out.print(e);
		}
    	try {
    		// Ϊ���ݿ�������׼��
	        this.connection = DriverManager.getConnection(uri, user, password);
	        this.sqlStatement = this.connection.createStatement();
    	} catch (SQLException sqlException) {
    		System.out.println(sqlException);
    	}
	}
	protected void finalize() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			System.out.println(e);;
		}
	}
}
