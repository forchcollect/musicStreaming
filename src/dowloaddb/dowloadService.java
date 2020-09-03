package dowloaddb;

import java.sql.SQLException;
import java.util.List;

public class dowloadService {
	private dowloadDAO dowloadDao;
	
	public dowloadService() {
		dowloadDao = new dowloadDAO();
	}
	
	public int insertDowload(dowloadVO vo) throws SQLException {
		int cnt=dowloadDao.insertDowload(vo);
		return cnt;
	}
	
	public List<dowloadVO> selectAlldowload(String condition, String keyword) throws SQLException {
		return dowloadDao.selectAlldowload(condition, keyword);
	}
	
	
}
