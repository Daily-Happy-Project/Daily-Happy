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

<<<<<<< HEAD
/* 	int no = Integer.parseInt(request.getParameter("no")); */
	int no = (Integer)session.getAttribute("no");
=======
	int no = session.getAttribute("no");
>>>>>>> main
	String email = (String)session.getAttribute("email");
	String jarName = request.getParameter("jarName");
	
	
<<<<<<< HEAD
	new WritingDAO().delete(no, jarName, email);
=======
	WritingDAO dao = new WritingDAO();
>>>>>>> main

%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<<<<<<< HEAD
글 삭제가 완료되었습니다.
=======

>>>>>>> main
</body>
</html>