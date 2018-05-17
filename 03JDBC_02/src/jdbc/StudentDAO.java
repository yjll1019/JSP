package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class StudentDAO {
	
	 public static List<Student> findAll() throws Exception{
		String sql = "select s.*, d.departmentName from student s left join department d on s.departmentId = d.id";
		DB.getConnection("student1");
		ArrayList<Student> list = new ArrayList<Student>();
		try (Connection connection = DB.getConnection("student1"); 
				PreparedStatement statement = connection.prepareStatement(sql); 
				ResultSet resultSet = statement.executeQuery()){
			while(resultSet.next()) {
				Student student = new Student();
				student.setId(resultSet.getInt("id"));
				student.setStudentNumber(resultSet.getString("studentNumber"));
				student.setName(resultSet.getString("name"));
				student.setDepartmentId(resultSet.getInt("departmentId"));
				student.setYear(resultSet.getInt("year"));
				student.setDepartmentName("departmentName");
				list.add(student);
			}
		}
		return list;
	}
}
