package itwill.music.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itwill.music.member.model.MemberService;
import itwill.music.member.model.MemberVO;
import itwill.musicStreaming.controller.Controller;

public class RegisterOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberService service = new MemberService();
		MemberVO vo= null;
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
			
		String msg="다시시도해주세요.", url="/member/register.do";				
		try {
			int cnt = service.insertUser(vo);
			if(cnt>0) {
				msg="회원가입되었습니다.";
				url="/login/login.jsp?id="+id;  // 홈화면
				
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}


}
