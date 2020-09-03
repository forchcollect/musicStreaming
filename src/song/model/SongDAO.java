package song.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.music.db.ConnectionPoolMgr2;



public class SongDAO {
	ConnectionPoolMgr2 pool;

	public SongDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertSong(SongVO vo) throws SQLException {
	      Connection con=null;
	      PreparedStatement ps=null;
	      
	      try {
	         //1,2
	         con=pool.getConnection();
	         
	         //3
	         String sql="insert into song (songno, albumno, title, singer, lyricwriter, songwriter)" 
	         		    + " values(?, ?, ?, ?, ?, ?)";
	         ps=con.prepareStatement(sql);
	         
	         ps.setInt(1, vo.getSongno());
	         ps.setInt(2, vo.getAlbumno());
	         ps.setString(3, vo.getTitle());
	         ps.setString(4, vo.getSinger());
	         ps.setString(5, vo.getLyricWriter());
	         ps.setString(6, vo.getSongWriter());
	       
	         
	         int cnt=ps.executeUpdate();
	         System.out.println("��� ���, cnt="+cnt+", �Ű����� vo="+vo);
	         
	         return cnt;
	      }finally {
	         pool.dbClose(con, ps);
	      }
	   }
		   

	   public int updateSong(SongVO vo) throws SQLException {
	      Connection con=null;
	      PreparedStatement ps=null;
	      
	      try {
	         //1,2
	         con=pool.getConnection();
	         
	         //3
	         String sql="update song" 
	         		+ " set title=?, singer=?, lyricwriter=?, songwriter=?"
	         		+ " where songno=?";
	         ps=con.prepareStatement(sql);
	         
	         ps.setString(1, vo.getTitle());
	         ps.setString(2, vo.getSinger());
	         ps.setString(3, vo.getLyricWriter());
	         ps.setString(4, vo.getSongWriter());
	         ps.setInt(5, vo.getSongno());
	         
	         int cnt=ps.executeUpdate();
	         System.out.println("���� ���, cnt="+cnt+", �Ű����� vo="+vo);
	         
	         return cnt;
	      }finally {
	         pool.dbClose(con, ps);
	      }
	   }
	   
	   public int deleteSong(int no) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			
			try {
				con=pool.getConnection();
				
				String sql="delete from song"  
						+ " where songno=?";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, no);
				
				int cnt=ps.executeUpdate();
				System.out.println("���� ���� ����, cnt="+cnt+", songno="+no);
				
				return cnt;
			}finally {
				pool.dbClose(con, ps);
			}
		}
	
	   public List<SongVO> selectSongAll() throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			List<SongVO> list = null;
			try {
				con=pool.getConnection();
				
				String sql="select * from ";
				ps=con.prepareStatement(sql);

				rs=ps.executeQuery();
			
				list=new ArrayList<SongVO>();
				
				while(rs.next()) {
					SongVO vo=new SongVO();
					int songno=rs.getInt("songno");
					int albumno=rs.getInt("albumno");
					String title=rs.getString("title");;
					String singer=rs.getString("singer");;
					String lyricWriter=rs.getString("lyricWriter");;
					String songWriter=rs.getString("songWriter");;
					String songEditer=rs.getString("songEditer");;
					String lyric=rs.getString("lyric");;
					
					vo.setSongno(songno);
					vo.setAlbumno(albumno);
					vo.setTitle(title);
					vo.setSinger(singer);
					vo.setLyricWriter(lyricWriter);
					vo.setSongWriter(songWriter);
					vo.setSongEditer(songEditer);
					vo.setLyric(lyric);
					
					list.add(vo);
				}
				System.out.println("��ȸ ����! Album vo="+list.size());
				return list;
				
			}finally {
				pool.dbClose(con, ps, rs);
			}
			
		}   
	   
	   
	public SongVO selectSongBySongno(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from song where songno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			
			SongVO vo=new SongVO();
			while(rs.next()) {
				int songno=rs.getInt("songno");
				int albumno=rs.getInt("albumno");
				String title=rs.getString("title");
				String singer=rs.getString("singer");
				String lyricWriter=rs.getString("lyricwriter");
				String songWriter=rs.getString("songwriter");
				String songEditer=rs.getString("songediter");
				String lyric=rs.getString("lyric");
				
				vo.setAlbumno(albumno);
				vo.setLyric(lyric);
				vo.setLyricWriter(lyricWriter);
				vo.setSinger(singer);
				vo.setSongEditer(songEditer);
				vo.setSongno(songno);
				vo.setSongWriter(songWriter);
				vo.setTitle(title);
				
			}
			System.out.println("��Ʈ ��ȸ ����! SongDAO vo="+vo);
			return vo;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}

	public List<SongVO> selectSongsInAlbum(int albumno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select * from song where albumno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, albumno);
			
			rs=ps.executeQuery();
			
			List<SongVO> list=new ArrayList<SongVO>();
			SongVO vo=new SongVO();
			while(rs.next()) {
				int songno=rs.getInt("songno");
				String title=rs.getString("title");
				String singer=rs.getString("singer");
				String lyricWriter=rs.getString("lyricwriter");
				String songWriter=rs.getString("songwriter");
				String songEditer=rs.getString("songediter");
				String lyric=rs.getString("lyric");
				
				vo.setLyric(lyric);
				vo.setLyricWriter(lyricWriter);
				vo.setSinger(singer);
				vo.setSongEditer(songEditer);
				vo.setSongno(songno);
				vo.setSongWriter(songWriter);
				vo.setTitle(title);
				
				list.add(vo);
				
			}
			System.out.println("�ٹ��� ���ϴ� �� ��ȸ ����! SongDAO vo="+vo);
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
}
