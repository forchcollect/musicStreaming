package itwill.music.voucher.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.member.model.MemberService;
import itwill.music.member.model.MemberVO;
import itwill.musicStreaming.controller.Controller;

public class VoucherController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		
		MemberService mService = new MemberService();
		MemberVO vo = null;
		try {
			vo = mService.selectUser(id);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("vo",vo);
		return "/voucher/voucherView.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

}
