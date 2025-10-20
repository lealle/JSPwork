package ajax01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// id 중복 체크
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 회원가입
	public boolean insertMember(Member bean) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetail_address());
			pstmt.setString(10, String.join(" ", bean.getHobby()));
			pstmt.setString(11, bean.getJob());
			
			if(pstmt.executeUpdate() == 1)   // insert가 잘 되었으면 1반환, 그렇지 않으면 0반환
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// login
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return flag;
	}
	
	// id, name , gender, email 가져오기
	public Member checkById(String id) {
		Member mem= new Member();
		try {
			con = pool.getConnection();
			sql = "select id, name , gender, email from member where id='" +id +"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem.setId(rs.getString("id"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getString("gender"));
				mem.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return mem;
	}
	
	public ArrayList<Member> getMember() {
		ArrayList<Member> memlist= new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member mem = new Member();
				String[] hobbyarr = null;
				mem.setId(rs.getString("id"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getString("gender"));
				mem.setEmail(rs.getString("email"));
				mem.setBirthday(rs.getString("birthday"));
				mem.setZipcode(rs.getString("zipcode"));
				mem.setAddress(rs.getString("address"));
				mem.setDetail_address(rs.getString("detail_address"));
				String hobbystr = rs.getString("hobby");
				hobbyarr = hobbystr.split(","); 
				mem.setHobby(hobbyarr);
				mem.setJob(rs.getString("job"));
				memlist.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return memlist;
	}
	
	
	
}
