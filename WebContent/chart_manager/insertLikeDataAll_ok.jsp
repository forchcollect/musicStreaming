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
int cnt=0;
	for(int i=1;i<=110;i++) {
		
		
		String songnoS=request.getParameter("songno");
		
		int likeno=(int)(Math.random()*800+1);
		int songno=i;
		
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
		for(int j=0;j<likeno;j++) {
			dateArr[j]=rd.getRandomDate(releasedDate, sysdateS);
		}
		
		System.out.println("songno\tnum\tlikedate"); 
		for(int j=0;j<likeno;j++) {
			System.out.print(songno+"\t"+(j+1)+"\t"+dateArr[j]+"\n"); 
		}
		
		try {
			
			for(int j=0;j<likeno;j++) {
				cnt=ird.inserSongDatano(songno, likeno, dateArr,j);
			}
			
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(cnt>0) {
			System.out.println("songdatano에 songno="+songno+", 총 "+cnt+"행(=좋아요 수)의 데이터가 입력되었습니다."); %>
			
			<script type="text/javascript">
				alert('데이터 입력 완료!');
			</script>
		<%}
	}
	
%>
