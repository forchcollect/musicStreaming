package dowloadcontroller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dowloaddb.dowloadService;
import dowloaddb.dowloadVO;

public class DowloadDetailController implements Controller {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 1 �Ķ���� ��û �о����
		String no = request.getParameter("no");
		String condition=request.getParameter("condition");
		String keyword=request.getParameter("keyword");
		
		// 2 db�۾�
		dowloadService dowloadService = new dowloadService();
		dowloadVO vo = null;
		
		List<dowloadVO> list=null;
		try {
			 list=dowloadService.selectAlldowload(condition, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 3 request�� ����
		request.setAttribute("list", list);
		// 4 ��������
		return "/dowload/dowloadDetail.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
