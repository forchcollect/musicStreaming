package album.model;

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

	public List<AlbumVO> selectAlbumAll() throws SQLException {
		return dao.selectAlbumAll();
	}
	
	public int deleteAlbum(int no) throws SQLException {
		return dao.deleteAlbum(no);
	}
	
	 public int insertAlbum(AlbumVO vo) throws SQLException {
		 return dao.insertAlbum(vo);
	 }
	 
	 public int updateAlbum(AlbumVO vo) throws SQLException {
		 return dao.updateAlbum(vo);
	 }
}
