package board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDao {
//	public static void main(String[] args) {
//	new BoardDao.insert();
//	}
	
	
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	// total레코드 수
	public int getTotalRecord(String keyField, String keyWord) {
		int totalRecord = 0;	
		try {
			con = pool.getConnection();
			if(keyWord.equals("") || keyWord == null) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next())
				totalRecord = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalRecord;
	}
	
	// 게시판 목록 가져오기
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<>();	
		try {
			con = pool.getConnection();
			if(keyWord.equals("") || keyWord==null) {
				sql = "select * from (select ROWNUM as RNUM, BT1.* from (select * from board order by ref desc, pos) BT1) where RNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from (select ROWNUM as RNUM, BT1.* from (select * from board order by ref desc, pos) BT1 where " + keyField + " like ?) where RNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board bean = new Board();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 조회수 증가
	public void upCount(int num) {
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num=" + num;
			con.createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	// num에 해당하는 게시물 얻어오기
	public Board getBoard(int num) {
		Board bean = new Board();
		try {
			con = pool.getConnection();
			sql = "select * from board where num="+num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 게시물 수정
	public void updateBoard(Board bean) {
		try {
			con = pool.getConnection();
			sql = "update board set name=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	public int deleteBoard(int num) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from board where ref="+num;
			rs = con.createStatement().executeQuery(sql);
			
			if(rs.next()) {
				if(rs.getInt(1) <= 1) {
					sql = "delete board where num="+num;
					result = con.createStatement().executeUpdate(sql);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return result;
	}
	// 게시글쓰기
	public int insertBoard(Board board) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into board values(SEQ_BOARD.NEXTVAL,?,?,?,0,SEQ_BOARD.CURRVAL,0,SYSDATE,?,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			result = pstmt.executeUpdate();				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return result;
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
	
	
	public void replyBoard(Board board) {
		try {
			con = pool.getConnection();
			
			sql = "insert into board values(?,?,?,?,?,?,?,SYSDATE,?,?,default,0,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNextNum()+1);
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getPos()+1);
			pstmt.setInt(6, board.getRef());
			pstmt.setInt(7, board.getDepth()+1);
			pstmt.setString(8, board.getPass());
			pstmt.setString(9, board.getIp());
			
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
// ref 가 지정한것보다 큰것이 있을 경우 다 +1 하고 빈 자리 차지
// depth 는 지정한거 +1 
// 
	// 게시물 수정
		public void updateRef(int ref, int pos) {
			int result=0; 
			try {
				con = pool.getConnection();
				sql = "update board set pos = pos +1 where ref=? and pos>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, pos);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
		}
		
	
	
	// 
	public ArrayList<Board> getList2() {
		ArrayList<Board> alist = new ArrayList<>();	
		try {
			con = pool.getConnection();
			sql = "";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}

	
	public void insert() {
		try {
			con = pool.getConnection();
			sql = "insert into board(?, '이름', '제목', '내용', 0, ?, 0, sysdate, '1234', null, default, 0, 0) values()";
			pstmt = con.prepareStatement(sql);
			for(int i=500; i<650; i++) {
				pstmt.setInt(1, i);
				pstmt.setInt(2, i);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
}