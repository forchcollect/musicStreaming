<%@page import="itwill.music.voucher.model.PurchaseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<%@ include file="../chartNav/chartNav.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<meta charset="UTF-8">
<%
	List<PurchaseVO> list = (List<PurchaseVO>) request.getAttribute("list");

%>
<style type="text/css">
.my_section {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	width: 69%;
	left: 50%;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
}

.title {
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: left;
}

.my_area {
	padding-top: 50px;
	padding-bottom: 50px;
}

.link_area {
	text-align: right;
	margin: 30px;
}

.link_subscribe {
	margin-top: 50px;
}

table {
	margin: 0 auto;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.divList {
	margin-top: 50px;
	margin-bottom: 60px;
}
.divForm {
	width: 100%;
	text-align: center;
}

.membership {
	background-color: #f7f7f7;
	height: 100px;
	margin-top: 0;
	width: 1200px;
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
</style>
<div class="divForm">

<div class="membership" style=" width: 1400px;">
	<a href="<%=request.getContextPath() %>/voucher/voucherView.do" >TB 멤버십</a> 
	<a href="<%=request.getContextPath() %>/voucher/myMembership.do" class="item on">MY 멤버십</a>
</div>
</div>

<c:choose>
	<c:when test="${not empty list }">

		<article class="voucher"
			style="text-align: center; margin-left: 150px;">
			<div class="divForm" style="width: 700px;">
				<div id="hvoucher" style="display:">
					<h3 class="title">My 멤버십</h3>
					<div class="my_area">
						<div>
							<strong class="main_text">현재 보유하신 멤버쉽</strong><br>
							<br>

							<c:if test="${!empty list }">
								<!-- 반복 시작 -->
								<c:forEach var="dto" items="${list }">
									<tr">
										<td">${dto.voucherName }</td>
									</tr>
								</c:forEach>
							</c:if>

							<div class="divList">
								<table class="box2" style="width: 500px">
									<tr>
										<th>멤버쉽</th>
										<th>구매일</th>
										<th>종료일</th>
									</tr>
									<c:if test="${empty list }">
										<tr>
											<td colspan="3">보유하신 멤버쉽이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<!-- 반복 시작 -->
										<c:forEach var="dto" items="${list }">
											<tr>
												<td>${dto.voucherName }</td>
												<td><fmt:formatDate value="${ dto.regdate }"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${ dto.exRegdate }"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
							</div>

							<br> <br> <br>
							<hr style="color: red" width="500px;">
							<br> <br> <br> <a href="#" class="link_subscribe">TB
								멤버십 자세히 알아보기</a>
						</div>
					</div>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${empty list }">
		<div class="my_notice"></div>
		<div class="link_area">
			<a href="<%=request.getContextPath()%>/voucher/voucherView.do"
				class="item">이용권 구매</a>
		</div>


		<div class="my_section">
			<h3 class="title">등록기기</h3>
			<div class="device_area">
				<p class="default_text">등록된 기기가 없습니다.</p>
			</div>
		</div>

		<div id="nvoucher" style="display: none">
			<h3 class="title">My 멤버십</h3>
			<div class="my_area">
				<div>
					<strong class="main_text">현재 보유하신 멤버십이 없습니다.</strong>
					<p class="sub_text">6개월간 100% 페이백 혜택을 받아보세요.</p>
					<br> <br>
					<hr style="color: red">

					<a href="#" class="link_subscribe">TB 멤버십 자세히 알아보기</a>
				</div>
			</div>
			<div class="my_notice"></div>
			<div class="link_area">
				<a href="<%=request.getContextPath()%>/voucher/voucherView.do"
					class="item">이용권 구매</a>
			</div>

			<div class="my_section">
				<h3 class="title">등록기기</h3>
				<div class="device_area">
					<p class="default_text">등록된 기기가 없습니다.</p>
				</div>
			</div>
		</div>
		</article>
	</c:when>
</c:choose>