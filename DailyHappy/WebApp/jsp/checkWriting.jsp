<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	new WritingDAO().deleteJarView(((String)session.getAttribute("email")));
	response.sendRedirect("../views/mainView.jsp");
%>