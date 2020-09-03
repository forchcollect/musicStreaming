<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/a.css" />

<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#bt_register').click(function(){
			
		// 아이디	
			if($('#member_id').val().length<1){
				alert('아이디를 입력하세요');
				$('#member_id').focus();
				event.preventDefault();
			
			}else if(!validate_userid($('#member_id').val())){
				alert('아이디는 4-16자,영문대소문자,숫자,_만 가능합니다!');
				$('#member_id').focus();
				event.preventDefault();
				
		// 중복체크여부
			}else if($('#chkId').val()!='Y'){
				alert('아이디 중복확인을 하셔야 합니다.');
				$("#btnChkId").focus();
				event.preventDefault();
				
				
		// 비밀번호입력 및 일치여부		
			}else if($('#passwd').val().length<1){
				alert('4-16자,비밀번호를 입력하세요');
				$('#passwd').focus();
				event.preventDefault();
			}else if($('#passwd').val()!=$('#user_passwd_confirm').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#user_passwd_confirm').focus();
				event.preventDefault();
				
				
				
				
		// 연락처 입력여부 및 영문/숫자/_(특수기호) 적절입력여부	
			}else if($('#phone1').val().length<1){
				alert('연락처를 입력하세요');
				$('#phone1').focus();
				event.preventDefault();
			}else if($('#phone2').val().length<1){
				alert('연락처를 입력하세요');
				$('#phone2').focus();
				event.preventDefault();
			}else if($('#phone3').val().length<1){
				alert('연락처를 입력하세요');
				$('#phone3').focus();
				event.preventDefault();	
			}else if(!validate_phone($('#phone2').val()) || 
					!validate_phone($('#phone3').val())){
				alert('연락처 입력시 숫자만 가능합니다!');
				$('#hp2').focus();
				event.preventDefault();
				
			
				
				
				
				
			}else if($('#email1').val().length<1){
				alert('이메일을 입력하세요');
				$('#email1').focus();
				event.preventDefault();
			
			
			
			// 약관동의여부
			}else if(!$('#agree_service_check0').is(':checked')){
	            alert("약관에 동의하셔야 합니다!");
	            $('#chkAgree').focus();
	            event.preventDefault();
	        }else if(!$('#agree_service_check0').is(':checked')){
		            alert("약관에 동의하셔야 합니다!");
		            $('#chkAgree').focus();
		            event.preventDefault();
		    }else if(!$('#agree_service_check0').is(':checked')){
	            alert("약관에 동의하셔야 합니다!");
	            $('#chkAgree').focus();
	            event.preventDefault();
	         }
		
			
			
			
			
			
			
			

			
			
		});//click
		
		
		$("#bt_existornot").click(function(){ 
			var userid = $("#member_id").val();
			window.open("checkUserid.jsp?userid="+userid,"top=10,left=10,width=350,height=250,scrollbars=yes,resizable=yes");
		});
		
	});
	
	
	
	
	
	function validate_phoneno(ph){
		var pattern=new RegExp(/^[0-9]*$/g);
		return pattern.test(ph); 
		}

	function validate_userid(uid){
		var pattern= new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);
	} 
	
	
	
	
	function gomain(){
		location.href="<%=request.getContextPath()%>/main.jsp";  
		
	}
	
</script>

<style type="text/css">
#contents{
	text-align: center;
}
table{
	width : 500px;
	margin : auto;
	text-align: center;
}

</style>
</head>
<body>
	<div class="contents" id="contents">
			<p>회원가입</p>
			<br><br>

		<form id="joinForm" name="joinForm"
			action="<%=request.getContextPath()%>/member/registerOk.do "
			method="post" target="_self" enctype="multipart/form-data">

				<table border="1" summary="" id="">
					<caption>회원가입</caption>
					<tbody>
						<tr class="">
							<th scope="row">회원구분</th>
							<td><input id="member_type0" name="member_type"
								fw-filter="isFill" fw-label="회원구분" fw-msg="" value="p"
								type="radio" checked="checked"><label for="member_type0">내국인(성인)</label>
						</tr>
					</tbody>
				</table>

			<div class="ec-base-table typeWrite">
				<table border="1" summary="필수정보">
					<caption>회원 기본정보</caption>
					<tbody>
						<tr>
							<th scope="row">아이디 <img
								src="<%=request.getContextPath()%>/images/check.png" alt="필수"></th>
							<td><input id="member_id" name="member_id"
								fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
								fw-label="아이디" fw-msg="" class="inputTypeText"
								placeholder="4-16(영문대소문자,숫자,_)만가능" type="text"> <span
								id="idMsg">&nbsp;&nbsp;&nbsp;</span><span> <input
									type="button" value="중복확인" id="bt_existornot" title="새창열림"
									onclick=""></span></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 <img
								src="<%=request.getContextPath()%>/images/check.png" alt="필수"></th>
							<td><input id="passwd" name="passwd"
								fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
								placeholder="4-16(영문대소문자,숫자,_)만가능" fw-msg="" autocomplete="off"
								maxlength="16" value="" type="password"> <strong></strong></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인 <img
								src="<%=request.getContextPath()%>/images/check.png" alt="필수"></th>
							<td><input id="user_passwd_confirm"
								name="user_passwd_confirm"
								fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
								fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
								value="" type="password"> <span id="pwConfirmMsg"></span></td>
						</tr>
						<tr>						
							<th scope="row">이메일 <img
							src="<%=request.getContextPath()%>/images/check.png" alt="필수"></th>
								<td><input id="email1" name="email"
									fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"
									fw-msg="" value="" type="text"> <span id="emailMsg"></span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>


			</tbody>

			<div class="titleArea  ">
				<h3>전체 동의</h3>
			</div>
			<div class="agreeArea">
				<div class="agreeArea-item">
					<div class="agreeall">
						<p class="all">
							<span class="ec-base-chk"><input type="checkbox"
								id="sAgreeAllChecked"><em class="checkbox"></em></span><label
								for="sAgreeAllChecked">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에
								모두 동의합니다.</label>
						</p>
					</div>

					<h2>[필수] 이용약관 동의</h2>
					<iframe src="provision.html" width="820" height="300"></iframe>
					<p class="check">
						개인정보 수집 및 이용에 동의하십니까? <input id="agree_privacy_check0"
							name="agree_privacy_check[]" fw-filter="/1/"
							fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요"
							value="1" type="checkbox"><label
							for="agree_privacy_check0">동의함</label>
					</p>


				<div>
					<div class="">
						<h2>[선택] 정보 수신 동의</h2>
						<iframe src="<%=request.getContextPath() %>/member/send.html" width="820" height="300"></iframe>
						<ul class="check" style="border: 0;">
							<li class="displaynone"><span>SMS 수신을 동의하십니까?</span> <label
								for="is_sms0"><input id="is_sms0" name="is_sms"
									fw-filter="" fw-label="is_sms" fw-msg="" class="ec-base-chk"
									value="T" type="checkbox">동의함</label></li>
							<li class=""><span>이메일 수신을 동의하십니까?</span> <label
								for="is_news_mail0"><input id="is_news_mail0"
									name="is_news_mail" fw-label="is_news_mail" fw-msg=""
									class="ec-base-chk" value="T" type="checkbox">동의함</label></li>
						</ul>
					</div>
				</div>
				<div class="ec-base-button gColumn">

					<input type="submit" id="bt_register" class="btnSubmitFix sizeL"
						value="회원가입" onclick="btR()"> <input type="button" id="bt_gomain"
						class="btnSubmitFix sizeL" value="취소" onclick="gomain()">
				</div>
			</div>
			<!-- 중복확인 여부 -->
			<input type="hidden" name="chkId" id="chkId">
			<!-- 중복확인 여부 -->
		</form>
	</div>
</body>
</html>