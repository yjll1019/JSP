package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	public static List<User> findAll() throws Exception{
		String sql = "select u.* , d.departmentName from user u left join department d on u.departmentId = d.id";
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

}
