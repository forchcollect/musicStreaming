<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.music.chart.model.ChartVO"%>
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
	
	List<ChartVO> list=null;
	LyricDAO dao = new LyricDAO();
	ChartVO vo=new ChartVO();
	try{
		list=dao.selectLyricNull();
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	%>
	<table>
	<tr>
		<td>가수명</td>
		<td>곡명</td>
		<td>번호</td>
	</tr>
	
	<%if(list!=null && !list.isEmpty()) {
		for(int i=0;i<list.size();i++) {
			vo=list.get(i); %>
			<tr>
				<td><%=vo.getS_singer() %></td>
				<td><%=vo.getS_title() %></td>
				<td><%=vo.getSongno() %></td>
			</tr>
		<%}
	}
%>

</table>
</body>
</html>