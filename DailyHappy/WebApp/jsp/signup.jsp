<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
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
   out.print("회원 가입이 완료되었습니다.");
   out.print("<a href=\"../views/loginView.jsp\">로그인</a>");
   }
   else {
   out.print("회원 가입 처리 중 오류가 발생하였습니다.");
   }
   out.print("<a href=\"../views/mainView.jsp\">메인화면 가기</a>");
%>