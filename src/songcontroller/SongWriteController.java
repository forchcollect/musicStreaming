package songcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class SongWriteController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/song/SongWrite.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
