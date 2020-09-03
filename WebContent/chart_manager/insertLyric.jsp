<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="insertLyric_ok.jsp"><br>
		songno를 입력하세요.
		<input type="text" name="no"><br><br>
		가사를 입력하세요.<br>
		<textarea name="lyric"></textarea>
		<input type="submit" value="insert 하기"> 
	</form>
<jsp:include page="selectLyricWhereNull.jsp" flush="false"/>
</body>
</html>