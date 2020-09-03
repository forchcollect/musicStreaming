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
<title>�÷��̸���Ʈ������</title>

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
	<p>�˻��� : ${param.searchKeyword }, ${pageVo.totalRecord}�� �˻��Ǿ����ϴ�.</p>
</c:if>

<!-- post������� ����¡ ó�� -->
<form action="<c:url value='/playlist/playaList2.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">	
</form>

<div>
	<a href="#" onclick="FAQ������" return false;">FAQ</a>
	<a href="#" onclick="�̿��������" return false;">�̿�Ǳ���</a>	
</div>

<a href="#" class="like">���ƿ�</a>

<select name="item">
	<option value="">������</option>
	<option value="">�� ����</option>
	<option value="">�ٹ� ����</option>
	<option value="">��Ƽ��Ʈ ����</option>
</select>
<button type="button" class="lyrics" title="������ü����">���纸��</button>
</div>
<br>


<div>
<h2> 

������(IU) - ����(Prod.&Feat. SUGA of BTS) </h2>
<div class="thumb">
	<img src="../album_images/album19.PNG" alt="������">
</div>
<audio preload="auto" controls>
	<source src="https://www.w3schools.com/html/horse.mp3">
</audio>

<!-- ��α��� �� -->
<div class="payment">
	<p class="txt ellipsis">�α��� ��, ���� ��Ʈ������ �̿��� ������.</p>
</div>
</div>


<div class="list">
	
<hr>
<div class="toolbar">
	<input type="checkbox"  title="��ü ����" id="all-check">
	<span class="btn-sort clearfix">
		<button type="button" class="btn up" title="�����̵� �巡�װ���">���õ� �� ���� �̵�</button>
		<button type="button" class="btn down" title="�����̵� �巡�װ���">���õ� �� �Ʒ��� �̵�</button>
		<button type="button" class="btn btn-del" onclick="fnDelPlaylist(); return false;">����</button>
	</span>
<hr>		


<div class="divSearch">
<form>
	<div class="divList">
	<table border="1" class="box2" style="width: 500px">
		<tr>
			<th><input type="checkbox"  title="��ü ����" id="all-check"></th>
			<th>��ȣ</th>
			<th>�ٹ���</th>
			<th>����</th>
			<th>�帣</th>
		</tr>
		
		<c:if test="${empty list }">
			<tr>
				<td colspan="4">��� ��Ͽ� �߰��� ���� �����ϴ�.<br> ���� �����ϼ���.</td>
			</tr>
		</c:if>
					  
	  	<!--�Խ��� ���� �ݺ��� ����  -->
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
					<td><input type="checkbox"  title="��ü ����" id="all-check"></td>
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

	<!-- ����¡ó�� -->
	<div class="divPage">
		
	<!-- ���� ������ �̵� �� -->
	<c:if test="${pageVo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pageVo.firstPage-1})">
			<img src="<c:url value='../images/first.JPG'/>" alt="���� ������ �̵�">
		</a>
	</c:if> 
	
	<!-- ������ ��ȣ [1][2][3] -->
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
		
	<!-- ���� ������ �̵� �� -->
	<c:if test="${pageVo.lastPage < pageVo.totalPage }">
		<a href="#" onclick="pageProc(${pageVo.lastPage+1})">
			<img src="<c:url value='../images/last.JPG'/>" 
				alt="���� ������ �̵�">
		</a>
	</c:if>
	</form>
	
	</div> <!-- ����¡ó�� �� -->
	</div> <!--divSearch-->
</div> 
</body>
</html>