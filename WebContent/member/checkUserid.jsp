<%@page import="model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memService" 
	class="model.MemberService" 
	scope="session"></jsp:useBean>    
<%
	String userid=request.getParameter("userid"); 
	/* String id = request.getParameter("id");
    if(id==null || id.isEmpty()) { id="";}	 */
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	
	$(function(){
		$('form[name=frmDup]').submit(function(){
			if($('#userid').val().length<1){
				alert('아이디를 입력하세요');
				$(this).focus();
				event.preventDefault();
			}

		});
		
	});


	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#userid').val("<%=userid%>");
			$(opener.document).find('#chkId').val("Y");
			
			self.close();			
		});
		
	});
	
</script>
</head>
<body>
	<h1>아이디 중복 검사</h1>	
	<form name="frmDup" method="post" action="<%=request.getContextPath() %>/member/checkUserid.do">
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" value="<%=userid%>">
		<input type="submit" value="확인">
		
		<%
		if(request.getParameter("result")!= null || !request.getParameter("result").isEmpty()){
			int result  = (int)request.getAttribute("result");
			if(result==MemberService.EXIST_ID){ %>
				<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
			<%}else if(result==MemberService.NON_EXIST_ID){ %>
				<input type="button" value="사용하기" id="btUse">
				<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
			<%} 
		}%>
	</form>
</body>
</html>





