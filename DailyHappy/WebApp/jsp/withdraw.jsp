<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String email = (String)session.getAttribute("email");
	
	new UserDAO().delete(email);
	new JarDAO().deleteJarTable(email);
	new WritingDAO().deleteWritingTable(email);
	new FriendDAO().deleteFriendTable(email);
	
	WritingDAO dao = new WritingDAO();
	if (new UserDAO().delete(email) && new WritingDAO().deleteWritingTable(email) && new JarDAO().deleteJarTable(email) && new UserItemDAO().deleteItemTable(email) && new FriendDAO().deleteFriendTable(email) ){
		out.print("탈퇴가 완료되었습니다.");
	}
	else {
		out.print("탈퇴 중 오류가 발생하였습니다.");
	}
	
%>