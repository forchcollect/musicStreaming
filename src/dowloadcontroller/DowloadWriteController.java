package dowloadcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class DowloadWriteController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			return "/dowload/dowloadWrite.do";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
