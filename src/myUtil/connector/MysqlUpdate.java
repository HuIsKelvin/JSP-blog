package myUtil.connector;

import java.sql.SQLException;

public class MysqlUpdate extends MysqlConnector {
	
	public boolean executeSql(String sqlString) {
		int updateStatus = -1;
		try {
			updateStatus = this.sqlStatement.executeUpdate(sqlString);
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		if(updateStatus >= 0) {
			return true;
		} else {
			return false;
		}
	}
}
