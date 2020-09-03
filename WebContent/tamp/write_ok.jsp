<%@page import="cont.QueryVO"%>
<%@page import="cont.QueryDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
<%
	//write.jsp에서 post방식으로 서브밋
	//1.
	request.setCharacterEncoding("utf-8");
	String subject=request.getParameter("subject");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String message=request.getParameter("message");
	
	
	//2.
	QueryDAO dao = new QueryDAO();
	QueryVO vo = new QueryVO();
	vo.setMessage(message);
	vo.setid(id);
	vo.setPwd(pwd);
	vo.setSubject(subject);
	
	int cnt = 0;
	try{
		cnt =dao.insertquery(vo);		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.
	if(cnt>0){%>
		<script type="text/javascript">
			alert('글 등록되었습니다.');
			location.href="list.jsp";
		</script>	
  <%}else{%>
		<script type="text/javascript">
			alert('글 등록 실패!');
			history.back();
		</script>
  <%}
%>
</body>
</html>


