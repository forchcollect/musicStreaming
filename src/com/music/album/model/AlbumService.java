package com.music.album.model;

import java.sql.SQLException;
import java.util.List;

public class AlbumService {
	AlbumDAO dao;
	
	public AlbumService() {
		dao=new AlbumDAO();
	}
	
	public AlbumVO selectAlbumByAlbumno(int albumNo) throws SQLException {
		return dao.selectAlbumByAlbumno(albumNo);
	}
	
	public List<AlbumVO> selectAlbumSameSinger(int songno) throws SQLException {
		return dao.selectAlbumSameSinger(songno);
	}
	
	public List<AlbumVO> selectAlbumReleased() throws SQLException {
		return dao.selectAlbumReleasedDate();
	}

}
