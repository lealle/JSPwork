package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	public ArrayList<Board> getListBoard(String keyField, String keyWord) {
		ArrayList<Board> board = new ArrayList<>();
		try {
			con = pool.getConnection();
			if(keyWord==null || keyWord.equals("")){
				sql="select * from board order by ref, pos";
			}else {
				sql = "select * from board where " + keyField + " like '%" + keyWord + "%' order by ref, pos";
				
			}
			
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString(4));
				b.setRegdate(rs.getString(8));
				b.setCount(rs.getInt(11));
				board.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return board;
	}
	
	// 조회수 증가
	public void upCount(int num) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql="update board set count = count + 1 where num = "+num;
			result = con.createStatement().executeUpdate(sql);
			// 이렇게 처리하고 int, boolean 처리 해도 됨 
			while(rs.next()) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
	}
	
	// num에 해당하는 게시물 얻어오기 
	public Board getBoard(int num) {
		Board b = new Board();
		try {
			con = pool.getConnection();
			sql="select * from board where num = "+num;
			
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				b.setNum(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setSubject(rs.getString(3));
				b.setContent(rs.getString(4));
				b.setPos(rs.getInt(5));
				b.setRef(rs.getInt(6));
				b.setDepth(rs.getInt(7));
				b.setRegdate(rs.getString(8));
				b.setPass(rs.getString(9));
				b.setIp(rs.getString(10));
				b.setCount(rs.getInt(11));
				b.setFilename(rs.getString(12));
				b.setFilesize(rs.getInt(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return b;
	}

	public void updateBoard(Board b) {
		try {
			con = pool.getConnection();
			// sql="update board set name = "+b.getName()+" ,content = "+b.getContent()+" ,subject = "+b.getSubject()+"     where num = "+b.getNum();
			sql="update board set name = ?,content = ?,subject = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getName());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getSubject());
			pstmt.setInt(4, b.getNum());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
	}

	public int getNextNum() {
		int num = 0;
		try {
			con = pool.getConnection();
			sql="select max(num) from board";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return num;
	}
	
	public int getCount() {
		int num = 0;
		try {
			con = pool.getConnection();
			sql="select count(num) from board";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return num;
	}
	
	public boolean addBoard(Board b) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			// default 로 sysdate 넣어도 됨
			sql="insert into board values(?, ?, ?, ?, 0, ?, 0, sysdate, ?, ?, default, null, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b.getNum());
			pstmt.setString(2,b.getName());
			pstmt.setString(3,b.getSubject());
			pstmt.setString(4,b.getContent());
			pstmt.setInt(5, b.getNum());
			pstmt.setString(6,b.getPass());
			pstmt.setString(7,b.getIp());
			// num  name  subject content num pass ip 
			
			int result = pstmt.executeUpdate();// 잘되면 1 안되면 0
			if(result==1) {
				flag = true;
			} else {
				con.rollback();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
}
