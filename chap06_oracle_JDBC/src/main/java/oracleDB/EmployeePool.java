package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class EmployeePool {
	private DBConnectionMgr pool = null;
	
	public EmployeePool() {
		pool = DBConnectionMgr.getInstance();
	}
	// pool 넣어준것 
	
	public ArrayList<EmployeeBean> getEmployee(){
		ArrayList<EmployeeBean> alist = new ArrayList<EmployeeBean>();
//		Connection con = null;
		try(Connection con = pool.getConnection();){ // try (){}도 잘 작동하는 모습
//			con = pool.getConnection();
			// pool 로 수정 
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
			
		}catch (Exception e) {
			e.printStackTrace();
		}
//		finally {
//			pool.freeConnection(con);
//		}
		
		return alist;
	}
}
