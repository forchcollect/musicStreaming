package itwill.music.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.musicStreaming.controller.Controller;



public class RegisterController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/member/register.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
