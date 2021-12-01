<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%

   request.setCharacterEncoding("utf-8");
      
   String uemail = request.getParameter("email");
   String upass = request.getParameter("pw");
   String uname = request.getParameter("username");
   
   UserDAO dao = new UserDAO();
   UserItemDAO uidao = new UserItemDAO();
   
   if (dao.exists(uemail)) {
<<<<<<< HEAD
	   
%>
<script>
	alert("이미 가입한 회원입니.");
	location.href='../views/loginView.jsp';
</script>	   
<%
=======
	   out.print("이미 가입한 회원입니다.");
>>>>>>> main
	   return;
   }
   
   else if (dao.insert(uemail, uname, upass)) {
<<<<<<< HEAD
	   uidao.insert(uemail, 1, "jar");
	   uidao.insert(uemail, 2, "paper");
	   uidao.insert(uemail, 3, "foldMethod");
	   uidao.insert(uemail, 4, "paper");
	   uidao.insert(uemail, 5, "paper");
	
//	   out.print("회원 가입이 완료되었습니다^^");
//	   out.print("<a href=\"../views/loginView.jsp\">로그인</a>");

//		out.print("<script>alert('회원가입이 완료되었습니다.');</script>");
//		out.println("<script>location.href='../views/loginView.jsp'; </script>");
%>
<script>
	alert("회원 가입이 완료되었습니다.");
	location.href='../views/loginView.jsp';
</script>
<%
   }
   
   else {
	   
%>
<script>
	alert("회원 가입 처리 중 오류가 발생하였습니다.");
	location.href='../views/loginView.jsp';
</script>
<%
   }
//   response.sendRedirect("../views/loginView.jsp");
%>
=======
	   uidao.insert(uemail, 1);
	   uidao.insert(uemail, 2);
	   uidao.insert(uemail, 3);			   
	
	   out.print("회원 가입이 완료되었습니다^^");
	   out.print("<a href=\"../views/loginView.jsp\">로그인</a>");
   }
   
   else {
   	   out.print("회원 가입 처리 중 오류가 발생하였습니다.");
   }
   
%>
>>>>>>> main
