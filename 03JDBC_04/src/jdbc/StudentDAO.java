package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
	public static Student createStudent(ResultSet rs) throws Exception{
		Student s = new Student();
		s.setId(rs.getInt("id"));
		s.setStudentNumber(rs.getString("studentNumber"));
		s.setName(rs.getString("name"));
		s.setDepartmentId(rs.getInt("departmentId"));
		s.setYear(rs.getInt("year"));
		s.setDepartmentName(rs.getString("departmentName"));
		return s;
	}
	
	//매개변수로 주어진 시작부분부터 개수만큼 조회하는 메소드
	
	public static List<Student> findAll(int currentPage, int pageSize) throws Exception{
		String sql="select s.*, d.departmentName from student s left join department d on s.departmentId = d.id limit ?,?";
		
		ArrayList<Student> list = new ArrayList<Student>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, (currentPage-1)*pageSize);
			pstmt.setInt(2, pageSize);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					list.add(createStudent(rs));
				}
			}
		}
		return list;
	}
	
	public static int count() throws Exception{
		String sql = "select count(*) from student;";
		int count=0;
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}
		return count;
	}
	
}
