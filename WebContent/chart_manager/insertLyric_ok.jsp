<%@page import="java.sql.SQLException"%>
<%@page import="com.music.common.LyricDAO"%>
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
	request.setCharacterEncoding("utf-8");
	String no=request.getParameter("no");
	String lyric=request.getParameter("lyric");
	
	LyricDAO insLy = new LyricDAO();
	try{
		int cnt=insLy.inserLyric(Integer.parseInt(no), lyric);
		
		if(cnt>0) {
	System.out.println("songdatano에 lyric 데이터가 입력되었습니다.");
%>
			
			<script type="text/javascript">
				alert('데이터 입력 완료!');
			</script>
	<% }
	}catch(SQLException e) {
		e.printStackTrace();
	}%>
	<script type="text/javascript">
		location.href="insertLyric.jsp";
	</script>
</body>
</html>