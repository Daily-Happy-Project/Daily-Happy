<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>작성글 확인</title>
</head>

<body>

<%
	String uemail=(String)session.getAttribute("email");
	String ujarName=(String)session.getAttribute("nowJar");
	WritingDAO dao = new WritingDAO();
	
	
	ArrayList<WritingObj> wObj = dao.content(uemail, ujarName);
	
	
	String str="";
	for(WritingObj obj : wObj){
		String content = obj.getContent();
		Date ts = obj.getTs();
		str+="<div class=\"writing\">";
		str+="<div class=\"contnet" + content + "</div>";
		str+="<div class=\"name" + uemail + "</div>";
		str+="<div class=\"ts" + ts + "</div>";
		str+="</div>";
	}
	
/*  	dao.deleteJarView(uemail); */
%>

</body>