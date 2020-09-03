<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>

<html>
<style>


</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css" />
</head>
<style>

legend{
margin-bottom: 30px;
font-size: 20px;
font-weight: bold;
text-align: center;
}

</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=authForm]').submit(function(){
			if($('#loginId').val().length<1){
				alert('아이디를 입력하세요');
				$(this).focus();
				event.preventDefault();
			}else if($('#loginPw').val().length<1){
				alert('비밀번호를 입력하세요');
				$(this).focus();
				event.preventDefault();
			}
			
		});
		
	});
	
</script>
<%
	//회원아이디저장  > 쿠키읽어오기
	
String ckUserid="";
	
	
%>
<body>
<form method="post" name ="authForm" action="/login/login_ok.do ">
<!--     <input type="hidden" name="redirectUrl" value=" ">
 -->    <fieldset>
      <legend >로그인</legend>
      <div class="box_login">
        <div class="inp_text">
          <label for="loginId" class="screen_out">아이디</label>
          <input type="text" id="loginId" name="loginId" placeholder="ID" value="<%=ckUserid %>">
        </div>
        <div class="inp_text">
          <label for="loginPw" class="screen_out">비밀번호</label>
          <input type="password" id="loginPw" name="password" placeholder="Password" >
        </div>
      </div>
      <input type="submit" class="btn_login" value="click me"  style="text-align: center; font-size: 14px;">
      <div class="login_append">
      
        <div class="inp_chk"> 
          <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin"
          <%if(ckUserid!=null && !ckUserid.isEmpty()){ %>	
						checked="checked"
					<%} %>	>
          <label for="keepLogin" class="lab_g">아이디 저장 </label>
          
        </div>
        <span class="txt_find">
           <a href="<%=request.getContextPath() %>/login/searchid_ok.do" class="link_find">아이디</a>
            / 
           <a href="<%=request.getContextPath() %>/login/searchpwd_ok.do" class="link_find"> 비밀번호 찾기</a>
               / 
           <a href="<%=request.getContextPath() %>/member/register_ok.do" class="link_find"> 회원가입</a>
         </span>
      </div>
      
    </fieldset>
  </form>
</body>
</html>