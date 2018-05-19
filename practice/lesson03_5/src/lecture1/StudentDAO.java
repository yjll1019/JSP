package lecture1;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
	public static List<Student> findAll(int currentPage, int pageSize) throws Exception{
		String sql = "select s.*, d.departmentName from student s left join department d on s.departmentId = d.id "+
				" limit ?,?";
		ArrayList<Student> list = new ArrayList<Student>();;
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, (currentPage-1)*pageSize);
			statement.setInt(2, pageSize);
			try(ResultSet resultSet = statement.executeQuery()){
				while(resultSet.next()) {
					Student student = new Student();
					student.setId(resultSet.getInt("id"));
					student.setStudentNumber(resultSet.getString("studentNumber"));
					student.setName(resultSet.getString("name"));
					student.setDepartmentId(resultSet.getInt("departmentId"));
					student.setYear(resultSet.getInt("year"));
					student.setDepartmentName(resultSet.getString("departmentName"));
					list.add(student);
				}
			}
		}
		return list;
	}
	
	public static int count() throws Exception{
		String sql = "select count(*) from student";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery()){
			if(resultSet.next()) {
				return resultSet.getInt(1);
			}
			return 0;
		}
	}
	
	public static Student findOne(int id) throws Exception{
		String sql = "select * from student where id=? ";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, id);
			try(ResultSet resultSet = statement.executeQuery()){
				if(resultSet.next()) {
				Student student = new Student();
				student.setId(resultSet.getInt("id"));
				student.setStudentNumber(resultSet.getString("studentNumber"));
				student.setName(resultSet.getString("name"));
				student.setDepartmentId(resultSet.getInt("departmentId"));
				student.setYear(resultSet.getInt("year"));
				return student;	
			}
			}
		}
		return null;
	}
	
	public static void update(Student student) throws Exception{ 
		String sql = "update student set studentNumber=?, name=?, departmentId=?, year=? where id=? ";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, student.getStudentNumber());
			statement.setString(2, student.getName());
			statement.setInt(3, student.getDepartmentId());
			statement.setInt(4, student.getYear());
			statement.setInt(5, student.getId());
			statement.executeUpdate();
		}
	}
	
}
