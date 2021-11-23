<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String itemName = request.getParameter("itemName");
	String itemType = request.getParameter("itemType");
	int price = Integer.parseInt(request.getParameter("price"));
	String info = request.getParameter("info");
	String img1 = request.getParameter("img1");
	
	out.print("아이템 추가가 완료되었습니다.");
	
%>