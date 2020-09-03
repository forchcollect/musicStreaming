<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.music.common.RandomNum"%>
<%@page import="com.music.common.InsertRandomDate"%>
<%@page import="com.music.common.RandomDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String songnoS=request.getParameter("songno");
	String likenoS=request.getParameter("likeno");
	
	int likeno=Integer.parseInt(likenoS);
	int songno=Integer.parseInt(songnoS);
	
	InsertRandomDate ird = new InsertRandomDate();
	String releasedDate="";
	try{
		releasedDate=ird.selectAlbumDateFromSongNo(songno);
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	Date sysdate=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String sysdateS=sdf.format(sysdate);
	
	String dateArr[]=new String[likeno];
	RandomDate rd=new RandomDate();
	for(int i=0;i<likeno;i++) {
		dateArr[i]=rd.getRandomDate(releasedDate, sysdateS);
	}
	
	System.out.println("songno\tnum\tlikedate"); 
	for(int i=0;i<likeno;i++) {
		System.out.print(songno+"\t"+(i+1)+"\t"+dateArr[i]+"\n"); 
	}
	
	try {
		int cnt=0;
		for(int i=0;i<likeno;i++) {
			cnt=ird.inserSongDatano(songno, likeno, dateArr,i);
		}
		
		if(cnt>0) {
			System.out.println("songdatano에 songno="+songno+", 총 "+cnt+"행(=좋아요 수)의 데이터가 입력되었습니다."); %>
			
			<script type="text/javascript">
				alert('데이터 입력 완료!');
			</script>
		<%}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
%>
	<a href="insertLikeData.jsp">데이터 입력하기</a>
</body>
</html>