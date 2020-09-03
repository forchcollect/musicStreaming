package dowloaddb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.music.db.ConnectionPoolMgr2;

public class dowloadDAO {
private ConnectionPoolMgr2 pool;
	
	public dowloadDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertDowload(dowloadVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into dowload(songno, no, down, userno)" + 
					" values(?, dowload_seq.nextval, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, vo.getSongno());
			ps.setInt(2, vo.getDown());
			ps.setInt(3, vo.getUserno());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("占쏙옙占� 占쏙옙占� cnt="+cnt+" ,占신곤옙占쏙옙占쏙옙 vo="+vo);
		
			return cnt;
		} finally {
			pool.dbClose(con, ps);
		}
	}
	
	
	public List<dowloadVO> selectAlldowload(String condition, String keyword) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<dowloadVO> list = new ArrayList<dowloadVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from dowload";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where " + condition + " like '%' || ? || '%'";
			}
			
			sql+=" order by no desc"; 
				
			ps=con.prepareStatement(sql);

			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int songno=rs.getInt("songno");
				int no=rs.getInt("no");
				int down=rs.getInt("down");
				int userno=rs.getInt("userno");
				
				dowloadVO vo = new dowloadVO(songno, no, down, userno);
				
				list.add(vo);
			}
			return list;
			
		} finally {
			pool.dbClose(con, ps, rs);
		}
	}
	

	public int deleteBoard(int no, String pwd) throws SQLException{ 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		int n=0;
		
		try{
			//1,2
			con=pool.getConnection();
			//
			String sql="delete from board" +
					   " where no=? and pwd=?"; 
			ps=con.prepareStatement(sql); 
			
			ps.setInt(1, no); 
			ps.setString(2, pwd);
			
			//4 
			n= ps.executeUpdate(); 
			System.out.println("湲� �궘�젣 , n="+n+",�엯�젰媛� no: "+no +", pwd="+pwd);
		}finally {
			pool.dbClose(con, ps);
		}
		
		return n;
	}


	
	
}
