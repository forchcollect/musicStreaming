package songcontroller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.music.common.PagingVO;

import controller.Controller;
import song.model.SongService;
import song.model.SongVO;

public class SongListController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//1 �Ķ���� ��û �о����
		String no = request.getParameter("no");
		String condition=request.getParameter("searchCondition");
		String keyword=request.getParameter("searchKeyword");
		
		//2 db�۾�
		SongService songService = new SongService();
		
		List<SongVO> list=null;
		
		try {
			list=songService.selectSongAll();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		int pageSize=5, blockSize=10;
		int currentPage=1;
		if(request.getParameter("currentPage")!=null &&
				!request.getParameter("currentPage").isEmpty()) {
			currentPage
				=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int totalRecord=0;
		if(list!=null) {
			totalRecord=list.size();
		}
		
		PagingVO pageVo 
		= new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
		//3
		System.out.println("pagevo= " + pageVo);
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		
		//4		
		return "/playlist/playList2.jsp";
	}



	@Override
	public boolean isRedirect() {
		
		return false;
	}
	
}