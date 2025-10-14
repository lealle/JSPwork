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
	
	// 다음시간을 위해 형태 옮겨둠
	public ArrayList<Board> getBoard() {
		ArrayList<Board> board = new ArrayList<>();
		try {
			con = pool.getConnection();
			sql="select * from board";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt(1));
				b.setName(rs.getString(2));
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
}
