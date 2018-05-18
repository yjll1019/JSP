package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	public static User createUser(ResultSet rs) throws Exception{
		User u = new User();
		u.setId(rs.getInt("id"));
		u.setUserid(rs.getString("userid"));
		u.setPassword(rs.getString("password"));
		u.setName(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		u.setDepartmentId(rs.getInt("departmentId"));
		u.setEnabled(rs.getBoolean("enabled"));
		u.setUserType(rs.getString("userType"));
		u.setDepartmentName(rs.getString("departmentName"));
		return u;
	}
	
	public static List<User> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "select u.*, d.departmentName from User u left join department d on u.departmentId = d.id limit ?,?";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
				pstmt.setInt(1, (currentPage-1)*pageSize);
				pstmt.setInt(2, pageSize);
				try(ResultSet rs = pstmt.executeQuery()){
			
				while(rs.next()) {
					list.add(createUser(rs));
				}
		}
		}
		
		return list;
	}
	
	public static int count() throws Exception{
		String sql = "select count(*) from user;";
		int count = 0;
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}
		return count;
	}
		
}
