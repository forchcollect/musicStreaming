package songcontroller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import song.model.SongService;

public class SongDeleteOkController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1 요청 파라미터 읽어오기
		String no=request.getParameter("no");

		//2
		SongService songService = new SongService();
		String msg="다시 시도하십시오", url="/song/SongDelete.do?no="+no;
		try {
				int cnt=songService.deleteSong(Integer.parseInt(no));
				if(cnt>0) {
					msg=".";
					url="/songt/playlistList1_2.do";
				} else {
					msg="? ";
			}
		}catch(SQLException e) {
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
