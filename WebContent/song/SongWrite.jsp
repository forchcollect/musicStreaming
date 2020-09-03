<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../chartNav/chartNav.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mystyle.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>

<title>노래 - 글쓰기</title>
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href = "<c:url value='/song/playlistList1_2.do'/>";	
		});
		
		$('form[name=frmWrite]').submit(function(){
			if($('#title').val()==''){
				alert('제목을 입력하세요');
				$('#title').focus();
			}
			
		});
	});
	
</script>

</head>
<body>
<div class="divForm">
<form name="frmWrite" method="post" 
	action="<c:url value='/song/SongWrite_ok.do'/>" >
 <fieldset>
	<legend>노래 정보 입력</legend>
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
            <input type = "submit" value="등록"/>
            <input type = "Button" class="btList" value="목록"  />         
        </div>
    </fieldset>
</form>
</div>   
 
</body>
</html>
