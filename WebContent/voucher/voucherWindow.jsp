<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<%@ include file="../chartNav/chartNav.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	$('form[name=frm1]').submit(function(){
		if(!$("#chkAgree").is(":checked")){
        	alert("약관에 동의하셔야 합니다!");
			event.preventDefault();
        }
		
	
	});
});
</script>
<style type="text/css">
.divForm {
	width: 100%;
	text-align: center;
}

.membership {
	background-color: #f7f7f7;
	height: 100px;
	margin-top: 0;
}

.item {
	display: inline-block;
	font-size: 15px;
	line-height: 52px;
	color: #666;
}

.membership a {
	margin: 20px;
}

.item.on {
	font-weight: 700;
	color: #232323;
	border-bottom: 3px solid #ff1150;
}
.vName{
	margin-top: 50px;
	margin-bottom: 50px;
}
.vp{
	margin-top: 50px;
	margin-bottom: 50px;
}
.sub {
	margin-top: 40px;
	padding-top: 20px;
	padding-right: 200px;
	padding-left: 200px;
	padding-bottom: 20px;
	background: red;
	border: 0 none;
	cursor: pointer;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	color: white;
}
</style>

<article class="voucher">
	<div class="divForm">
			<form action="<%=request.getContextPath() %>/voucher/voucherWindowOk.do" name="frm1" method="post">
			<input type="hidden" name="membership" value="${vName }">
			<input type="hidden" name="price" value="${price }">
				<div class="membership" style=" width: 1400px;">
					<a href="<%=request.getContextPath() %>/voucher/voucherView.do" class="item on">TB 멤버십</a> 
					<a href="<%=request.getContextPath() %>/voucher/myMembership.do" >MY 멤버십</a>
				</div>
				<div class="middle">
					<hr>
					<h1>이용권 구매하기</h1>
					<hr>
					<div class="vName" style="text-align: center;">
						이용권명 :<span style="font-size: 20px; font-style: inherit;">  ${vName }</span>
					</div>
					<br>
					<hr style="height: 2px">
					<span class="vp" style="color: red">결제 금액</span>
					<p style="font-size: 50px; color: red;">${price }  <span style="font-size: 20px; color: black;">원</span></p>
					<br>
					<br>
					<hr style="height: 2px">				
				</div>
				
			<div>
				<input type="checkBox" name="chkAgree" id="chkAgree">
				<label for="chkAgree"> ${vName } 에 동의합니다.</label>
			</div>
				<div class="s">
						<input class="sub" type="submit" name="submit" value="결제하기">
				</div>
			</form>
	</div>
</article>