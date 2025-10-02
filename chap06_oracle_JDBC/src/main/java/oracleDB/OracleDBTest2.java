package oracleDB;

import java.sql.*;

public class OracleDBTest2 {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free","tjoeun","1234");
			System.out.println("Success");
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from department");

			System.out.println(rs);
			
			while(rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String location = rs.getString(3);
				System.out.println(id+", "+title+", "+location);
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("jdbc 드라이버 없음");
		}		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db버전 혹은 사용자명, 비밀번호가 안 맞음");
		}
		
		
	}
}
