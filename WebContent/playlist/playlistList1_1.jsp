<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../chartNav/chartNav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<style type="text/css">
body{
	float: left;
}

</style>

<title>�÷��̸���Ʈ������-����</title>
</head>
<body>
<div>
	<a href="#" onclick="FAQ������" return false;">FAQ</a>
	<a href="#" onclick="�̿��������" return false;">�̿�Ǳ���</a>	
</div>

<a href="#" class="like">���ƿ�</a>

<select name="item">
	<option value="">������</option>
	<option value="">�� ����</option>
	<option value="">�ٹ� ����</option>
	<option value="">��Ƽ��Ʈ ����</option>
</select>
<button type="button" class="lyrics" title="������ü����">���纸��</button>
</div>
<br>


<div>
<h2>������(IU) - ����(Prod.&Feat. SUGA of BTS) </h2>
<div class="thumb">
	<img src="../album_images/album19.PNG" alt="������">
</div>
<audio preload="auto" controls>
	<source src="https://www.w3schools.com/html/horse.mp3">
</audio>

<!-- ��α��� �� -->
<div class="payment">
	<p class="txt ellipsis">�α��� ��, ���� ��Ʈ������ �̿��� ������.</p>
</div>
</div>
</body>
</html>
<%@ include file="../song/playlistList1_2.jsp" %>