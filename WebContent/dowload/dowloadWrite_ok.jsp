<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	String upPath="dowload_upload";
	String saveDir=application.getRealPath(upPath);
	saveDir=config.getServletContext().getRealPath(upPath);
	saveDir
="D:\\lecture\\workspace_list\\jsp_ws\\music\\WebContent\\dowload_upload";

	int maxSize=2*1024*1024;
	
	try{
		MultipartRequest mr 
		= new MultipartRequest(request, saveDir, maxSize, "utf-8",
				new DefaultFileRenamePolicy());
		System.out.println("���� ���ε� �Ϸ�!");
		
		Enumeration en=mr.getFileNames();
		while(en.hasMoreElements()){
			String name=(String)en.nextElement();
			
			String fileName=mr.getFilesystemName(name);
			if(fileName!=null && !fileName.isEmpty()){
				File file=mr.getFile(name);
				long fileSize=file.length();
				String originName=mr.getOriginalFileName(name);
				
				out.print("<p>���ε� ����:"+fileName+"</p>");
				out.print("<p>���ε� ����ũ��:"+fileSize+"</p>");
				out.print("<p>���� ����:"+originName+"</p><hr>");
			}
		}
		
		String id=mr.getParameter("id");
		String addr=mr.getParameter("address");
		
		out.print("<p>id : "+id+"</p>");
		out.print("<p>address : "+addr+"</p>");
	}catch(IOException e){
		System.out.println("2M�̻��� ������ ���ε� �Ұ�!!");
		e.printStackTrace();
	}
%>

</body>
</html>