package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class StudentDAO02 {
	
	//전체 학생 조회
	public static List<Student> findAll() throws Exception{
		String sql = "select s.*, d.departmentName "
				+"from student s left join department d on s.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
	         PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet resultSet = statement.executeQuery()) {
            ArrayList<Student> list = new ArrayList<Student>();
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
			return list;
		}
	}
	//파라미터로 주어진 학생들만 조회
	
	public static List<Student> findByName(String name) throws Exception{
		String s = name;
		String sql = "select s.*, d.departmentName "
				+"from student s left join department d on s.departmentId = d.id "
				+"where s.name like ?";
		try (Connection connection = DB.getConnection("student1");
	         PreparedStatement statement = connection.prepareStatement(sql)){
	         statement.setString(1, s+"%");
			try(ResultSet resultSet = statement.executeQuery()) {
            ArrayList<Student> list = new ArrayList<Student>();
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
			return list;
		}
	}	
}
}
