<%@page import="java.util.ArrayList"%>
<%@page import="com.music.chart.model.ChartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.music.chart.model.ChartService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<%@ include file="../chartNav/chartNav.jsp" %>
<%
	//1. 파라미터
	//2. db
	ChartService chSer=new ChartService(); 
	List<ChartVO> list=new ArrayList<>();
	try{
		list=chSer.selectTotalChart();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 화면
%>
<section class="chartSection" id="chartRuntime">
	<article class="chart_head">
		<h3>전체 top 10</h3>
		
		<div class="chart_head_div">
<!-- 		<span class="chart_head_span">
			<input type="button" name="leftBlock" value="&lt;">
			&nbsp;&nbsp;&nbsp;&nbsp;21위~30위&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="button" name="rightBlock" value="&gt;">
		</span> -->
		<div id="chart_keyword">
			<input type="text" name="keywordText">
			<input type="button" name="keywordButton" value="검색">
		</div>
		</div>		
	</article>
	<article>
		<table class="chartTable" summary="월간 top 10">
		<colgroup span="2" width="100"></colgroup>
		<colgroup span="3" width="400"></colgroup>
		<colgroup id="chartTable_lastColgroup" span="4" width="150"></colgroup>
			<tr>
				<th>순위</th><!-- 몇 위인지 보여줌. 그 뒤에 오늘 오전 12시부터 현재 시각까지 좋아요를 몇개나 받았는지 뒤에 ▲(숫자) 를 붙여줌 -->
				<th>이미지</th><!-- 이미지 자리, 보여줄 제목 없음 -->
				<th>곡명</th>
				<th>가수명</th>
				<th>앨범명</th>
				<th>재생</th><!-- 바로듣기 이미지; 누르면 아래 플레이바에 곡이 바로 재생됨 -->
				<th>재생목록</th><!-- 바로 다운로드 하기; 상품권 유무에 따라 다운로드가 가능함 -->
				<th>다운로드</th>
				<th>좋아요</th><!-- 하트 이미지 + 좋아요 수 -->
			</tr>
			<!-- 반복문 시작 -->
			<%
			for(int i=0;i<list.size();i++) { 
				ChartVO vo=list.get(i);
			%>
			<tr>
				<td><%=i+1%></td>
				<td><img width="70px" height= "70px" src="<%=request.getContextPath() %>/album_images/album<%=vo.getAlbumno() %>.PNG"></td>
				<td><a id="chartTable_songTitle" href="<%=request.getContextPath()%>/infomation/song.jsp?no=<%=vo.getSongno() %>"><%=vo.getS_title() %></a></td>
				<td><a href="<%=request.getContextPath()%>/infomation/singer.jsp"><%=vo.getS_singer() %></a></td>
				<td><a href="<%=request.getContextPath()%>/infomation/album.jsp?no=<%=vo.getAlbumno()%>"><%=vo.getA_title() %></a></td>
				<th><img class="icon_img1" src="<%=request.getContextPath()%>/pict_images/play.png"></th>
				<th><img class="icon_img2" src="<%=request.getContextPath()%>/pict_images/playlists.png"></th>
				<th><img class="icon_img2" src="<%=request.getContextPath()%>/pict_images/download.png"></th>
				<th><img class="icon_img1"src="<%=request.getContextPath()%>/pict_images/love.png"><br>
					<a href="#" id="chartTable_likeNo"><%=vo.getS_likeno() %></a>
				</th>
			</tr>
			<% } %>
		<!-- for문 끝 -->
		</table>
	</article>
</section>

</body>
</html>