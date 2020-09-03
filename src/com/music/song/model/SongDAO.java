package com.music.song.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.music.chart.model.ChartVO;
import com.music.db.ConnectionPoolMgr2;

public class SongDAO {
	ConnectionPoolMgr2 pool;

	public SongDAO() {
		pool=new ConnectionPoolMgr2();
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
			System.out.println("차트 조회 성공! SongDAO vo="+vo);
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
			while(rs.next()) {
				SongVO vo=new SongVO();
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
			System.out.println("앨범에 속하는 곡 조회 성공! list="+list);
			return list;
			
		}finally {
			pool.dbClose(con, ps, rs);
		}
		
	}
}
