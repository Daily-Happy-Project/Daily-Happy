<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null) {
		userID=(String) session.getAttribute("userID");
	}

/* 	int no = Integer.parseInt(request.getParameter("no")); */
	int no = (Integer)session.getAttribute("no");
	String email = (String)session.getAttribute("email");
	String jarName = request.getParameter("jarName");
	
	
	new WritingDAO().delete(no, jarName, email);

%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
글 삭제가 완료되었습니다.
</body>
</html>