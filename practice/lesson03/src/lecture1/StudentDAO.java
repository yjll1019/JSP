package lecture1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*
 * 작성일 : 2018년 05월 01일
 * 내 용 : Student DAO(Data Access Object:DB 테이블에 대한 SELECT,INSERT, UPDATE, DELETE 작업이 메소드로 구현된 클래스)
 */
public class StudentDAO {
	
	public static List<Student> findAll() throws Exception{
		//findAll메소드의 역할
		//1. DB의 student 테이브렝서 조회한 데이터를 Student객체에 채운다.
		//2. 그 Student 객체들을 ArrayList에 채우고 리턴한다.
		
		String sql ="select s.*, d.departmentName from student s left join department d on s.departmentId = d.id";
		//Connection > PreparedStatement > ResultSet
		
		ArrayList<Student> list;
		
		try(Connection connection = DB.getConnection("student1");//DB연결을 위한 
				PreparedStatement statement = connection.prepareStatement(sql);//sql명령어 실행을 위한
				ResultSet resultSet = statement.executeQuery()){ //sql조회 결과 데이터를 전달해주는 		
			list = new ArrayList<Student>();
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
		}
		
		return list;
	}
}
