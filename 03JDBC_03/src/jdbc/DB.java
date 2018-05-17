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
	 	
	//여기서는 DB를 student1만 접근을 하기 때문에 DataSource객체를 하나만 만들어서 그때마다 그 데이터베이스에 대한 커넥션 객체만 얻으면 되지만,
	//만약에 다른 db를 접근하고자 할 때는 매번 DataSource객체를 만들어줘야하는거 아닌가?
}
