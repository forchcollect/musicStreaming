<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#singer_img{
		float:left;
	 	width:300px;
	 	height:200px;
	 	border:1px solid gray;
	}
	
	.singer_section{
		clear:both;
	}
	
</style>
</head>
<body>
<h1>가수 페이지</h1>
<section id="singer_page">
	<section class="singer_section" id="singer_list_secton">
		<header>가수 정보</header>
		<img src="" id="singer_img">
		<article>
			<div>
				<span>예명</span><span>(실명)</span><br>
				<span>장르</span><span>장르</span><br>
				<span>데뷔일</span><span>데뷔일</span><br>
				<span>소속그룹, 소속사명</span><span>소속그룹, 소속사명</span>
			</div>
		</article>
	</section>
	<section class="singer_section" id="singer_song_secton">
		<article>
			곡 정보
		</article>
	</section>
	<section class="singer_section" id="singer_singer_secton">
		<article>
			앨범 정보
		</article>
	</section>
</section>

</body>
</html>