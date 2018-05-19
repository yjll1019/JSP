package lecture1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {
	
	public static List<Department> findAll() throws Exception{
		String sql = "select * from department";
		
		ArrayList<Department> list;
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery()){
			
			list = new ArrayList<Department>();
			while(resultSet.next()) {
				Department department = new Department();
				department.setId(resultSet.getInt("id"));
				department.setDepartmentName(resultSet.getString("departmentName"));
				list.add(department);
			}
		}
		return list;
	}
	
}
