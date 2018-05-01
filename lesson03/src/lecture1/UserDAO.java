package lecture1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

/*
 * 작성일 : 2018년 05월 01일
 * 내 용 : User DAO
 */
public class UserDAO {
	
	public static ArrayList<User> find() throws SQLException, NamingException{
		ArrayList<User> list;
		
		String sql = "select u.*, d.departmentName from user u left join department d on u.departmentId = d.id ";
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet =statement.executeQuery()){
				list = new ArrayList<User>();
				
				while(resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserId(resultSet.getString("userid"));
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
		
	}

