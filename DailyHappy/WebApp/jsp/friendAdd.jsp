<%@ page contentType="text/html" pageEncoding="utf-8" %> 
<%@ page import="dao.*" %>
<%
	String uid = request.getParameter("uemail"); 
	String frid = request.getParameter("fremail"); 
	out.print((new FriendDAO()).insert(uid, frid));
%>