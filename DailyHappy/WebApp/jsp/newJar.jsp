<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	String jarName=request.getParameter("Jname");
	int jarCode=Integer.parseInt(request.getParameter("jarCode"));
	String foldMethodName=request.getParameter("Pshape");
	int goalNum=Integer.parseInt(request.getParameter("GoalNum"));
	
	
	new JarDAO().insert(email, jarName, jarCode, foldMethodName, goalNum);
	/* new UserItemDAO().insert(email, jarCode); */
	
	out.print("새 유리병 추가가 완료되었습니다.");
	
%>