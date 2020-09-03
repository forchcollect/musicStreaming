<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/a.css" />

<title>Insert title here</title>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#bt_register').click(function(){
			if(!validate_userid($('#member_id').val())){
				alert('아이디는 4-16자,영문대소문자,숫자,_만 가능합니다!');
				$('#member_id').focus();
				event.preventDefault();
			}else if($('#passwd').val().length<1){
				alert('4-16자,비밀번호를 입력하세요');
				$('#passwd').focus();
				event.preventDefault();
			}else if($('#user_passwd_confirm').val()!=$('#user_passwd_confirm').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#user_passwd_confirm').focus();
				event.preventDefault();
			
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
			}else if(!validate_phone($('#hp2').val()) || 
					!validate_phone($('#hp3').val())){
				alert('연락처 입력시 숫자만 가능합니다!');
				$('#hp2').focus();
				event.preventDefault();
				
			}else if($('#email1').val().length<1){
				alert('이메일을 입력하세요');
				$('#email1').focus();
				event.preventDefault();
			
			
			}		
		});//click
		
		
	});
	
	
	
	
	function gomain(){
		location.href="<%=request.getContextPath()%>/index.jsp";  //홈화면으로 이동
		
	}
	
	
</script>
<style>
</style>
</head>
<body>
<%

	MemberVO vo = (MemberVO)request.getAttribute("vo");
	String id = request.getParameter("id");
	// String id = request.getAttribute("id");   뭐로가지고와야하나..

%>


	<div class="contents" id="contents">
		<div class="signup">
			<p>내정보
			<p>
				<br>
		</div>


		<form id="joinForm" name="joinForm" action="<%=request.getContextPath() %>/member/memberedit_ok.do "
			method="post" target="_self" enctype="multipart/form-data">

			
			<div class="ec-base-table typeWrite ">
				<table border="1" summary="">
					<caption>내정보</caption>
					<tbody>
						<tr class="">
							<th scope="row">구분</th>
							<td><input id="member_type0" name="member_type"
								fw-filter="isFill" fw-label="회원구분" fw-msg="" value="p"
								type="radio" checked="checked"><label for="member_type0">내국인(성인)</label>
						</tr>
						
						<tr id="authMember">
							<th scope="row">회원인증 <img src="<%=request.getContextPath() %>/images/check.png" alt="필수"></th>
							<td>
								<div id="authWrap" style="">
									<!-- 개인 회원 인증 -->
									<div id="personAuth" style="display: none;">
										<div id="personalTypeWrap" style="display: none;">
											<input id="personal_type0" name="personal_type"
												fw-filter="isFill" fw-label="회원인증" fw-msg="" value="m"
												type="radio" checked="checked"><label
												for="personal_type0">휴대폰인증</label> <input
												id="personal_type1" name="personal_type" fw-filter="isFill"
												fw-label="회원인증" fw-msg="" value="e" type="radio"><label
												for="personal_type1">이메일인증</label>
										</div>
										
										<div id="mobileWrap" style="display: none;">
											<input type="text" id="mobilenum"> <a href="     "
												class="btnNormal"> <img src="" alt="휴대폰번호인증">
												휴대폰인증
											</a>
											<p class="gBlank5">회원가입시 입력하신 휴대폰번호로 회원인증이 진행됩니다.</p>
										</div>
										<div id="emailWrap" style="display: none;">
											<ul>
												<li>기본정보 &gt; 이메일 항목에 입력하신 정보로 본인인증을 진행합니다.</li>
												<li>회원가입 후에 입력하신 이메일 주소로 인증 메일이 발송되오니, 확인해 주시기 바랍니다.</li>
											</ul>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="titleArea  "style="margin-top: 30px;">
				<span><p style="font-size: 16px; font-weight: bold;">기본정보</p></span><span class="required" ><p style="text-align: right" ><img src="<%=request.getContextPath() %>/images/check.png"
						alt="필수"></span>필수입력사항</p>
				
			</div>
			<div class="ec-base-table typeWrite">
				<table border="1" summary="필수정보">
					<caption>회원 기본정보</caption>
					<tbody>
						<tr>
							<th scope="row">아이디 <img src="<%=request.getContextPath() %>/images/check.png" alt="필수"></th>
							<td><input id="member_id" name="member_id"
								fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
								fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="4-16(영문대소문자,숫자,_)만가능"
								type="text" value="<%=vo.getId()%>"> <span id="idMsg">&nbsp;&nbsp;&nbsp;</span></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 <img src="<%=request.getContextPath() %>/images/check.png" alt="필수"></th>
							<td><input id="passwd" name="passwd"
								fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"placeholder="아이디는 4-16자로 입력해주세요"
								fw-msg="" autocomplete="off" maxlength="16" value="<%=vo.get %>" type="password"> <strong></strong></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인 <img src="<%=request.getContextPath() %>/images/check.png" alt="필수"></th>
							<td><input id="user_passwd_confirm"
								name="user_passwd_confirm"
								fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
								fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"value="" type="password"> <span
								id="pwConfirmMsg"></span></td>
						</tr>

						<span id="nameContents"></span>
						<!-- <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인
							동의가 필요합니다.</span>
 -->

						

						<!-- 전화번호  -->
						<tr class="">
							<th scope="row"><span>연락처    <img src="<%=request.getContextPath() %>/images/check.png"
							" alt="필수"></span></th>
							<td><select id="phone1" name="phone[]"
								fw-filter="isNumber&amp;isNumber" fw-label="전화번호" fw-alone="N"
								fw-msg="">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>-<input id="phone2" name="phone[]" maxlength="4"
								fw-filter="isNumber&amp;isNumber" fw-label="전화번호" fw-alone="N"
								fw-msg="" value="" type="text">-<input id="phone3"
								name="phone[]" maxlength="4" fw-filter="isNumber&amp;isNumber"
								fw-label="전화번호" fw-alone="N" fw-msg="" value="" type="text"></td>
						</tr>
						<tr>
						<th scope="row">이메일 <img src="<%=request.getContextPath() %>/images/check.png" alt="필수"></th>
						<td><input id="email1" name="email1"
							fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"
							fw-msg="" value="" type="text"> <span id="emailMsg"></span>
						</td>
						</tr>
					</tbody>
				</table>
			</div>
		</tbody>

				<div class="ec-base-button gColumn">

					<input type="submit" id="bt_register" class="btnSubmitFix sizeL" value="수정">
					<input type="button" id="bt_gomain" class="btnSubmitFix sizeL" value="취소" onclick="gomain()">
				</div>
		
			 <input type ="hidden" name="chkId" id="chkId">
		</form>
	</div>
</body>
</html>