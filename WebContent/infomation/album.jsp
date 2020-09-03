<%@page import="com.music.song.model.SongVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.music.album.model.AlbumVO"%>
<%@page import="com.music.album.model.AlbumService"%>
<%@page import="com.music.songlikeno.model.SongLikeNoVO"%>
<%@page import="com.music.songlikeno.model.SongLikeNoService"%>
<%@page import="com.music.song.model.SongService"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/information.css"/>

</head>
<body>
<%
	String no=request.getParameter("no");

	/* SongService songServ=new SongService();
	alVo alVo = new alVo();
	SongLikeNoService soLiServ = new SongLikeNoService();
	SongLikeNoVO soLiVo=new SongLikeNoVO(); */
	AlbumService alServ=new AlbumService();
	AlbumVO alVo = new AlbumVO();
	
	try{
		/* alVo=songServ.selectSongBySongno(Integer.parseInt(no));
		soLiVo=soLiServ.selectSongBySongno(Integer.parseInt(no)); */
		alVo=alServ.selectAlbumByAlbumno(Integer.parseInt(no));
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	Timestamp releasedDate=alVo.getReleasedDate();
	
%>
<%@ include file="../chartNav/chartNav.jsp" %>
<h2>곡 페이지</h2>
<hr align="left">
<section>
	<section class="song_section" id="song_info_secton">
		<article>
			<div>
				<header>앨범 정보</header>
				<img src="<%=request.getContextPath() %>/album_images/album<%=alVo.getAlbumno() %>.PNG" class="album_img">
				<div class="info_top">	
					<span class="info_title"><%=alVo.getTitle() %></span><br>
					<span class="info_singer"><%=alVo.getSinger() %></span><br>
					<table class="info_table" summary="곡 정보 중 앨범, 작사, 작곡, 편곡 부분만">
						<%SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd");
						String str = sdf.format(releasedDate); %>
						<tr><th>발매일</th><td><%=releasedDate%></td></tr>
						<%if(alVo.getGenre()!=null && !alVo.getGenre().isEmpty()) {%>
						<tr><th>장르</th><td><%=alVo.getGenre() %></td></tr>
						<%}%>
						<%if(alVo.getReleasedCompany()!=null && !alVo.getReleasedCompany().isEmpty()) {%>
						<tr><th>발매사</th><td><%=alVo.getReleasedCompany() %></td></tr>
						<%}%>
					</table>
					<button class="info_button_color" type="button"  value="재생">
						<img class="icon_img2" src="../pict_images/play.png">
					</button>							
					<button class="info_button" type="button" name="playlists" value="재생목록 추가">
						<img class="icon_img2" src="../pict_images/playlists.png">
					</button>
					<button class="info_button" type="button" name="download" value="다운로드">
						<img class="icon_img2" src="../pict_images/download.png">
					</button>
				</div>
			</div>
		</article>
	</section>
	<hr align="left">
	<%
		SongService songServ=new SongService();
		List<SongVO> list=null;
	try{
		list=songServ.selectSongsInAlbum(Integer.parseInt(no));
	}catch(SQLException e) {
		e.printStackTrace();
	}
	%>
	
	<section class="chartSection" id="chartRuntime">
		
		<article class="chart_head">
		<table class="songListTable" summary="월간 top 10">
		<colgroup span="1" width="100"></colgroup>
		<colgroup span="2" width="400"></colgroup>
		<colgroup id="chartTable_lastColgroup" span="4" width="150"></colgroup>
			<tr style="text-align: left">
				<th>순위</th><!-- 몇 위인지 보여줌. 그 뒤에 오늘 오전 12시부터 현재 시각까지 좋아요를 몇개나 받았는지 뒤에 ▲(숫자) 를 붙여줌 -->
				<th>곡명</th>
				<th>가수명</th>
				<th>앨범명</th>
				<th>재생</th><!-- 바로듣기 이미지; 누르면 아래 플레이바에 곡이 바로 재생됨 -->
				<th>재생목록</th><!-- 바로 다운로드 하기; 상품권 유무에 따라 다운로드가 가능함 -->
				<th>좋아요</th><!-- 바로 다운로드 하기; 상품권 유무에 따라 다운로드가 가능함 -->
			</tr>
			<!-- 반복문 시작 -->
			<%for(int i=0;i<list.size();i++) {
				SongVO vo=new SongVO();
				vo=list.get(i);
			%>
			<tr>
				<td><%=i+1%></td>
				<td><a id="chartTable_songTitle" href="<%=request.getContextPath()%>/infomation/song.jsp?no=<%=vo.getSongno() %>"><%=vo.getTitle() %></a></td>
				<td><%=vo.getSinger() %></td>
				<th><img class="icon_img1" src="<%=request.getContextPath()%>/pict_images/play.png"></th>
				<th><img class="icon_img2" src="<%=request.getContextPath()%>/pict_images/playlists.png"></th>
				<th><img class="icon_img2" src="<%=request.getContextPath()%>/pict_images/download.png"></th>
				<th><img class="icon_img1"src="<%=request.getContextPath()%>/pict_images/love.png"><br></th>
			</tr>
			<% } %>
		<!-- for문 끝 -->
		</table>
	</article>
	</section>
</section>
</body>
</html>