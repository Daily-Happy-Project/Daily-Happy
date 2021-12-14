<%@ page contentType="text/html" pageEncoding="utf-8" %> 
<%@ page import="dao.*" %>
<%
	String uid = request.getParameter("uemail");
	out.print((new FriendDAO()).getList(uid)); 
%>