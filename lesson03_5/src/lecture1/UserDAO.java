package lecture1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
//findAll(currentPage, pageSize) 
//count
//update 
	public static List<User> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "select u.*, d.departmentName from user u left join department d on u.departmentId = d.id " + 
				"limit ?,?";
		ArrayList<User> list;
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, (currentPage-1)*pageSize);
			statement.setInt(2, pageSize);
			try(ResultSet resultSet = statement.executeQuery()){
				list = new ArrayList<User>();
				while(resultSet.next()) {
					User u = new User();
					u.setId(resultSet.getInt("id"));
					u.setUserId(resultSet.getString("userid"));
					u.setName(resultSet.getString("name"));
					u.setEmail(resultSet.getString("email"));
					u.setDepartmentId(resultSet.getInt("departmentId"));
					u.setEnabled(resultSet.getBoolean("enabled"));
					u.setUserType(resultSet.getString("userType"));
					u.setDepartmentName(resultSet.getString("departmentName"));
					list.add(u);
				}
			}
		}
		return list;
	}
	
	public static int count() throws Exception{
		String sql="select count(*) from user";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()){
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}
		}
		return 0;
	}
	
	public static User findOne(int id) throws Exception{
		String sql ="select * from user where id=?";
		User u = new User();
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
				statement.setInt(1, id);		
			try(ResultSet resultSet = statement.executeQuery()){
				if(resultSet.next()) {
					
					u.setId(resultSet.getInt("id"));
					u.setUserId(resultSet.getString("userid"));
					u.setName(resultSet.getString("name"));
					u.setEmail(resultSet.getString("email"));
					u.setId(resultSet.getInt("departmentId"));
					u.setEnabled(resultSet.getBoolean("enabled"));
					u.setUserType(resultSet.getString("userType"));
				}
			}
		}
		return u;
	}
	
	public static void update(User user) throws Exception{
		String sql = "update user set name=?, departmentId=?, userType=? where id=?";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, user.getName());		
			statement.setInt(2, user.getDepartmentId());		
			statement.setString(3, user.getUserType());		
			statement.setInt(4, user.getId());		
			statement.executeUpdate();
		}

	}
}
