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
	
	public static List<User> findAll(int currentPage, int pageSize, String ss, String st, String od) throws Exception{
		String sql = "call student1.user_findAll(?,?,?,?,?)";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
				pstmt.setInt(1, (currentPage-1)*pageSize);
				pstmt.setInt(2, pageSize);
				pstmt.setString(3, ss);
				pstmt.setString(4, st+"%");
				pstmt.setString(5, od);
				try(ResultSet rs = pstmt.executeQuery()){
			
				while(rs.next()) {
					list.add(createUser(rs));
				}
		}
		}
		
		return list;
	}
	
	public static List<User> findByName(String name, int currentPage, int pageSize, String od) throws Exception{
		String order ="ID";
		
		switch(od) {
		case "1" : order = "departmentId"; break;
		case "2" : order = "name"; break;
		}
		
		String sql = "select u.*, d.departmentName from User u left join department d on u.departmentId = d.id where u.name like ? ORDER BY "+order+" limit ?,?";
		
		ArrayList<User> list = new ArrayList<User>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
				pstmt.setString(1,name+"%");
				pstmt.setInt(2, (currentPage-1)*pageSize);
				pstmt.setInt(3, pageSize);
				try(ResultSet rs = pstmt.executeQuery()){
			
				while(rs.next()) {
					list.add(createUser(rs));
				}
		}
		}
		
		return list;
	}
	
	public static int count(String ss, String st) throws Exception{
		String sql = "call student1.user_count(?,?)";
		int count = 0;
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, ss);
			pstmt.setString(2, st+"%");
			try(ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}
		}
		return count;
	}
	
	public static User findOne(int id) throws Exception{
		String sql="select * from user where id=?";
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setUserid(rs.getString("userid"));
					u.setPassword(rs.getString("password"));
					u.setName(rs.getString("name"));
					u.setEmail(rs.getString("email"));
					u.setDepartmentId(rs.getInt("departmentId"));
					u.setEnabled(rs.getBoolean("enabled"));
					u.setUserType(rs.getString("userType"));
					return u;
				}
			}
		}
		return null;
	}
	
	public static void update(User u) throws Exception{
		String sql="call student1.user_update(?,?,?,?,?,?,?,?)";
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, u.getUserid());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getName());
			pstmt.setString(4, u.getEmail());
			pstmt.setInt(5, u.getDepartmentId());
			pstmt.setBoolean(6, u.isEnabled());
			pstmt.setString(7, u.getUserType());
			pstmt.setInt(8, u.getId());
			pstmt.executeUpdate();
		}
	}
	
	public static void insert(User u) throws Exception{
		String sql = "call student1.user_insert(?,?,?,?,?,?,?)";
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, u.getUserid());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getName());
			pstmt.setString(4, u.getEmail());
			pstmt.setInt(5, u.getDepartmentId());
			pstmt.setBoolean(6, u.isEnabled());
			pstmt.setString(7, u.getUserType());
			pstmt.executeUpdate();
		}
		
	}
	
	public static void delete(int id) throws Exception{
		String sql = "delete from user where id=?";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
	}
}
