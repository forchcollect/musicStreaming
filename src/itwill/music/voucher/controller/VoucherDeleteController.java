package itwill.music.voucher.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.voucher.model.PurchaseService;
import itwill.musicStreaming.controller.Controller;

public class VoucherDeleteController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no = request.getParameter("no");
		
		PurchaseService pService = new PurchaseService();
		String msg="삭제 실패 했습니다", url="/voucher/cancelVoucher.do";
		try {
			int cnt = pService.deleteVoucher(Integer.parseInt(no));
			
			if(cnt>0) {
				msg="삭제 성공";
				url="/voucher/cancelVoucher.do";
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		

		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

}
