<%@page import="com.music.album.model.AlbumVO"%>
<%@page import="com.music.album.model.AlbumService"%>
<%@page import="com.music.songlikeno.model.SongLikeNoVO"%>
<%@page import="com.music.songlikeno.model.SongLikeNoService"%>
<%@page import="com.music.song.model.SongVO"%>
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

	SongService songServ=new SongService();
	SongVO songVo = new SongVO();
	SongLikeNoService soLiServ = new SongLikeNoService();
	SongLikeNoVO soLiVo=new SongLikeNoVO();
	AlbumService alServ=new AlbumService();
	AlbumVO alVo = new AlbumVO();
	
	try{
		songVo=songServ.selectSongBySongno(Integer.parseInt(no));
		soLiVo=soLiServ.selectSongBySongno(Integer.parseInt(no));
		alVo=alServ.selectAlbumByAlbumno(songVo.getAlbumno());
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
%>
<%@ include file="../chartNav/chartNav.jsp" %>
<h2>곡 페이지</h2>
<hr align="left">
<section>
	<section class="song_section" id="song_info_secton">
		<article>
			<div>
				<header>곡 정보</header>
				<img src="<%=request.getContextPath() %>/album_images/album<%=songVo.getAlbumno() %>.PNG" class="album_img">
				<div class="info_top">	
					<span class="info_title"><%=songVo.getTitle() %></span><br>
					<span class="info_singer"><%=songVo.getSinger() %></span><br>
					<table class="info_table" summary="곡 정보 중 앨범, 작사, 작곡, 편곡 부분만">
					
						<tr><th>앨범</th><td><%=alVo.getTitle() %></td></tr>
						
						<%if(songVo.getLyricWriter()!=null && !songVo.getLyricWriter().isEmpty()) {%>
						<tr><th>작사</th><td><%=songVo.getLyricWriter() %></td></tr>
						<%}%>
						<%if(songVo.getSongWriter()!=null && !songVo.getSongWriter().isEmpty()) {%>
						<tr><th>작곡</th><td><%=songVo.getSongWriter() %></td></tr>
						<%}%>
						<%if(songVo.getSongEditer()!=null && !songVo.getSongEditer().isEmpty()) {%>
						<tr><th>편곡</th><td><%=songVo.getSongEditer() %></td></tr>
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
					<span><img class="icon_img2"src="../pict_images/love.png">
						<a href="#" id="chartTable_likeNo"><%=soLiVo.getLikeno() %></a>
					</span>
				</div>
			</div>
		</article>
	</section>
	<hr align="left">
	<section class="song_section" id="song_lyric_secton">
		<article>
			<header>가사</header>
			<%if(songVo.getLyric()!=null && !songVo.getLyric().isEmpty()){%>
			<textarea style="width:60%; height:400px;" readonly="readonly" name="lyric"><%=songVo.getLyric() %></textarea>
			<%}else{%>
			<span>가사가 없습니다.</span>
			<%}%>
		</article>
	</section>
	<hr align="left">
	<%
	List<AlbumVO> list2=null;
	try{
		list2=alServ.selectAlbumSameSinger(Integer.parseInt(no));
	}catch(SQLException e) {
		e.printStackTrace();
	}
	%>
	<section class="song_section" id="song_album_secton">
		<section>
			<header>가수의 다른 앨범 </header>
			<%
			AlbumVO alVo2=new AlbumVO();
			for(int i=0;i<list2.size();i++) { 
				alVo2=list2.get(i);
			%>
			<article  class="album_of_sameSinger">
				<img src="<%=request.getContextPath() %>/album_images/album<%=alVo2.getAlbumno() %>.PNG" class="song_album_img"><br>
				<div align="center" style="height:60px">
					<span><b><a href="<%=request.getContextPath()%>/information/album?no=<%=alVo2.getAlbumno()%>"><%=alVo2.getTitle() %></a></b></span><br>
					<span><%=alVo2.getSinger() %></span>
				</div>
			</article>
			<%} %>
		</section>
	</section>
</section>
</body>
</html>