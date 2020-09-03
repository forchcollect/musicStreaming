package playlistdb;

import java.sql.SQLException;
import java.util.List;

public class playlistService {
	private playlistDAO playlistDao;
	
	public playlistService() {
		playlistDao=new playlistDAO();
	}
	
	public int insertPlayList(playlistVO vo) throws SQLException {
		int cnt=playlistDao.insertPlayList(vo);
		return cnt;
	}
	
	public List<playlistVO> selectAllPlayList(playlistVO vo) throws SQLException {
		return playlistDao.selectAllPlayList(vo);
	}
	
	public playlistVO selectByNoPlayList(int no) throws SQLException {
		return playlistDao.selectByNoPlayList(no);
	}
	
	public int updatePlayList(playlistVO vo) throws SQLException {
		return playlistDao.updatePlayList(vo);
	}
	
	public int deletePlayList(int no) throws SQLException {
		return playlistDao.deletePlayList(no);
	}
}
