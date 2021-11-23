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

<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%

   request.setCharacterEncoding("utf-8");
      
   String uemail = request.getParameter("email");
   String upass = request.getParameter("pw");
   String uname = request.getParameter("username");
   
   UserDAO dao = new UserDAO();
   if (dao.exists(uemail)) {
   out.print("이미 가입한 회원입니다.");
   return;
   }
   if (dao.insert(uemail, uname, upass)) {
   uemail = new UserDAO().splitemail(uemail);
   new UserItemDAO().insert(uemail, 1);
   new UserItemDAO().insert(uemail, 2);
   new UserItemDAO().insert(uemail, 3);
   
   out.print("회원 가입이 완료되었습니다.");
   out.print("<a href=\"../views/loginView.jsp\">로그인</a>");
   }
   else {
   out.print("회원 가입 처리 중 오류가 발생하였습니다.");
   }
%>