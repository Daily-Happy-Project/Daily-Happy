<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<% 
	String email=request.getParameter("email");
	out.print((new UserDAO()).get(email));
%>