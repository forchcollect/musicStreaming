<%@page import="com.music.chart.model.ChartService"%>
<%@page import="com.music.chart.model.ChartVO"%>
<%@page import="com.music.album.model.AlbumService"%>
<%@page import="com.music.album.model.AlbumVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chart.css"/>
<style type="text/css">
.main_album{
	float:left;
	width:25%;
	margin-left: 40px;
	margin-bottom: 20px;
}

.new_album_img {
	width: 200px;
	height: 200px;
	align: left;
}

.main_song{
	float:left;
	width:150px;
	margin-left: 20px;
	margin-bottom: 10px;
}
.main_song_img{
	width: 150px;
	height: 150px;
}
.middle{
	margin-left: 15%;
}

</style>
</head>
<body>

<%@ include file="../chartNav/chartNav.jsp" %>
<div class="middle">

	<iframe style="margin-left: 100px;" width="560" height="315" src="https://www.youtube.com/embed/UuV2BmJ1p_I" 
	frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
<%
	List<AlbumVO> list=null;
	AlbumService alServ=new AlbumService();
	try{
		list=alServ.selectAlbumReleased();
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	ChartService chSer=new ChartService(); 
	List<ChartVO> list2=new ArrayList<>();
	try{
		list2=chSer.selectTodayChart();
			
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 화면
	%>
	<section class="mainSection" id="mainSection_newAlbum">
		<section>
			<header>최신 앨범</header>
			<%
			AlbumVO alVo=new AlbumVO();
			for(int i=0;i<list.size();i++) { 
				alVo=list.get(i);
			String title="";
			if(alVo.getTitle().length() > 20) {
				title=alVo.getTitle().substring(0, 20) +"...";
			}
			%>
			<article>
				<div class="main_album">
				<a href="<%=request.getContextPath()%>/infomation/album.jsp?no=<%=alVo.getAlbumno()%>">
					<img src="<%=request.getContextPath() %>/album_images/album<%=alVo.getAlbumno() %>.PNG" class="new_album_img">
				</a><br>
				<div align="left">
					<span><b><a href="<%=request.getContextPath()%>/infomation/album.jsp?no=<%=alVo.getAlbumno()%>"><%=title %></a></b></span><br>
					<span><%=alVo.getSinger() %></span>
				</div>
				</div>
			</article>
			<%} %>
		</section>
		<section>
			<article id="main_song_article">
				<header>오늘 급상승</header>
				<%
				for(int i=0;i<4;i++) { 
					ChartVO vo=list2.get(i);
				%>
					<div class="main_song">
						<img class="main_song_img" src="<%=request.getContextPath() %>/album_images/album<%=vo.getAlbumno() %>.PNG">
						<span><a id="chartTable_songTitle" href="<%=request.getContextPath()%>/infomation/song.jsp?no=<%=vo.getSongno() %>"><%=vo.getS_title() %></a></span>
						<span><a href="<%=request.getContextPath()%>/infomation/singer.jsp"><%=vo.getS_singer() %></a></span>
						<span><a href="<%=request.getContextPath()%>/infomation/album.jsp?no=<%=vo.getAlbumno()%>"><%=vo.getA_title() %></a></span>
				<!-- for문 끝 -->
				</div>
				<% } %>
			</article>
		</section>
	</section>
	</div>
</body>
</html>
