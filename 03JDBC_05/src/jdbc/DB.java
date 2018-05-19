package jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB {
	static DataSource dataSource = null;
	
	// databaseName : db이름. 이 db연결 정보가 context.xml에 있어야한다. >> 여기서는 student1.
	public static Connection getConnection(String databaseName) throws SQLException, NamingException { 
		if (dataSource == null) { 
			InitialContext context = new InitialContext(); 
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/" + databaseName);
			} 
		return dataSource.getConnection();
	}
}
