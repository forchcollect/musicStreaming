package playlistcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class PlaylistListController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//1 요청 파라미터 읽어오기
		
		//2 db작업
		
		
		//3 request 저장
		
		
		//4 화면처리
		return "/playlist/playlistList.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}
	
}