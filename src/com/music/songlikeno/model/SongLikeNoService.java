package com.music.songlikeno.model;

import java.sql.SQLException;

public class SongLikeNoService {
	SongLikeNoDAO dao;
	
	public SongLikeNoService() {
		dao=new SongLikeNoDAO();
	}
	
	public SongLikeNoVO selectSongBySongno(int no) throws SQLException {
		return dao.selectSongBySongno(no);
	}
}
