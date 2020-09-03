package cont;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import itwill.musicStreaming.db.ConnectionPoolMgr2;

public class QueryDAO {
	private ConnectionPoolMgr2 pool;
	
	public QueryDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	/**
	 * 글등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertquery(QueryVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into query(no, id, pwd, subject, "
					+ " message, groupno )" + 
					" values(query_seq.nextval, ?,?,?,?, "
					+ " query_seq.nextval)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getMessage());
			
			int cnt=ps.executeUpdate();
			System.out.println("글 등록 결과, cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	/**
	 * 글 목록
	 * @return
	 * @throws SQLException
	 */
	public List<QueryVO> selectAll(String keyword) 
			throws SQLException{
		/*
		 ※ 검색의 경우 
		 	select * from query 
			where subject like '%subject%';
			select * from query 
			where id like '%id%';
			select * from query 
			where message like '%message%';
		*/
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<QueryVO> list = new ArrayList<QueryVO>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from query";
			if(keyword!=null && !keyword.isEmpty()) { //검색의 경우
				sql+=" where  subject  like '%' || ? || '%' "
					+ " or message like '%' || ? || '%' " ;
			}
			
			sql+=" order by groupno desc, sortno";
			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) { //검색의 경우
				ps.setString(1, keyword);				
				ps.setString(2, keyword);				
			}
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String subject=rs.getString("subject");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String message=rs.getString("message");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				int groupno=rs.getInt("groupNo");
				int step=rs.getInt("step");
				int sortno=rs.getInt("sortNo");
				
				
				QueryVO vo = new QueryVO(no, id, pwd, subject, 
						regdate, readcount, message, groupno, step, sortno );
				
				System.out.println("vo="+vo);
				
				list.add(vo);
			}
			
			System.out.println("글목록 결과 list.size="+list.size()	+", keyword="+keyword);
			
			return list;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	/**
	 * 글 상세보기
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public QueryVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		QueryVO vo=new QueryVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from query where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String subject=rs.getString("subject");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String message=rs.getString("message");
				Timestamp regdate=rs.getTimestamp("regdate");
				int readcount=rs.getInt("readcount");
				
				int groupno=rs.getInt("groupNo");
				int step=rs.getInt("step");
				int sortno=rs.getInt("sortNo");
				
				
				vo.setMessage(message);
				vo.setid(id);
				vo.setNo(no);
				vo.setPwd(pwd);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setSubject(subject);
				
				vo.setGroupNo(groupno);
				vo.setStep(step);
				vo.setSortNo(sortno);
				
			}
			
			System.out.println("글 상세보기 결과, vo="+vo+", 매개변수no="+no);
			
			return vo;
		}finally{
			pool.dbClose(con, ps, rs);
		}
	}
	
	/**
	 * 글 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateReBoard(QueryVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update query"; 
			sql+=" set id=?,subject=?,pwd=?,message=?";
			sql+=" where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getid());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getMessage());
			ps.setInt(5, vo.getNo());
			
			int cnt=ps.executeUpdate();
			System.out.println("글 수정 결과, cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update query" + 
					" set readcount=readcount+1" + 
					" where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과, cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	
	public void deletequery(QueryVO vo) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="call deletequery(?,?,?)";
			ps=con.prepareCall(sql);
			
			ps.setInt(1, vo.getNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getGroupNo());
			
			ps.executeUpdate();
			System.out.println("글 삭제  매개변수 vo="+vo);			
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	public boolean checkPwd(int no, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select pwd from query where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			boolean result=false;
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				
				if(dbPwd.equals(pwd)) {
					result=true;  //비밀번호 일치
				}
			}
			
			System.out.println("비밀번호 체크 결과, result="+result
				+", 매개변수 no="+no+", pwd="+pwd);
			
			return result;
		}finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	public int reply(QueryVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			//1,2 con
			con=pool.getConnection();
			
			//transaction 시작
			con.setAutoCommit(false); //자동 커밋 안되도록 설정
			
			//3. ps
			//[1] update
			String sql="update query" + 
					" set sortno=sortno+1" + 
					" where groupno=? and sortno>?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			//4. exec
			cnt=ps.executeUpdate();
			
			//[2] insert
			sql="insert into query(no, id, pwd, subject, message"
					+ " ,groupno, step, sortno)" + 
					" values(reboard_seq.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getid());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getMessage());
			ps.setInt(6, vo.getGroupNo());
			ps.setInt(7, vo.getStep()+1);
			ps.setInt(8, vo.getSortNo()+1);
			
			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과, cnt="+cnt
				+", 매개변수 vo="+vo);
			
			//모두 성공하면 커밋
			con.commit();
		}catch(SQLException e) {
			//하나라도 실패하면 롤백
			con.rollback();
			e.printStackTrace();
		}finally {
			//다시 자동 커밋되도록 설정
			con.setAutoCommit(true);
			
			pool.dbClose(con, ps);
		}
		
		return cnt;
	}
	
	public int updateDownCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update query" + 
					" set downcount=downcount+1" + 
					" where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("다운로드수 증가 결과, cnt="+cnt
					+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(con, ps);
		}
	}
	
	
}










