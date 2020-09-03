<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>

<title>플레이리스트 - 글쓰기</title>
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href = "<c:url value='/playlist/playlistList2.do'/>";	
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
	action="<c:url value='/playlist/playlistWrite_ok.do'/>" >
 <fieldset>
	<legend>앨범 정보 입력</legend>
		<div class="firstDiv">
            <label for="title">번호</label>
            <input type="text" id="title" name="albumno"  />
        </div>
        <div class="firstDiv">
            <label for="title">앨범명</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="name">가수</label>
            <input type="text" id="name" name="singer" />
        </div>
         <div>
            <label for="name">장르</label>
            <input type="text" id="name" name="genre" />
        </div>
     
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" class="btList" value="글목록"  />         
        </div>
    </fieldset>
</form>
</div>   
 
</body>
</html>
