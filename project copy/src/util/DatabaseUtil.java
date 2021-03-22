package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "TEST1";
			String dbPassword = "test1";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
