package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class LocationPool {
	private DBConnectionMgr pool = null;
	
	public LocationPool() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<LocationBean> getLocation(){
		ArrayList<LocationBean> alist = new ArrayList<LocationBean>();
		try(Connection con = pool.getConnection();){ // try (){}도 잘 작동하는 모습
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from location");

			while(rs.next()) {
				LocationBean bean = new LocationBean();
				bean.setLocal_name(rs.getString("local_name"));
				bean.setLocal_code(rs.getString("local_code"));
				bean.setNational_code(rs.getString("national_code"));
				alist.add(bean);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return alist;
	}
}
