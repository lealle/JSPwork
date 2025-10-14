package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class VoteDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String sql;
	
	// 목록중 가장 큰 번호 값 가져오기
	public int getMaxNum() {
		int maxNum =0;
		VoteList vlist = new VoteList();
		try {
			con = pool.getConnection();
			sql="select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return maxNum;
	}
	
	
	

	// 설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			// default 로 sysdate 넣어도 됨
			sql="insert into votelist values(seq_vote.nextval, ?, ?, ?, sysdate, ?, default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();// 잘되면 1 안되면 0
			int result2=0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
				pstmt = con.prepareStatement(sql);
				String[] item = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i]==null|| item[i].equals(""))
						break;
					
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				
				}
			
			}
			if(result2==1) {
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


	// 전체 설문 목록 가져오기
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			// default 로 sysdate 넣어도 됨
			sql="select * from votelist order by num desc";
			pstmt = con.prepareStatement(sql);
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
			rs = con.createStatement().executeQuery(sql);
			// 한줄로 줄일 수 있음
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt(1));
				vlist.setQuestion(rs.getString(2));
				vlist.setSdate(rs.getString(3));
				vlist.setEdate(rs.getString(4));
				vlist.setWdate(rs.getString(5));
				vlist.setType(rs.getInt(6));
				vlist.setActive(rs.getInt(7));
				alist.add(vlist);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}

// 설문폼의 질문과 type 가져오기
	public VoteList getVote(int num) {
		VoteList vlist = new VoteList();
		try {
			con = pool.getConnection();
			if(num == 0)
				sql="select * from votelist order by num desc";
			else
				sql="select * from votelist where num = "+num;
			
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {				
				vlist.setQuestion(rs.getString(2));
				vlist.setType(rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return vlist;
	}
	
	
	
	
	// 설문폼의 item 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			if(num == 0)
				sql="select item from voteitem where listnum = " + getMaxNum();
			else
				sql="select item from voteitem where listnum = "+num;
			
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {				
				alist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}
		
	public boolean updateCount(int listnum, String[] itemnum) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql="update voteitem set count = count+1 where listnum =? and itemnum=? " ;
			pstmt = con.prepareStatement(sql);
			if(listnum == 0)
				listnum = getMaxNum();
			
			for(int i=0; i<itemnum.length; i++) {
				if(itemnum[i]==null|| itemnum[i].equals("")) 
					break;
				
				pstmt.setInt(1, listnum);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate();
				// select 제외 executeUpdate 사용 (delete update 등등...
				if(result > 0)
					flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return flag;
	}

	// listnum의 전체 count가져오기
	public int sumCount(int num) {
		int count = 0;
		try {
			con = pool.getConnection();
			sql="select sum(count) from voteitem where listnum = ?";
			pstmt = con.prepareStatement(sql);
			if(num == 0)
				num = getMaxNum();
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
			
			
			// sql="select (sum)count from voteitem where listnum = " + num;
			// count = Integer.parseInt(rs.getString(1)); 으로 할 수 있는지 테스트 해보기-> 더 짧게 할 수 있다 함 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return count;
	}
	// listnum의 각각의 item과 count 가져오기
	public ArrayList<VoteItem> getItemCount(int num) {
		ArrayList<VoteItem> alist = new ArrayList<>();
		try {
			con = pool.getConnection();
			if(num == 0)
				sql="select item, count from voteitem where listnum = " + getMaxNum();
			else
				sql="select item, count from voteitem where listnum = "+num;
			
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				String item[] = new String[1];
				item[0] = rs.getString(1);
				vitem.setItem(item);
				vitem.setCount(rs.getInt(2));
				alist.add(vitem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}















}
