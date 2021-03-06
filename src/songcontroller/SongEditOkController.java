package songcontroller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import song.model.SongService;
import song.model.SongVO;

public class SongEditOkController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1
		String songno=request.getParameter("songno");
		String title=request.getParameter("title");
		String singer=request.getParameter("singer");
		String lyricwriter=request.getParameter("lyricwriter");
		String songwriter=request.getParameter("songwriter");
		
		//2
		SongService songService = new SongService();
		String msg="���� ����", url="/song/SongEdit.do?no="+songno;
		try {
				SongVO vo = new SongVO();
				
				vo.setSongno(Integer.parseInt(songno));
				vo.setTitle(title);
				vo.setSinger(singer);
				vo.setLyricWriter(lyricwriter);
				vo.setSongWriter(songwriter);
				
				songService.updateSong(vo);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		//4		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
