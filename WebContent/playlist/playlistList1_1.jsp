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

<title>플레이리스트페이지-슬난</title>
</head>
<body>
<div>
	<a href="#" onclick="FAQ페이지" return false;">FAQ</a>
	<a href="#" onclick="이용권페이지" return false;">이용권구매</a>	
</div>

<a href="#" class="like">좋아요</a>

<select name="item">
	<option value="">더보기</option>
	<option value="">곡 정보</option>
	<option value="">앨범 정보</option>
	<option value="">아티스트 정보</option>
</select>
<button type="button" class="lyrics" title="가사전체보기">가사보기</button>
</div>
<br>


<div>
<h2>아이유(IU) - 에잇(Prod.&Feat. SUGA of BTS) </h2>
<div class="thumb">
	<img src="../album_images/album19.PNG" alt="아이유">
</div>
<audio preload="auto" controls>
	<source src="https://www.w3schools.com/html/horse.mp3">
</audio>

<!-- 비로그인 시 -->
<div class="payment">
	<p class="txt ellipsis">로그인 후, 전곡 스트리밍을 이용해 보세요.</p>
</div>
</div>
</body>
</html>
<%@ include file="../song/playlistList1_2.jsp" %>