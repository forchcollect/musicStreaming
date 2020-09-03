<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
	<%-- 
<%@ include file="/login/loginCheck.jsp"%> --%>



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
<article class="simpleForm">
	<h2 style="margin-left: 80px;">             회원탈퇴</h2>
	<p class="p" style="margin-left: 40px;">회원탈퇴하시겠습니까?</p>
	<form name="frmOut" method="post"
		action="<%=request.getContextPath() %>memberOut_ok.do">
		<div>
			<!-- <label for="pwd">비밀번호</label>-->
			 <input type="password" name="pwd"
				id="pwd" placeholder="비밀번호를 입력하세요" style="width: 300px;height: 30px;font-size: 15px;">
		</div>
		</div>
		<div class="align_center" style="margin-top: 15px;">
			<input type="submit" value="회원탈퇴" style="margin-left: 60px;"> 
			<input type="reset"	value="취소" >
			</div>
	</form>
</article>
