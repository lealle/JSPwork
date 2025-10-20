package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ajax01.DBConnectionMgr;
import ajax01.Member;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public ArrayList<Reply> getReply(int ref) {
		ArrayList<Reply> replylist= new ArrayList<>();
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref = "+ref+" order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reply rep = new Reply();
				rep.setNo(rs.getInt("no"));
				rep.setRef(ref);
				rep.setName(rs.getString("name"));
				rep.setContent(rs.getString("content"));
				rep.setRedate(rs.getString("redate"));
				replylist.add(rep);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return replylist;
	}

	public boolean InsertReply(Reply re) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, re.getContent());
			pstmt.setInt(2, re.getRef());
			pstmt.setString(3, re.getName());
			if(pstmt.executeUpdate() == 1)   // insert가 잘 되었으면 1반환, 그렇지 않으면 0반환
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	

}
