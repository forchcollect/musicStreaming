package login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String ckUserid="";
		
		Cookie[] ckArr=request.getCookies();
		if(ckArr!=null){
			for(int i=0;i<ckArr.length;i++){
				String cName = ckArr[i].getName();
				if(cName.equals("loginId")){
					ckUserid=ckArr[i].getValue();
					break;
				}
			}
		}
		
		
		
		
		
		
		return "/login/login_ok.do";
	}

	@Override
	public boolean isRedirect() {
		
		
		return true; //redirect
	}

}
