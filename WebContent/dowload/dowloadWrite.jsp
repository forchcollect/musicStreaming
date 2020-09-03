<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>다운로드</h1>
<form name="frm1" method="post" action="dowloadWrite_ok.jsp"> 
	<div>제목(곡명):  <input type="text" name="id"><br> </div>
	<div>작성자:  <input type="text" name="id"><br> </div>
	<div>비밀번호:  <input type="text" name="id"><br> </div>	
	<div>파일 업로드 : <input type="file" name="fileName" size="30"><br> 
	<input type = "submit" value="등록"><br> 
	<input type = "Button" class="btList" value="글목록"  />
</form>


</body>
</html>