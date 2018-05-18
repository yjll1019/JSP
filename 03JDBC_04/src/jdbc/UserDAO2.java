package jdbc;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO2 {
	
	public static User createUser(ResultSet rs) throws Exception{
		User u = new User();
		u.setId(rs.getInt("id"));
		u.setUserid(rs.getString("userid"));
		u.setPassword(rs.getString("password"));
		u.setName(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		u.setDepartmentId(rs.getInt("departmentId"));
		u.setEnabled(rs.getBoolean("enabled"));
		u.setUserType(rs.getString("userType"));
		u.setDepartmentName(rs.getString("departmentName"));
		return u;
	}
	
	//�̸�, ���� ������, ����������� �Ű������� �޾� �����͸� ��ȸ�ϴ� �޼ҵ�
	public static List<User> findByName(String name, int currentPage, int pageSize) throws Exception{
		String sql = "select u.*, d.departmentName from user u left join department d on u.departmentId = d.id where u.name like ? limit ?,?;";
		ArrayList<User> list = new ArrayList<User>();
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)){
			pstmt.setString(1, name+"%");
			pstmt.setInt(2, (currentPage-1)*pageSize);
			pstmt.setInt(3, pageSize);
			try(ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					list.add(createUser(rs));
				}
			}
		}
		return list;
	}
	
	//�˻� ����� �� ���ڵ� ���� ���� �޼ҵ� 
	public static int count(String name) throws Exception{
		String sql="select count(*) from user where name like ?;";
		
		try(Connection connection = DB.getConnection("student1");
				PreparedStatement pstmt = connection.prepareStatement(sql)){
				pstmt.setString(1, name+"%");
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						return rs.getInt(1);
					}
				}
			}
		return 0;
	}
}
