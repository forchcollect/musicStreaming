package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session=request.getSession();
		session.invalidate();
		response.sendRedirect("/index.jsp");
		
		return null;
	}

	@Override
	public boolean isRedirect() {
		
		
		return false;
	}

}
