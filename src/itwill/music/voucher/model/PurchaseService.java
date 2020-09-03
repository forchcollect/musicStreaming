package itwill.music.voucher.model;

import java.sql.SQLException;
import java.util.List;

public class PurchaseService {
	private PurchaseDAO pDao;
	
	public PurchaseService() {
		pDao = new PurchaseDAO();
	}

	
	public int buyVoucher(PurchaseVO vo) throws SQLException {
		return pDao.buyVoucher(vo);
	}
	
	public List<PurchaseVO> showPurchase(String userid) throws SQLException {
		return pDao.showPurchase(userid);
	}
	public int deleteVoucher(int no) throws SQLException {
		return pDao.deleteVoucher(no);
		
	}
	
}
