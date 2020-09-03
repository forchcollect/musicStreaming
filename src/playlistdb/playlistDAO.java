package playlistdb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PresentationDirection;

import com.music.db.ConnectionPoolMgr2;


public class playlistDAO{
	private ConnectionPoolMgr2 pool;
	
	public playlistDAO() {
		pool= new ConnectionPoolMgr2();
	}
	
	public int insertPlayList(playlistVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			
			con=pool.getConnection();
			
			String sql="insert into playlists(userno, songno, playlistno, playtime, play, cart, mv)" + 
					" values(playlists_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, vo.getSongno());
			ps.setInt(2, vo.getPlaylistno());
			ps.setInt(3, vo.getPlaytiem());
			ps.setString(4, vo.getPlay());
			ps.setString(5, vo.getCart());
			ps.setString(6, vo.getMv());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("cnt= "+cnt+" ,vo "+vo);
		
			return cnt;
			
		} finally {
			pool.dbClose(con, ps);
		}
	}
	
	
	public List<playlistVO> selectAllPlayList(playlistVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<playlistVO> list = new ArrayList<playlistVO>();
		try {
			con=pool.getConnection();
			
			String sql = "select * from playlists";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
			    playlistVO vo1 = new playlistVO();
				vo1.setUserno(rs.getInt("userno"));
				vo1.setSongno(rs.getInt("songno"));
				vo1.setPlaylistno(rs.getInt("playlistno"));
				vo1.setPlaytime(rs.getInt("playtime"));
				vo1.setPlay(rs.getString("play"));
				vo1.setCart(rs.getString("cart"));
				vo1.setMv(rs.getString("mv"));
				
				list.add(vo1);
			}
			return list;
		} finally {
			pool.dbClose(con, ps, rs);
		}
	}
	
	
	public playlistVO selectByNoPlayList(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		playlistVO vo = new playlistVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from playlists" + 
					   " where playlistno=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int userno=rs.getInt("userno");
				int songno=rs.getInt("songno");
				int playlistno=rs.getInt("playlistno");
				int playtime=rs.getInt("playtime");
				String play=rs.getString("play");
				String cart=rs.getString("cart");
				String mv=rs.getString("mv");
				
				vo.setUserno(userno);
				vo.setSongno(songno);
				vo.setPlaylistno(playlistno);
				vo.setPlaytime(playtime);
				vo.setPlay(play);
				vo.setCart(cart);
				vo.setMv(mv);
			}
			
			System.out.println("vo="+vo+" ,no="+no);
		
			return vo;
		} finally {
			pool.dbClose(con, ps, rs);
		}

	}
	
	
		public int updatePlayList(playlistVO vo) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			
			try {
				con=pool.getConnection();
				
				String sql="update playlists" + 
						" set playtime=?, cart=?, mv=?" + 
						" where playlistno=?";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, vo.getPlaytiem());
				ps.setString(2, vo.getCart());
				ps.setString(3, vo.getMv());
				ps.setInt(4, vo.getPlaylistno());
				
				int cnt=ps.executeUpdate();
				System.out.println("cnt="+cnt+" ,vo="+vo);
				
				return cnt;
				
			} finally {
				pool.dbClose(con, ps);
			}
		}	
			
			
		public int deletePlayList(int no) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			
			int cnt=0;
			
			try {
				con=pool.getConnection();
				
				String sql="delete from playlists" + 
						" where playlistno=?";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, no);

				cnt=ps.executeUpdate();
				System.out.println("cnt="+cnt+" ,no="+no);
			} finally {
				pool.dbClose(con, ps);
				
				return cnt;
			}
		}

}
