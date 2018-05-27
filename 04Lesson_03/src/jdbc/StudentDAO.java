package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.PreparedStatement;

public class StudentDAO {
	
	public static List<Student> findAll(int currentPage, int pageSize, String ss, String st, String od) throws Exception{
		
		String sql = "call student1.student_findAll(?,?,?,?,?)";
		
		ArrayList<Student> list = new ArrayList<Student>();
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setInt(1, (currentPage-1)*pageSize);
			pstmt.setInt(2, pageSize);
			pstmt.setString(3, ss); //where �ڿ� �ٴ� �͵� 0�̸� ���� true, 1�̸� �̸� 2�̸� �а��̸�
			pstmt.setString(4, st+"%"); //�̸� ���� �����̸� ��� ������ �� ������ st �� '��' �̸� '��'�� �����ϴ� ���ڵ� ��ȸ.
			pstmt.setString(5, od); //order by �ڿ� �ٴ� �͵� 
			
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
	
	public static int count(String ss, String st) throws Exception{
		String sql="call student_count(?,?)";
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, ss); //��ȸ ��� 
			pstmt.setString(2,  st+"%"); //�˻� ���ڿ�
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return rs.getInt(1);
				}
			}
		}
		return 0;
	}
	
	public static Student findOne(int id) throws Exception {
        String sql = "SELECT * FROM student WHERE id=?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Student student = new Student();
                    student.setId(resultSet.getInt("id"));
                    student.setStudentNumber(resultSet.getString("studentNumber"));
                    student.setName(resultSet.getString("name"));
                    student.setDepartmentId(resultSet.getInt("departmentId"));
                    student.setYear(resultSet.getInt("year"));
                    return student;
                }
            }
            return null;
        }
    }

	public static void update(Student student) throws Exception {
		String sql = "call student1.student_update(?,?,?,?,?)";

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

    public static void insert(Student student) throws Exception {
        String sql = "call student1.student_insert (?,?,?,?)";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, student.getStudentNumber());
            statement.setString(2, student.getName());
            statement.setInt(3, student.getDepartmentId());
            statement.setInt(4, student.getYear());
            statement.executeUpdate();
        }
    }

    public static void delete(int id) throws Exception {
        String sql = "DELETE FROM student WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

	
}
