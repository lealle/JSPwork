package oracleDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EmployeeMgr {
	private final String JDBC_DRIVER ="oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:free";
	private String USER = "tjoeun";
	private String PASS= "1234";
	
	
	

	// 빈 객체 1행 - > 빈 갯수 전체 행의 개수 
	public EmployeeMgr(){
		// 다른 곳에서 생성자를 호출할때 public 이나 다른것을 붙여주지 않는다면 경로를 찾지못하여 500 에러가 발생하니 관련해서 알아두기(경험담) 
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("jdbc 드라이버 없음");
		}
	}
	
	public ArrayList<EmployeeBean> getEmployee(){
		ArrayList<EmployeeBean> alist = new ArrayList<EmployeeBean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL,USER,PASS);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from employee");
			
			while(rs.next()) {
				EmployeeBean bean = new EmployeeBean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setDept_code(rs.getString("dept_code"));
				bean.setJob_code(rs.getString("job_code"));
				bean.setEmail(rs.getString("email"));
				bean.setSalary(rs.getInt("salary"));
				alist.add(bean);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return alist;
	}
	
	
}
