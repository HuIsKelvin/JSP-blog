package myUtil.connector;

import java.sql.*;
import java.util.Vector;

public class MysqlQuery extends MysqlConnector {
	// 结果集列数
	private int resultSetColumn;
	// 结果集metaData
	private ResultSetMetaData  resultMetaData;
	private Vector<String> resultColumnName;

	public Vector<String> getResultColumnName() {
		return resultColumnName;
	}

	public MysqlQuery() {
		super();
	}
	public ResultSet executeSql(String sqlString) {
    	try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(Exception e) { 
			System.out.print(e);
		}
		try {
			this.resultSet = this.sqlStatement.executeQuery(sqlString);
			// 获取列名
	        this.resultMetaData = this.resultSet.getMetaData();
	        this.resultSetColumn = this.resultMetaData.getColumnCount();
	        resultColumnName = new Vector<String>();
	        for(int i = 0; i < this.resultSetColumn; i++) {
	        	String columnName = resultMetaData.getColumnName(i+1);
	        	resultColumnName.add(columnName);
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
}
