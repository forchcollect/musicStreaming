package itwill.music.voucher.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.voucher.model.PurchaseService;
import itwill.music.voucher.model.PurchaseVO;
import itwill.musicStreaming.controller.Controller;

public class VoucherWindowOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String membership = request.getParameter("membership");
		String price = request.getParameter("price");
		System.out.println("돈 받아오기 = "+ price);
		int vPrice = Integer.parseInt(price);
		Cookie[] ckArr = request.getCookies();
		String id="";
		if(ckArr!=null){ 
			for(int i=0;i<ckArr.length;i++){ 
				if(ckArr[i].getName().equals("id")){ 
					id = ckArr[i].getValue();
				}
			} 

		}//for 
		
		id ="홍길동";

		PurchaseService pService = new PurchaseService();
		PurchaseVO vo= new PurchaseVO();
		vo.setPrice(vPrice);
		vo.setVoucherName(membership);
		vo.setUserid(id);
		String msg="구매 실패", url="/voucher/voucherWindow.do";
		try {
			int cnt = pService.buyVoucher(vo);
			if(cnt>0) {
				msg="구매 성공";
				url="/voucher/myMembership.do";
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
		return false;
	}

}
