package com.music.song.model;

import java.sql.SQLException;
import java.util.List;

import com.music.album.model.AlbumVO;

public class SongService {
	SongDAO dao;
	
	public SongService() {
		dao=new SongDAO();
	}
	
	public SongVO selectSongBySongno(int no) throws SQLException {
		return dao.selectSongBySongno(no); 
	}
	
	public List<SongVO> selectSongsInAlbum(int albumno) throws SQLException {
		return dao.selectSongsInAlbum(albumno);
	}
}
