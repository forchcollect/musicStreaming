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
	action="<c:url value='/playlist/playlistEdit_ok.do'/>">
	
	<input type="hidden" name="no" value="${param.no}">
	 
    <fieldset>
	
    <div class="firstDiv">
        <label for="title">앨범번호</label>
        <input type="text" id="albumno" name="albumno" 
        	value="${vo.albumno}" />
    </div>
        <div>
            <label for="title">앨범명</label>
            <input type="text" id="title" name="title" 
            	value="${vo.title}"/>
        </div>
        <div>
            <label for="singer">가수</label>
            <input type="text" id="singer" name="singer" />
        </div>
        <div>
            <label for="genre">장르</label>
            <input type="text" id="genre" name="genre" 
            	value="${vo.genre}"/>
        </div>
        
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="글목록"
            	 onclick="location.href	='<c:url value='/playlist/playlistList2.do'/>'" />         
        </div>
	</fieldset>
</form>    
</div>

</body>
</html>