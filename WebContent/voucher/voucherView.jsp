<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../chartNav/chartNav.jsp" %>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
	integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<script type="text/javascript">

	
	function showFirst() {
		var con = document.getElementById('second');
		con.style.display = 'none';
		free.style.visibility = 'visible';
	};
	function showSecond() {
		var con = document.getElementById('second');
		var free = document.getElementById('free');
		if (con.style.display == 'none') {
			con.style.display = 'block';
			$('second').free.style.visibility = 'hidden';
		}
	};

	$(function() {
		var sBtn = $('.membership a'); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		sBtn.click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			$('a').removeClass("item on"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).addClass("item on"); // 클릭한 a에 (active)클래스를 넣는다.
		})
		
		var sB = $('ul > li'); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		sB.click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
			$('li').removeClass("cl"); // sBtn 속에 (active) 클래스를 삭제 한다.
			$(this).addClass("cl"); // 클릭한 a에 (active)클래스를 넣는다.
		})
		
		$('li').click(function() {
			value = $(this).val()-1;
		$(':radio').eq(value).prop('checked', true);
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

.membership_title {
	padding-top: 50px;
	padding-bottom: 50px;
}

.membership_title h2 {
	color: red;
}

.u1 {
	text-align: center;
}

.u2 {
	display: inline-block;
	width: 30%;
	border: 1px solid red;
	height: auto;
	line-height: 80px;
	margin-left: 30px;
	margin-right: 30px;
	border-radius: 20px;
}

a:link {
	text-decoration: none;
	color: white;
}

a:visited {
	text-decoration: none;
}

.middle {
	width: 60%;
}

.p_inf {
	color: red;
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

.sec {
	margin-top: 30px;
}

.addChoice li {
	display: inline-block;
	width: 20%;
	font-size: 9px;
	border: 1px solid red;
	height: 61px; line-height : 20px;
	margin-left: 30px;
	margin-right: 30px;
	border-radius: 20px;
	line-height: 20px;
	box-shadow: 0 8px 8px 0 hsla(0,0%,93.3%,.8);
}

.cl{
	background-color: #fbcaca;
	font-style: italic;
}


</style>
<article class="voucher">
	<div class="divForm">
		<center>
				<div class="membership" style=" width: 1400px;">
					<a href="<%=request.getContextPath() %>/voucher/voucherView.do" class="item on">TB 멤버십</a> 
					<a href="<%=request.getContextPath() %>/voucher/myMembership.do" >MY 멤버십</a>
				</div>
				<div class="middle">
					<div class="membership_title">
						<h1>TB를 마음껏 경험해보세요.</h1>
						<h2 style="margin-top: 50px">첫 구독자는 무료!!</h2>
					</div>
			<form action="<%=request.getContextPath() %>/voucher/voucherWindow.do" name="frm1" method="post" id="searchForm">
					<div class="date-select">
						<ul class="u1">
							<li class="u2" onclick="showFirst()" value="1"><a href="#" style="color: black">무제한 듣기
									&nbsp;&nbsp;&nbsp; <span class="badge badge-danger">추천</span><br>
									<input type="radio" name="price" value="0">  0원
							</a></li>
							
							<li class="u2" onclick="showSecond()" value="2"><a href="#" style="color: black" > 요금제 듣기<br>
							<input type="radio" name="price" value="1"> 선택
							</a></li>

						</ul>
					</div>
					
					<div id="first" style="visibility: visible;">
						<br>
						<p>첫 달은 무료 입니다!</p>
					</div>
					<div class="addChoice" id="second" style="display: none;">
						<hr>
						<ul class="u1">
							<li class="u2" value="3"><a href="#" style="color: black">1년 약정
									&nbsp;&nbsp;&nbsp; <span class="badge badge-danger">추천</span><br>
									<input type="radio" name="price" value="5500">  5,500원
							</a></li>
							<li class="u2" value="4"><a href="#" style="color: black">월 약정<br>
									<input type="radio" name="price" value="6000">  6,000원
							</a></li>
						</ul>
					</div>
		
					<div class="s">
						<input class="sub" type="submit" name="submit" value="구독하기">
					</div>

					<section class="sec">
						<h3 style="margin-bottom: 50px; margin-top: 50px">멤버십 구매 시
							참고하세요</h3>
						<a href="#">애플 모바일 기기를 사용하신다면, 애플 정기구독 멤버십 보유 여부를 반드시 확인해 주세요.</a>
					</section>
				</div>
			</form>
		</center>
	</div>
</article>
