<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	String content = request.getParameter("content");
	int paperName = Integer.parseInt(request.getParameter("paperCode"));
	String jarName = request.getParameter("jarName");
	
	
	WritingDAO dao = new WritingDAO();
	if (dao.insert(email, content, paperName, jarName)){
		out.print("글 작성이 완료되었습니다.");
	}
	else {
		out.print("글 작성 중 오류가 발생하였습니다.");
	}
%>