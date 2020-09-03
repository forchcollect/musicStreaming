package itwill.music.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.member.model.MemberService;
import itwill.musicStreaming.controller.Controller;


public class CheckuseridController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String userid = request.getParameter("userid");
		
		if(userid!=null || !userid.isEmpty()) {
			request.setAttribute("userid", userid);
			return "/member/checkUserid.jsp";
		}
		
		request.setAttribute("userid", userid);
		return "/member/checkUserid.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	

}
