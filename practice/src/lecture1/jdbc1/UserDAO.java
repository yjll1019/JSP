package lecture1.jdbc1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import lecture1.DB;
import lecture1.jdbc1.User;
public class UserDAO {
	
	public static ArrayList<User> findUserType(String s) throws Exception{
		
		String sql = "select u.*, d.* " + " from user u left join department d on u.departmentId = d.id "+
					" where u.userType = ?";
		  ArrayList<User> list = new ArrayList<User>();
		  
		  try (Connection connection = DB.getConnection("student1");
			       PreparedStatement statement = connection.prepareStatement(sql)){
			       statement.setString(1, s); 	
			       
				  try(ResultSet resultSet = statement.executeQuery()){
			        	while(resultSet.next()) {
			        		User user = new User();
			        		user.setId(resultSet.getInt("id"));
			        		user.setUserid(resultSet.getString("userid"));
			        		user.setPassword(resultSet.getString("password"));
			        		user.setName(resultSet.getString("name"));
			        		user.setEmail(resultSet.getString("email"));
			        		user.setDepartmentId(resultSet.getInt("departmentId"));
			        		user.setDepartmentName(resultSet.getString("departmentName"));
			        		user.setEnabled(resultSet.getBoolean("enabled"));
			        		user.setUserType(resultSet.getString("userType"));
			        		list.add(user);
				  }
			        	return list;
				  }
			      }
	}
	
	public static ArrayList<User> findEnabled(String s) throws Exception{
		int num = Integer.parseInt(s);
		String sql = "select u.*, d.* " + " from user u left join department d on u.departmentId = d.id "+
					" where u.enabled = ?";
		  ArrayList<User> list = new ArrayList<User>();
		  
		  try (Connection connection = DB.getConnection("student1");
			       PreparedStatement statement = connection.prepareStatement(sql)){
			       statement.setInt(1, num); 	
			       
				  try(ResultSet resultSet = statement.executeQuery()){
			        	while(resultSet.next()) {
			        		User user = new User();
			        		user.setId(resultSet.getInt("id"));
			        		user.setUserid(resultSet.getString("userid"));
			        		user.setPassword(resultSet.getString("password"));
			        		user.setName(resultSet.getString("name"));
			        		user.setEmail(resultSet.getString("email"));
			        		user.setDepartmentId(resultSet.getInt("departmentId"));
			        		user.setDepartmentName(resultSet.getString("departmentName"));
			        		user.setEnabled(resultSet.getBoolean("enabled"));
			        		user.setUserType(resultSet.getString("userType"));
			        		list.add(user);
				  }
			        	return list;
				  }
			      }
	}
		  
	
	
	public static ArrayList<User> findAll() throws Exception{
		String sql = "select u.*, d.* " + 
				" from user u left join department d on u.departmentId = d.id";
        ArrayList<User> list = new ArrayList<User>();
        
        try (Connection connection = DB.getConnection("student1");
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery()){
        	while(resultSet.next()) {
        		User user = new User();
        		user.setId(resultSet.getInt("id"));
        		user.setUserid(resultSet.getString("userid"));
        		user.setPassword(resultSet.getString("password"));
        		user.setName(resultSet.getString("name"));
        		user.setEmail(resultSet.getString("email"));
        		user.setDepartmentId(resultSet.getInt("departmentId"));
        		user.setDepartmentName(resultSet.getString("departmentName"));
        		user.setEnabled(resultSet.getBoolean("enabled"));
        		user.setUserType(resultSet.getString("userType"));
        		list.add(user);
        	}
        	
        }
        	return list;
	}
	
	public static ArrayList<User> findByName(String name) throws Exception{
		String sql = "select u.*, d.* " + 
				" from user u left join department d on u.departmentId = d.id " +
				"where u.name like ?";
        ArrayList<User> list = new ArrayList<User>();
        
        try (Connection connection = DB.getConnection("student1");
        PreparedStatement statement = connection.prepareStatement(sql)){
        	statement.setString(1, name+"%");
        try(ResultSet resultSet = statement.executeQuery()){
        	while(resultSet.next()) {
        		User user = new User();
        		user.setId(resultSet.getInt("id"));
        		user.setUserid(resultSet.getString("userid"));
        		user.setPassword(resultSet.getString("password"));
        		user.setName(resultSet.getString("name"));
        		user.setEmail(resultSet.getString("email"));
        		user.setDepartmentId(resultSet.getInt("departmentId"));
        		user.setDepartmentName(resultSet.getString("departmentName"));
        		user.setEnabled(resultSet.getBoolean("enabled"));
        		user.setUserType(resultSet.getString("userType"));
        		list.add(user);
        	}
        }
        }
        	return list;
	}
	
	public static ArrayList<User> findByDeptId(int id) throws Exception{
		String sql = "select u.*, d.* " + 
				" from user u left join department d on u.departmentId = d.id " +
				"where d.id = ?";
        ArrayList<User> list = new ArrayList<User>();
        
        try (Connection connection = DB.getConnection("student1");
        PreparedStatement statement = connection.prepareStatement(sql)){
        	statement.setInt(1, id);
        try(ResultSet resultSet = statement.executeQuery()){
        	while(resultSet.next()) {
        		User user = new User();
        		user.setId(resultSet.getInt("id"));
        		user.setUserid(resultSet.getString("userid"));
        		user.setPassword(resultSet.getString("password"));
        		user.setName(resultSet.getString("name"));
        		user.setEmail(resultSet.getString("email"));
        		user.setDepartmentId(resultSet.getInt("departmentId"));
        		user.setDepartmentName(resultSet.getString("departmentName"));
        		user.setEnabled(resultSet.getBoolean("enabled"));
        		user.setUserType(resultSet.getString("userType"));
        		list.add(user);
        	}
        }
        }
        return list;
	}
	
	public static User createUser(ResultSet resultSet) throws Exception{
		 	User user = new User();
        	while(resultSet.next()) {
        		
        		user.setId(resultSet.getInt("id"));
        		user.setUserid(resultSet.getString("userid"));
        		user.setPassword(resultSet.getString("password"));
        		user.setName(resultSet.getString("name"));
        		user.setEmail(resultSet.getString("email"));
        		user.setDepartmentId(resultSet.getInt("departmentId"));
        		user.setDepartmentName(resultSet.getString("departmentName"));
        		user.setEnabled(resultSet.getBoolean("enabled"));
        		user.setUserType(resultSet.getString("userType"));
     	
        	}
      
        return user;
	}
}
