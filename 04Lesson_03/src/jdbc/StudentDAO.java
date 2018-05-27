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
			pstmt.setString(3, ss); //where 뒤에 붙는 것들 0이면 모든게 true, 1이면 이름 2이면 학과이름
			pstmt.setString(4, st+"%"); //이름 조건 공백이면 모든 조건이 다 나오고 st 가 '이' 이면 '이'로 시작하는 레코드 조회.
			pstmt.setString(5, od); //order by 뒤에 붙는 것들 
			
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
			pstmt.setString(1, ss); //조회 방법 
			pstmt.setString(2,  st+"%"); //검색 문자열
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
