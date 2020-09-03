<%@page import="com.sun.org.apache.bcel.internal.generic.LSTORE"%>
<%@page import="model.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	  
	List<MemberVO> list =(List<MemberVO>)request.getAttribute("memberlist");
	//3. 결과 처리
	DecimalFormat df = new DecimalFormat("###-####-####");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<h1>회원목록</h1>
<table border="1" style="width:500px">
	<tr>
		<th>회원번호</th>
		<th>회원아이디</th>
		<th>회원비밀번호</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>탈퇴일</th>
	</tr>
	
	<tr>
	<%if(list.size()<1){%>
		<td colspan="7">회원이 존재하지 않습니다.</td>
	<%}else{%>
	</tr>
	
	<% 	for(int i=0;i<list.size();i++){
		MemberVO vo =list.get(i); %>
			<tr>
				<td><%=vo.getUserno() %></td>
				<td><a href ="<%=request.getContextPath() %>/member/memberdetail.do?id=<%=vo.getId() %>"></a></td>
				<td style="text-align: right"><%=vo.getPwd() %></td>
				<td><%=vo.getHp() %></td>
				<td><%=vo.getEmail() %></td>
				<td><%=sdf.format(vo.getRegdate()) %></td>
				<td><%=sdf.format(vo.getLeavedate()) %></td>
	
			</tr>
	<%	}//for
	
	}%>
	
	
	<!-- 반복 끝 -->
</table>
<hr>
<a href="">관리자 홈</a>




