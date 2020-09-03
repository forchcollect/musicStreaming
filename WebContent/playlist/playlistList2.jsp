<%@page import="album.model.AlbumVO"%>
<%@page import="album.model.AlbumService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%
AlbumService albumService = new AlbumService(); 
List<AlbumVO> list=null;
try{
	list = albumService.selectAlbumAll();
	
}catch(SQLException e){
	e.printStackTrace();
}

%>

<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<title>플레이리스트페이지</title>

<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
</head>
<body>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword }, ${pageVo.totalRecord}건 검색되었습니다.</p>
</c:if>

<!-- post방식으로 페이징 처리 -->
<form action="<c:url value='/playlist/playaList2.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">	
</form>

<div>
	<a href="#" onclick="FAQ페이지" return false;">FAQ</a>
	<a href="#" onclick="이용권페이지" return false;">이용권구매</a>	
</div>

<a href="#" class="like">좋아요</a>

<select name="item">
	<option value="">더보기</option>
	<option value="">곡 정보</option>
	<option value="">앨범 정보</option>
	<option value="">아티스트 정보</option>
</select>
<button type="button" class="lyrics" title="가사전체보기">가사보기</button>
</div>
<br>


<div>
<h2> 

아이유(IU) - 에잇(Prod.&Feat. SUGA of BTS) </h2>
<div class="thumb">
	<img src="../album_images/album19.PNG" alt="아이유">
</div>
<audio preload="auto" controls>
	<source src="https://www.w3schools.com/html/horse.mp3">
</audio>

<!-- 비로그인 시 -->
<div class="payment">
	<p class="txt ellipsis">로그인 후, 전곡 스트리밍을 이용해 보세요.</p>
</div>
</div>


<div class="list">
	
<hr>
<div class="toolbar">
	<input type="checkbox"  title="전체 선택" id="all-check">
	<span class="btn-sort clearfix">
		<button type="button" class="btn up" title="순서이동 드래그가능">선택된 곡 위로 이동</button>
		<button type="button" class="btn down" title="순서이동 드래그가능">선택된 곡 아래로 이동</button>
		<button type="button" class="btn btn-del" onclick="fnDelPlaylist(); return false;">삭제</button>
	</span>
<hr>		


<div class="divSearch">
<form>
	<div class="divList">
	<table border="1" class="box2" style="width: 500px">
		<tr>
			<th><input type="checkbox"  title="전체 선택" id="all-check"></th>
			<th>번호</th>
			<th>앨범명</th>
			<th>가수</th>
			<th>장르</th>
		</tr>
		
		<c:if test="${empty list }">
			<tr>
				<td colspan="4">재생 목록에 추가된 곡이 없습니다.<br> 곡을 선택하세요.</td>
			</tr>
		</c:if>
					  
	  	<!--게시판 내용 반복문 시작  -->
	  	<c:if test="${!empty list}"><%=list %>
		  	<c:set var="num" value="${pageVo.num }" />
		  	<c:set var="curPos" value="${pageVo.curPos }" />
	  	
		  	<c:forEach var="i" begin="1" end="${pageVo.pageSize }">
		  		<c:if test="${num>=1 }">
		  			<c:set var="vo" value="${list[curPos] }" />
				  	<c:set var="num" value="${num-1 }" />
				  	<c:set var="curPos" value="${curPos+1 }" />		  			
	  			</c:if>
					
						
				<tr>
					<td><input type="checkbox"  title="전체 선택" id="all-check"></td>
					<td>${dto.albumno}</td>
					<td>${dto.title }</td>
					<td>${dto.singer}</td> 
					<td>${dto.genre}</td>
				</tr>
			</c:forEach>
		</c:if>
				
	</table>
	</div>
</form>
  
<hr>

	<!-- 페이징처리 -->
	<div class="divPage">
		
	<!-- 이전 블럭으로 이동 ◀ -->
	<c:if test="${pageVo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pageVo.firstPage-1})">
			<img src="<c:url value='../images/first.JPG'/>" alt="이전 블럭으로 이동">
		</a>
	</c:if> 
	
	<!-- 페이지 번호 [1][2][3] -->
	<c:forEach var="i" begin="${pageVo.firstPage }" 
		end="${pageVo.lastPage }">
		<c:if test="${i<=pageVo.totalPage }">
			<c:if test="${i!=pageVo.currentPage }">
				<a href="#" onclick="pageProc(${i})">[${i}]</a>			
			</c:if>
			<c:if test="${i==pageVo.currentPage }">
				<span style="color:blue;font-weight:bold">${i}</span>			
			</c:if>			
		</c:if>
	</c:forEach>
		
	<!-- 다음 블럭으로 이동 ▶ -->
	<c:if test="${pageVo.lastPage < pageVo.totalPage }">
		<a href="#" onclick="pageProc(${pageVo.lastPage+1})">
			<img src="<c:url value='../images/last.JPG'/>" 
				alt="다음 블럭으로 이동">
		</a>
	</c:if>
	</form>
	
	</div> <!-- 페이징처리 끝 -->
	</div> <!--divSearch-->
</div> 
</body>
</html>