package login.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberService;
import model.MemberVO;

public class LoginOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id=request.getParameter("loginId");
		String pwd=request.getParameter("password");
		String keepLogin=request.getParameter("keepLogin");
		MemberService memService = new MemberService();
		
		
		
		String msg="로그인 처리 실패!", url="/login/login.jsp";
		try{
			int result=memService.loginCheck(id, pwd);
			if(result==MemberService.LOGIN_OK){ //로그인 성공
				MemberVO vo=memService.selectUser(id);
			
				//[1] 세션에 저장
				request.setAttribute("id", id);
				
				//[2] 쿠키에 저장
				if(keepLogin!=null){ //체크한 경우-on
					Cookie ck = new Cookie("ck_id", id);
					ck.setMaxAge(1000*24*60*60); //쿠키 유효기간 : 1000일
					ck.setPath("/"); //지정한 경로와 하위 경로에 쿠키 전송
					response.addCookie(ck);					
				}else{//체크하지 않은 경우-null
					Cookie ck = new Cookie("ck_id", id);
					ck.setMaxAge(0); //쿠키 유효기간 : 0 => 쿠키 제거됨
					ck.setPath("/"); //지정한 경로와 하위 경로에 쿠키 전송
					response.addCookie(ck);
				}
				
				msg=vo.getId()+ "님 로그인되었습니다.";
				url="/main.jsp";
			}else if(result==MemberService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
				url="/login/login.do";
			}else if(result==MemberService.ID_NONE){
				msg="해당 아이디가 존재하지 않습니다.";				
				url="/login/login.do";
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		
		return false; // forward
	}

}
