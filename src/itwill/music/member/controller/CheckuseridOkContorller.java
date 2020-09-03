package itwill.music.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import itwill.music.member.model.MemberService;
import itwill.musicStreaming.controller.Controller;

public class CheckuseridOkContorller implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String userid = request.getParameter("userid");
		MemberService service = new MemberService();
		
		String msg="잘못된 URL입니다", url="/member/checkUserid.do";
		int result=0;
		
		if(userid==null || userid.isEmpty()) {
			request.setAttribute("msg", msg );
			request.setAttribute("url",url); 
			return "/common/message.jsp";
		}

		try{
			result=service.existornot(userid);
			
			if(result==MemberService.EXIST_ID) {
				msg="이미 등록된 아이디입니다. 다른 아이디를 입력하세요";
			}else if(result==MemberService.NON_EXIST_ID) {
				msg="사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요";
				url="/member/register.jsp?result=2&userid="+userid;
				request.setAttribute("result", result);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg );
		request.setAttribute("url",url);
		request.setAttribute("userid", userid);
		return "/common/message.jsp";
		

	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
