package lecture1;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DB {
	static DataSource dataSource = null;
	
	//Connection객체를 생성해서 리턴하는 메소드 
	//context.xml 파일에 등록된 정보로 DB를 연결한다.
	public static Connection getConnection(String databaseName) throws SQLException, NamingException {
		if(dataSource == null) {//비어있으면 객체 생성 아니면 객체 리턴
			InitialContext context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/" + databaseName);
		}
		return dataSource.getConnection();
	}
}
