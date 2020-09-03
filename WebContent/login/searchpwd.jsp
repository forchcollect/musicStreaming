<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/voucher.css" />
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=authForm]').submit(function(){
			if($('#loginId').val().length<1){
				alert('아이디를 입력하세요');
				$(this).focus();
				event.preventDefault();
			}else if($('#loginPw').val().length<1){
				alert('비밀번호를 입력하세요');
				$(this).focus();
				event.preventDefault();
			}
			
		});
		
	});
	
</script>
<body>

<div class = "frame">
	<form method="post" name ="search" action="/login/search_ok.do ">
		<fieldset>
			<legend>
				<input >

			</legend>
		</fieldset>
	
	</form>




</div>







</body>
</html>