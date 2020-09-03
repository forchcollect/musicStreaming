package itwill.music.voucher.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.voucher.model.PurchaseService;
import itwill.music.voucher.model.PurchaseVO;
import itwill.musicStreaming.controller.Controller;

public class MyMembershipController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		
		PurchaseService pService = new PurchaseService();
		List<PurchaseVO> list =null;
		userid = "홍길동";
		try {
			list = pService.showPurchase(userid);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		System.out.println("list = " + list);
		return "/voucher/myMembership.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
