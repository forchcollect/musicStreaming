package itwill.music.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.musicStreaming.controller.Controller;

public class LoginCheckController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return null;
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

	
}
