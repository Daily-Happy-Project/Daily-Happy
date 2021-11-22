<%@ page contentType="text/html" pageEncoding="utf-8" %> 
<%
session.invalidate();
response.sendRedirect("../views/loginView.jsp");
%>