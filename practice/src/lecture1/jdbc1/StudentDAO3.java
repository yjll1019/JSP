package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class StudentDAO3 {
	
	//resultSet 받아서 student객체에 넣기 
    public static Student createStudent(ResultSet resultSet) throws SQLException {
        Student student = new Student();
        student.setId(resultSet.getInt("id"));
        student.setStudentNumber(resultSet.getString("studentNumber"));
        student.setName(resultSet.getString("name"));
        student.setDepartmentId(resultSet.getInt("departmentId"));
        student.setYear(resultSet.getInt("year"));
        student.setDepartmentName(resultSet.getString("departmentName"));
        return student;
    }
	
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

	//부서 번호 받아서 그 부서의 학생들 조회한 후에 list객체에 넣기
    public static List<Student> findByDepartmentId(int departmentId) throws Exception {
        String sql = "SELECT s.*, d.departmentName " +
                     "FROM student s LEFT JOIN department d ON s.departmentId = d.id " +
                     "WHERE s.departmentId = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, departmentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Student> list = new ArrayList<Student>();
                while (resultSet.next())
                    list.add(createStudent(resultSet));
                return list;
            }
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
