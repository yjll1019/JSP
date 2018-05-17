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
	
	public static List<User> findAll() throws Exception{
		String sql = "select u.*, d.departmentName from User u left join department d on u.departmentId = d.id;";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			
				while(rs.next()) {
					list.add(createUser(rs));
				}
		}
		
		return list;
	}
	
	//이름으로 사용자를 조회하는 메소드
	public static List<User> findByName(String name) throws Exception{
		String sql = "select u.*, d.departmentName from User u left join department d on u.departmentId = d.id where u.name like ?";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, name+"%");
			try(ResultSet rs = pstmt.executeQuery()){
			
				while(rs.next()) {
					list.add(createUser(rs));
				}
			}
		}
		
		return list;
	}
	
	//학과로 사용자를 조회하는 메소드
	public static List<User> findByDepartmentId(int deaprtmentId) throws Exception{
		String sql = "select u.*, d.departmentName from user u left join department d on u.departmentId = d.id where departmentId = ?";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, deaprtmentId);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					list.add(createUser(rs));
				}
			}
		}
		return list;
	}
}
