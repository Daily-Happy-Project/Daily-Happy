<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 유리병 만들기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	String jarName=request.getParameter("Jname");
	String Jshape=request.getParameter("Jshape");
	String Fshape=request.getParameter("Fshape");
	int goalNum=Integer.parseInt(request.getParameter("GoalNum"));
	String jarImgName=Jshape+Fshape;
	
	
	new JarDAO().insert(email, jarName, Jshape, Fshape, goalNum, jarImgName);
	/* new UserItemDAO().insert(email, jarCode); */
	
	out.print("새 유리병 추가가 완료되었습니다.");
	
%>

</body>
</html>