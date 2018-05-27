package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DepartmentDAO {
	
	public static List<Department> findAll() throws Exception{
		String sql = "select * from department";
		
		ArrayList<Department> list = new ArrayList<Department>();
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()){ //executeQuery : db엔진으로 쿼리문이 전달되어 실행된다.
			while(rs.next()) {
				Department d = new Department();
				d.setId(rs.getInt("id"));
				d.setDepartmentName(rs.getString("departmentName"));
				list.add(d);
			}
		}
		return list;
	}
	
}
