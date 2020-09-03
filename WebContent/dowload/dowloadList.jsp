<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>다운로드 리스트</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<h2>게시판</h2>
<%-- <%if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=pageVo.getTotalRecord() %>건 검색되었습니다.</p>
<%}else{ 
	keyword="";
} %> --%>

<!-- post방식으로 페이징 처리 -->
<form action="<%=request.getContextPath() %>/dowload/dowloadList.do" name="frm" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="<%=condition%>">
	<input type="hidden" name="searchKeyword" value="<%=keyword%>">	
</form>

<div class="divList">
<table class="box2" summary="다운로드 정보를 제공합니다.">
	<caption>기본 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody>
		<%if(list==null || list.isEmpty()){ %>
			<tr>
				<td colspan="5" class="align_center">
					게시판 글이 존재하지 않습니다.</td>
			</tr>			
		<%}else{ %>  
		  	<!--게시판 내용 반복문 시작  -->
		  	<%
		  	int num=pageVo.getNum();
		  	int curPos=pageVo.getCurPos();
		  	
		  	for(int i=0;i<pageVo.getPageSize();i++){
		  		if(num-- < 1) break;
		  		
		  		dowloadVO vo = list.get(curPos++);
		  	%>		
				<tr class="align_center">
					<td><%=vo.getNo() %></td>
					<td class="align_left"><%=vo.getNo()%></a></td>
					<td><%=vo.getUserno() %></td>
					<td><%=vo.getSongno()%></td>		
					<td><%=vo.getDown()%></td>		
				</tr> 
			<%}//for %>
		  	<!--반복처리 끝  -->
	  	<%}//if %>
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 ◀ -->
	<%if(pageVo.getFirstPage()>1){ %>
		<a href="#" onclick="pageProc(<%=pageVo.getFirstPage()-1%>)"></a>
	<%} %>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
		if(i > pageVo.getTotalPage()) break;
	%>
		<%if(i!=pageVo.getCurrentPage()){%>
			<a href="#" onclick="pageProc(<%=i%>)">
				[<%=i %>]</a>
		<%}else{ %>
			<span style="color:blue;font-weight:bold"><%=i %></span>
		<%}//if %>					
	<%}//for %>	
	
	<!-- 다음 블럭으로 이동 ▶ -->
	<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
		<a href="#" onclick="pageProc(<%=pageVo.getLastPage()+1%>)">
			<img src="../images/last.JPG" alt="다음 블럭으로 이동">
		</a>
	<%} %>
	<!--  페이지 번호 끝 -->
</div>

<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<%=request.getContextPath() %>/dowload/dowloadList.do'>
        <select name="searchCondition">
            <option value="title" 
            	<%if("title".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >제목</option>
            <option value="content" 
            	<%if("content".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >내용</option>
            <option value="name" 
            	<%if("name".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="<%=keyword%>">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <a href='<%=request.getContextPath() %>/dowload/write.do' >글쓰기</a>
</div>

</body>
</html>

