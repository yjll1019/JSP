package lecture1.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;
import lecture1.jdbc2.Student;

public class StudentDAO {
	public static List<Student> findAll(int currentPage, int pageSize) throws Exception{
		//1페이지면  0~14출력 (currentPage-1)*pageSize, pageSize 순으로 들어가야한다 mysql에 
		String sql = "SELECT s.*, d.departmentName " + 
                " FROM student s LEFT JOIN department d ON s.departmentId = d.id "
                + " limit ?, ?";
		
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setInt(1, (currentPage-1)*pageSize);
			statement.setInt(2, pageSize);
		try(ResultSet resultSet = statement.executeQuery()) {//조회결과를 받아옴.
			ArrayList<Student> list = new ArrayList<Student>();
            while (resultSet.next()) { //쿼리문에 맞는 db가 있으면
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
	
    public static int count() throws Exception {
        String sql = "SELECT COUNT(*) FROM student"; //student테이블의 레코드 수 
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) //결과 값(조회결과가)이 1개기 때문에 if임
                    return resultSet.getInt(1); //숫자를 줘도 되고 필드명을 줘도 되고,  숫자: 첫 번째 컬럼 두 번째 컬럼 이런거임.
        }
        return 0;
    }

}
