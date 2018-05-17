package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	
	//검색한 이름에 해당되는 학생을 조회하는 메소드
	public static List<Student> findByName(String name)throws Exception{
		String sql="select s.*, d.departmentName from student s left join department d on s.departmentId=d.id where s.name like ?";
		ArrayList<Student> list = new ArrayList<Student>();
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, name+"%");
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					Student s = new Student();
					s.setId(rs.getInt("id"));
					s.setStudentNumber(rs.getString("studentNumber"));
					s.setName(rs.getString("name"));
					s.setDepartmentId(rs.getInt("departmentId"));
					s.setYear(rs.getInt("year"));
					s.setDepartmentName(rs.getString("departmentName"));
					list.add(s);
				}
			}
		}
		return list;
	}
	
	//폼에서 학과번호를 전송하면 학과에 해당하는 학생을 조회하는 메소드
	public static List<Student> findByDepartmenetId(int departmentId) throws Exception{
		String sql ="select s.*, d.departmentName from student s left join department on s.departmentId=d.id where s.departmentId = ?";
		
		ArrayList<Student> list = new ArrayList<Student>();
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
				pstmt.setInt(1, departmentId);	
				try(ResultSet rs = pstmt.executeQuery()){
					while(rs.next()) {
						Student s = new Student();
						s.setId(rs.getInt("id"));
						s.setStudentNumber(rs.getString("studnetNumber"));
						s.setName(rs.getString("name"));
						s.setDepartmentId(rs.getInt("departmentId"));
						s.setYear(rs.getInt("year"));
						s.setDepartmentName(rs.getString("departmentName"));
						list.add(s);
					}
				}
		}
		return list;
	}
	
}
