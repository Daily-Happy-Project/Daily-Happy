<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성</title>
</head>


<body>
	<header>
	    <h2 class="title">학종이에 글 적기</h2>
		<%@include file="../views/header.html"%>
	</header>
	
	<article align="center">
			
	<%
		request.setCharacterEncoding("utf-8");
		
		String email = (String)session.getAttribute("email");
		String content = request.getParameter("content");
		int paperCode = Integer.parseInt(request.getParameter("paperCode"));
	 	String jarName = request.getParameter("jarName");
		
		
		WritingDAO dao = new WritingDAO();
		if (dao.insert(email, content, paperCode, jarName)){
			response.sendRedirect("../views/foldPaperView.jsp");
/* 			out.print("글 작성이 완료되었습니다.<br><br>");
			out.print("<a href=\"../views/foldPaperView.jsp\">종이 접기</a>"); */
		}
		else {
			out.print("글 작성 중 오류가 발생하였습니다.");
		}
		
	%>
	</article>

</body>
</html>