package lecture1;

import java.sql.Connection; 
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
 * 작성일 : 2018년 05월 01일
 * 내 용 : DB에 연결하기 위한 Connection객체를 생성해서 리턴하는 메소드 getConnection구현.
 */

public class DB {
	//DataSource객체는 단 하나
	static DataSource dataSource = null;
	
	public static Connection getConnection(String databaseName) throws SQLException, NamingException{
		if(dataSource == null) {
			InitialContext context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/" + databaseName);
		}
		return dataSource.getConnection();
	}
}