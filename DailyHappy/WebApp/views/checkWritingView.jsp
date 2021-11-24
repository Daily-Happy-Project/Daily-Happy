<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail=request.getParameter("email");
	String ujarName=(String)session.getAttribute("nowJar");
	WritingDAO dao = new WritingDAO();
	
	dao.content(uemail, ujarName);
	ResultSet rs = dao.content(uemail, ujarName);
	dao.deleteJarView(uemail);
	
	String str="";
	while(rs.next()){
		str+="<div class=\"writing\">";
		str+="<div class=\"contnet" + rs.getString("content") + "</div>";
		str+="<div class=\"name" + rs.getString("name") + "</div>";
		str+="<div class=\"ts" + rs.getString("ts") + "</div>";
				
		str+="</div>";
	}
%>
