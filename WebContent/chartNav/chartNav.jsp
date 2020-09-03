<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.chartNav{
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
			
}

</style>
</head>
<body>

<nav class="chartNav">
		
		<ul class="chartUl_title"><li><b> 차트</b></li></ul>
		<ul class="chartUl"><li><a href="<%=request.getContextPath()%>/chartPage/today.jsp">> Today top 100</a></li></ul>
		<ul class="chartUl"><li><a href="<%=request.getContextPath()%>/chartPage/week.jsp">> 주간 top 100</a></li></ul>
		<ul class="chartUl"><li><a href="<%=request.getContextPath()%>/chartPage/month.jsp">> 월간 top 100</a></li></ul>
		<ul class="chartUl"><li><a href="<%=request.getContextPath()%>/chartPage/total.jsp">> 전체 top 100</a></li></ul>
		<br><br><br>
		<ul class="chartUl"><li><a href="<%=request.getContextPath()%>/voucher/voucherView.do">>이용권 구매</a></li></ul>
		<ul class="chartUl"><li><a href="<%=request.getContextPath() %>/voucher/cancelVoucher.do">>이용권 해지</a></li></ul>
		<br><br><br>
		<ul class="chartUl"><li><a href="<%=request.getContextPath() %>/tamp/count.jsp">>contact</a></li></ul>
		
</nav>
