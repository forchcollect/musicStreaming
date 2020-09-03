<%@page import="com.music.common.PagingVO"%>
<%@page import="song.model.SongVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	List<SongVO> list = (List<SongVO>)request.getAttribute("list");
	PagingVO pageVo=(PagingVO)request.getAttribute("pageVo");
	
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");

 %>
 
 <style type="text/css">
 .di1{
 	float: left;
 
 }
 
 </style>
 
 <div class="di1">
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<title>�÷��̸���Ʈ</title>

<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
<body>
<%if(keyword!=null && !keyword.isEmpty()){ %>
   <p>�˻��� : <%=keyword %>, <%=pageVo.getTotalRecord() %>�� �˻��Ǿ����ϴ�.</p>
<%}else{ 
   keyword="";
} %>


<!-- post������� ����¡ ó�� -->
<form action="<%=request.getContextPath() %>/board/list.do" 
   name="frmPage" method="post">
   <input type="hidden" name="currentPage">
   <input type="hidden" name="searchCondition" value="<%=condition%>">
   <input type="hidden" name="searchKeyword" value="<%=keyword%>">   
</form>

<div class="divList">
	<a href="#" onclick="FAQ������" return false;">FAQ</a>
	<a href="#" onclick="�̿��������" return false;">�̿�Ǳ���</a>	
	
</div>

<div class="list">
	
<hr>
<div class="toolbar">
	<input type="checkbox"  title="��ü ����" id="all-check">
	<span class="btn-sort clearfix">
		<button type="button" class="btn up" title="�����̵� �巡�װ���">��</button>
		<button type="button" class="btn down" title="�����̵� �巡�װ���">��</button>
		<button type="button" class="btn btn-del" onclick="fnDelPlaylist(); return false;">����</button>
	</span>
<hr>		

<!-- �˻� �κ� -->
<div class="divSearch">
<form>
	<div class="divList">
	<table border="1" class="box2" style="width: 500px">
		 <thead>
		
		<tr>
			<th><input type="checkbox"  title="��ü ����" id="all-check"></th>
			<th>��ȣ</th>
			<th>Ÿ��Ʋ</th>
			<th>����</th>
			<th>�ۻ�</th>
			<th>�۰�</th>
		</tr>
		</thead>
		<tbody>
		<%if(list==null || list.isEmpty()) { %>
         <tr>
            <td colspan="6" class="align_center"> ���õ� ���� �����ϴ�.</td>
         </tr>         
      <%}else{ %>  
           <!--�Խ��� ���� �ݺ��� ����  -->
           <%
           int num=pageVo.getNum();
           int curPos=pageVo.getCurPos();
           
           for(int i=0;i<pageVo.getPageSize();i++){
              if(num-- < 1) break;
              
              SongVO vo = list.get(curPos++);
           %>      
            <tr class="align_center">
               <td><%=vo.getSongno() %></td>
               <td><%=vo.getTitle() %></td>
               <td><%=vo.getSinger() %></td>
               <td><%=vo.getLyricWriter() %></td>
               <td><%=vo.getSongWriter()%></td>
            </tr> 
         <%}//for %>
           <!--�ݺ�ó�� ��  -->
        <%}//if %>
     </tbody>
</table>      
</div>

 </div>