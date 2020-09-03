<%@page import="cont.QueryVO"%>
<%@page import="cont.QueryDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//reply.jsp에서 post방식으로 서브밋
	//1
	request.setCharacterEncoding("utf-8");
	String subject=request.getParameter("subject");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String message=request.getParameter("message");
	String groupNo=request.getParameter("groupNo");
	String step=request.getParameter("step");
	String sortNo=request.getParameter("sortNo");
	
	//2
	QueryDAO dao = new QueryDAO();
	QueryVO vo=new QueryVO();
	vo.setMessage(message);
	vo.setPwd(pwd);
	vo.setSubject(subject);
	vo.setSortNo(Integer.parseInt(sortNo));
	vo.setStep(Integer.parseInt(step));
	vo.setGroupNo(Integer.parseInt(groupNo));
	
	int cnt=0;
	try{
		cnt=dao.reply(vo);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	if(cnt>0){ %>
		<script type="text/javascript">
			alert("답변하기 성공!");
			location.href="list.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("답변하기 실패!");
			history.back();
		</script>		
	<%}
%>
</body>
</html>