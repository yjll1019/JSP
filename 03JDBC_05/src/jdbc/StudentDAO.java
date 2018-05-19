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

	// �Ű������� �־��� ���ۺκк��� ������ŭ ��ȸ�ϴ� �޼ҵ�

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

	public static int count() throws Exception {
		String sql = "select count(*) from student;";
		int count = 0;

		try (Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
		}
		return count;
	}

	// �⺻Ű�� id������ �� ���� �л��� ��ȸ�ϴ� �޼ҵ�
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

	// �Ķ���ͷ� ���� student��ü�� ������ �л����̺� �����ϴ� �޼ҵ�
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
}
