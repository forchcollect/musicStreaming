package songcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class SongDeleteController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String no=request.getParameter("songno");
		if(no==null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 URL입니다.");
			request.setAttribute("url", "/song/playlistList1_2.do");
			
			return "/common/message.jsp";
		}
		
		//2 db작업
		//3 request 저장
		//4 뷰처리
		return "/song/SongDelete.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
