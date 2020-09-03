<%@page import="cont.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="cont.QueryVO"%>
<%@page import="java.util.List"%>
<%@page import="cont.QueryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
			
	//1	
	request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("searchKeyword");
	
	
	//2
	QueryDAO dao = new QueryDAO();

	List<QueryVO> list=null;
	
	try{
		list=dao.selectAll(keyword);
		System.out.println("list="+list);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	/* SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); */
	//페이징 처리
	
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null 
		&& !request.getParameter("currentPage").isEmpty()){
		currentPage
		=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize=5; 
	int blockSize=10; //블럭 사이즈 1~10, 11~20 => 10
	int totalRecord=list.size(); //전체 레코드 개수, 예)17
	
	PagingVO pageVo 
		= new PagingVO(currentPage, totalRecord, pageSize, blockSize);
			
%>




<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>twoplj</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<!-- bradcam_area  -->
	<div class="bradcam_area breadcam_bg_2">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text text-center">
						<h3>내 공 간</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->






	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding"
		style="padding-top: 0px;">
		<div class="container">
			<div class="row">

				<div class="comments-area" style="margin:0px;">
					<div style="width: 40%; float: right;">
						<form action="list.jsp">
							<div class="form-group">
								<div class="input-group mb-3">
									
									
									<input type="text" class="form-control"
										placeholder='Search Keyword' onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search Keyword'" 
											<%if(keyword!=null && !keyword.isEmpty()){%>
										value="<%=keyword%>" 
										<%}%>
										name="searchKeyword" title="검색어 입력">
									
										

									<div class="input-group-append"></div>
									<button class="btn" type="submit" id="bt_keywordsearch">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>

						</form>
					</div>
					
					<h4> What can we help you with?</h4>
					<div class="comments-area">
					



				<%if(list==null || list.isEmpty()){ %>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="img/comment/comment_1.png" alt="">
								</div>
									
								<div class="desc">
									<p class="comment">등록된 글이 없습니다</p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5><a href="#"></a></h5>
											<p class="date"></p>
										</div>
										<div class="reply-btn">
										</div>
									</div>
								</div>
										
							</div>
						</div>
					</div>
					<br>
				
				
				
				
				
				
					<%}else{
					
					  	int num=pageVo.getNum();
					  	int curPos=pageVo.getCurPos();
					  	
					  	for(int i=0;i<pageVo.getPageSize();i++){
					  		if(num-- < 1) break;
					  		
					  		QueryVO vo = list.get(curPos++);
				  	%>		


					<div class="comment-list">

						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="img/comment/comment_1.png" alt="">
								</div>
									
								<div class="desc">
									<p class="comment"><%=vo.getMessage() %></p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5><a href="#"><%=vo.getid() %></a></h5>
											<p class="date"><%=vo.getRegdate() %> <%=vo.getReadcount() %>회 조회됨! </p>
										</div>
										<div class="reply-btn">
											<a href="cont_reply.jsp?no=<%=vo.getNo() %>" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
										
							</div>
						</div>
					</div>
					<%} %>
					
			<div>
			
			<%if(keyword!=null && !keyword.isEmpty()){ %>
					<p>
						검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.
					</p>
					<%}else{ keyword=""; } %>
			
			</div>
			
			
			
			
			<div class="Pageing">
	<%if(pageVo.getFirstPage()>1){ %>
		<a href="list.jsp?currentPage=<%=pageVo.getFirstPage()-1%>"> ◀ </a>
	<%} %>
	
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){ 
		if(i > pageVo.getTotalPage()) break;%>
		<%if(i!=currentPage){%>
			<a href="list.jsp?currentPage=<%=i%>">[<%=i %>]</a>
		<%}else{ %>
			<span style="color:blue;font-weight:bold"><%=i %></span>
		<%}//if %>					
	<%}//for %>	
	
	<!-- 다음 블럭으로 이동 ▶ -->
	<%if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
		<a href="list.jsp?currentPage=<%=pageVo.getLastPage()+1%>"> ▶ </a>
	<%} %>
	<%} %>
	<!--  페이지 번호 끝 -->
</div>
			<br>
			
			<div style="margin-top: 100px;">


				<span style="margin-left: 100px;"><a href="detail.jsp">	개인정보열람 </a></span> 
				<span style="margin-left: 100px;"><a href="memberout.jsp"> 회원탈퇴 </a></span> 
				<span style="margin-left: 100px;"><a href="cont.jsp">문의올리기</a></span> 
				<span style="margin-left: 100px;"><a> 내플레이리스트</a></span>
				 <span style="margin-left: 100px;"><a>내정보</a></span>


			</div>
			<!-- <div class="col-lg-4">


				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget"></aside>
					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">내 공 간</h4>
						<ul class="list cat-list">
							<li><a href="#" class="d-flex">
									<p>> 내정보수정</p>

							</a></li>
							<li><a href="#" class="d-flex">
									<p>> 회원탈퇴</p>
							</a></li>
							<li><a href="#" class="d-flex">
									<p>> 문의하기</p>
							</a></li>
							<li><a href="#" class="d-flex">
									<p>> 내재생리스트</p>
							</a></li>
							<li><a href="#" class="d-flex">
									<p>Inspiration</p>
									<p>(21)</p>
							</a></li>
							<li><a href="#" class="d-flex">
									<p>Health Care</p>
									<p>(21)</p>
							</a></li>
						</ul>
					</aside>

				</div>
			</div>
		</div>-->
		</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->





	<!-- <script>
				$('#datepicker').datepicker({
					iconsLibrary : 'fontawesome',
					icons : {
						rightIcon : '<span class="fa fa-caret-down"></span>'
					}
				});
				$('#datepicker2').datepicker({
					iconsLibrary : 'fontawesome',
					icons : {
						rightIcon : '<span class="fa fa-caret-down"></span>'
					}

				});
			</script> -->
</body>

</html>