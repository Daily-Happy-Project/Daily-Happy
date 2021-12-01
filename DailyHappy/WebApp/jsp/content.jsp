<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	String jarName = request.getParameter("jarName");
	
	
	WritingDAO dao = new WritingDAO();
	num = dao.randomNo(email, jarName);
	else {
		out.print("글 작성 중 오류가 발생하였습니다.");
	}
%>