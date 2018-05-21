package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

	public static Student createStudent(ResultSet rs) throws Exception {
		Student s = new Student();
		s.setId(rs.getInt("id"));
		s.setStudentNumber(rs.getString("studentNumber"));
		s.setName(rs.getString("name"));
		s.setDepartmentId(rs.getInt("departmentId"));
		s.setYear(rs.getInt("year"));
		s.setDepartmentName(rs.getString("departmentName"));
		return s;
	}

	// 매개변수로 주어진 시작부분부터 개수만큼 조회하는 메소드

	public static List<Student> findAll(int currentPage, int pageSize) throws Exception {
		String sql = "select s.*, d.departmentName from student s left join department d on s.departmentId = d.id limit ?,?";

		ArrayList<Student> list = new ArrayList<Student>();

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, (currentPage - 1) * pageSize);
			pstmt.setInt(2, pageSize);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					list.add(createStudent(rs));
				}
			}
		}
		return list;
	}
	
	public static List<Student> findByName(String name, int currentPage, int pageSize,String od) throws Exception{
		String order = "ID";
		switch(od) {
		case "1" : order="departmentName"; break;
		case "2" : order="year"; break;
		}
		String sql = "select s.*, d.departmentName from student s left join department d on s.departmentId = d.id where s.name like ? ORDER BY "+order+" limit ?,?";

		ArrayList<Student> list = new ArrayList<Student>();

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, name+"%");
			pstmt.setInt(2, (currentPage - 1) * pageSize);
			pstmt.setInt(3, pageSize);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					list.add(createStudent(rs));
				}
			}
		}
		return list;
	}

	public static int count(String name) throws Exception {
		String sql = "select count(*) from student where name like ?;";
		int count = 0;

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, name+"%");
				try(ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
			}
		}
		return count;
	}

	// 기본키인 id값으로 한 명의 학생을 조회하는 메소드
	public static Student findOne(int id) throws Exception {
		String sql = "select * from student where id=?";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					Student s = new Student();
					s.setId(rs.getInt("id"));
					s.setStudentNumber(rs.getString("studentNumber"));
					s.setName(rs.getString("name"));
					s.setDepartmentId(rs.getInt("departmentId"));
					s.setYear(rs.getInt("year"));
					return s;
				}
			}
		}
		return null;
	}

	// 파라미터로 받은 student객체의 정보를 학생테이블에 저장하는 메소드
	public static void update(Student student) throws Exception {
		String sql = "update student set studentNumber=?, name=?,  departmentId=?, year=? where id=?;";

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, student.getStudentNumber());
			pstmt.setString(2, student.getName());
			pstmt.setInt(3, student.getDepartmentId());
			pstmt.setInt(4, student.getYear());
			pstmt.setInt(5, student.getId());
			pstmt.executeUpdate();
		}
	}
	
	public static void insert(Student s) throws Exception{
		String sql = "insert student (studentNumber, name, departmentId, year) values(?,?,?,?)";
		
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
				pstmt.setString(1, s.getStudentNumber());
				pstmt.setString(2, s.getName());
				pstmt.setInt(3, s.getDepartmentId());
				pstmt.setInt(4,s.getYear());
				pstmt.executeUpdate();
		}
	}
	
	public static void delete(int id) throws Exception{
		String sql = "delete from student where id = ?";
		
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)) {
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
		}
	}
}
