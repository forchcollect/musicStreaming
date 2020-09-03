<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%-- 
<%@ include file="/login/loginCheck.jsp" %> --%>

<script type="text/javascript">
	$(function(){
		$('#pwd').focus();
		
		$('form[name=frmOut]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else{
				if(!confirm("회원탈퇴하시겠습니까?")){
					event.preventDefault();
				}
			}
		});
		
	});
</script>
<style>
.align_center{
 margin-left:50px;
}



.main{
	align-items: center;
	width: 500px;
	height: 500px;
}

p{
	margin-top: 100px;
}
# pwd{
background-color: #F0F8FF;
	text-align: center;
}

</style>
<article class="simpleForm">
	<div calss = "main">
	<div class=""></div>
	<!-- <h2>회원탈퇴</h2> -->
	<p class="p">         회원탈퇴하시겠습니까?</p>
	<form name="frmOut" method="post" action="memberOut_ok.jsp">
		<div >
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요 " 
			style="border: 3px sold pink; width: 300px;height: 30px; font-size: 18px;">
		</div>	
		<div class="align_center" style="margin-top: 10px">
			<input type="submit" value="회원탈퇴">
			<input type="reset" value="취소">			
		</div>
	</form>
	</div>
</article>
