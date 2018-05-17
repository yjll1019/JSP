package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//StudentDAO의 student객체의 필드 값들을 resultSet을 통해 받아올 때 중복되는 코드 제거하기.
public class StudentDAO2 {
	
	public static Student createStudent(ResultSet rs) throws SQLException{
		Student s = new Student();
		s.setId(rs.getInt("id"));
		s.setStudentNumber(rs.getString("studentNumber"));
		s.setName(rs.getString("name"));
		s.setDepartmentId(rs.getInt("departmentId"));
		s.setYear(rs.getInt("year"));
		s.setDepartmentName(rs.getString("departmentName"));
		return s;
	}
	
	public static List<Student> findAll() throws Exception{
		String sql ="select s.*, d.departmentName from student s left join department d on s.departmentId = d.id";
		
		ArrayList<Student> list=new ArrayList<Student>();
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				list.add(createStudent(rs));
			}
		}
		
		return list;
	}
	
	public static List<Student> findByDepartmentId(int departmentId) throws Exception{
		String sql = "select s.*, d.departmentName from student s left join department d on s.departmentId = d.id where departmentId = ?";

		ArrayList<Student> list = new ArrayList<Student>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, departmentId);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					list.add(createStudent(rs));
				}
			}
		}
		return list;
	}
}
