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