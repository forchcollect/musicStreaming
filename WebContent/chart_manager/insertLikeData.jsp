<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertLikeData_ok.jsp">
		<label>입력할 데이터의 no</label><input type="text" name="songno"><br>
		<label>좋아요수</label><input type="text" name="likeno"><br><br>
		
		<span>발매일부터 현재 날짜까지 자동으로 날짜가 들어감</span><br>
		<input type="submit" value="insert 하기">
	</form>
</body>
</html>