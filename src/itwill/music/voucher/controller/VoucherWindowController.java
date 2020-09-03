package itwill.music.voucher.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.musicStreaming.controller.Controller;

public class VoucherWindowController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int price =Integer.parseInt(request.getParameter("price"));
		String vName="";
		
		String msg="선택해주셔야 합니다", url="/voucher/voucherView.do";
		if(request.getParameter("price")==null || request.getParameter("price").isEmpty()) {
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/common/message.jsp";
		}
		if(price==1) {
			msg="잘 못 선택하셨습니다";
			url="/voucher/voucherView.do";
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/common/message.jsp";
		}else if(price==0) {
			vName="TB 첫 달 무료 이용권";
		}else if(price==5500) {
			vName="TB 일년 이용권";
			
		}else if(price==6000) {
			vName="TB 한 달 이용권";
		}
		
		request.setAttribute("vName", vName);
		request.setAttribute("price", price);
		return "/voucher/voucherWindow.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
