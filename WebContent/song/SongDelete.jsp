<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mystyle.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<title>Insert title here</title>
</head>
<body>
<div class="divForm">
<form name="frmDelete" method="post" action="<c:url value='/playlist/playlistDelete_ok.do'/>" >
	<input type="hidden" name="no" value="${param.no }">
	
	<fieldset>
	<legend>�� ����</legend>
        <div>           
        	<span class="sp">${param.no }�� ���� �����Ͻðڽ��ϱ�?</span>                        
        </div>
       
        <div class="center">
            <input type ="submit"  value="����" />
            <input type = "Button" value="�۸��" 
               	OnClick ="location.href='<c:url value='/playlist/playlistList2.do'/>'" />
        </div>
    </fieldset>
</form>
</div>

</body>
</html>