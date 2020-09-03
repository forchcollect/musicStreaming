<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="divForm">
<form name="frmDelete" method="post" action="<c:url value='/playlist/playlistDelete_ok.do'/>" >
	<input type="hidden" name="no" value="${param.no }">
	
	<fieldset>
	<legend>곡 삭제</legend>
        <div>           
        	<span class="sp">${param.no }번 글을 삭제하시겠습니까?</span>                        
        </div>
       
        <div class="center">
            <input type ="submit"  value="삭제" />
            <input type = "Button" value="글목록" 
               	OnClick ="location.href='<c:url value='/playlist/playlistList2.do'/>'" />
        </div>
    </fieldset>
</form>
</div>

</body>
</html>