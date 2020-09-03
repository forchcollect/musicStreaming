package songcontroller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import song.model.SongService;
import song.model.SongVO;

public class SongEditController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String songno =request.getParameter("songno");
		if(songno==null || songno.isEmpty()) {
			request.setAttribute("msg", "�߸��� �ּ�");
			request.setAttribute("url", "/song/playlistList1_2.do");
			
			return "/common/message.jsp";
		}
		
		
		SongService songService = new SongService();
		SongVO vo = new SongVO();
		
		try {
			songService.selectSongBySongno(Integer.parseInt(songno));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("vo", vo);
		
		return "/song/SongEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
