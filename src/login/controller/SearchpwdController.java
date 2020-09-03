package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchpwdController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		
		return "/member/Searchpwd_ok.do";
	}

	@Override
	public boolean isRedirect() {
		return true;//Redirect
	}

}
