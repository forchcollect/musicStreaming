<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>상세보기 </title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css' />" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/clear.css' />" >
<link rel="stylesheet" type="text/css" href=" <c:url value='/css/formLayout.css' />" >
<link rel="stylesheet" type="text/css" href=" <c:url value='/css/mystyle.css' />" >
<style type="text/css">
   body{
      padding:5px;
      margin:5px;
    }
   .divForm {
      width: 500px;
      }
</style>  
</head>
<body>
   <h2>상세보기</h2>
   <div class="divForm">
      <div class="firstDiv">
         <span class="sp1">번호</span> <span>${vo.songno}</span>
      </div>
      <div>
         <span class="sp1">노래명</span> <span>${title}</span>
      </div>
      <div>
         <span class="sp1">가수</span> <span>${singer}</span>
      </div>
      <div>
         <span class="sp1">작사</span> <span>${genre}</span>
      </div>
	 <div>
         <span class="sp1">작곡</span> <span>${genre}</span>
      </div>
      <div class="center">
         <a href="<c:url value='/song/SongEdit.do?no=${param.no}' />">수정</a>
           <a href="<c:url value='/song/SongDelete.do?no=${param.no}'/>"> 삭제</a> |
           <a href="<c:url value='/song/playlistList1_2.do'/>"> 목록</a>         
      </div>
   </div>

   
</body>
</html>