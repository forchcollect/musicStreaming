package song.model;

import java.sql.SQLException;
import java.util.List;

public class SongService {
	SongDAO dao;
	
	public SongService() {
		dao=new SongDAO();
	}
	
	public int insertSong(SongVO vo) throws SQLException {
		return dao.insertSong(vo);
	}
	
	public int updateSong(SongVO vo) throws SQLException {
		return dao.updateSong(vo);
	}
	
	public int deleteSong(int no) throws SQLException {
		return dao.deleteSong(no);
	}
	
	public SongVO selectSongBySongno(int no) throws SQLException {
		return dao.selectSongBySongno(no); 
	}
	
	public List<SongVO> selectSongsInAlbum(int albumno) throws SQLException {
		return dao.selectSongsInAlbum(albumno);
	}
	
	 public List<SongVO> selectSongAll() throws SQLException {
		 return dao.selectSongAll();
	 }
}
