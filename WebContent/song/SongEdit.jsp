<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>수정 </title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mystyle.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>

</head>
<body>
<div class="divForm">
<form name="frmEdit" method="post" 
	action="<c:url value='/song/SongEdit_ok.do'/>">
	
	<input type="hidden" name="no" value="${param.songno}">
	 
    <fieldset>
	
    	<div class="firstDiv">
            <label for="title">번호</label>
            <input type="text" id="songno" name="songno"  />
        </div>
        <div class="firstDiv">
            <label for="title">노래명</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="name">가수</label>
            <input type="text" id="singer" name="singer" />
        </div>
         <div>
            <label for="name">작사</label>
            <input type="text" id="lyricwriter" name="lyricwriter" />
        </div>
     	 <div>
            <label for="name">작곡</label>
            <input type="text" id="songwriter" name="songwriter" />
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="글목록"
            	 onclick="location.href	='<c:url value='/song/playlistList1_2.do'/>'" />         
        </div>
	</fieldset>
</form>    
</div>

</body>
</html>