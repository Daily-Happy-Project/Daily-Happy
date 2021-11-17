<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%

   request.setCharacterEncoding("utf-8");
      
   String uid = request.getParameter("id");
   String upass = request.getParameter("pw");
   String uname = request.getParameter("username");
   
   UserDAO dao = new UserDAO();
   if (dao.exists(uid)) {
   out.print("이미 가입한 회원입니다.");
   return;
   }
   if (dao.insert(uid, upass, uname)) {
   out.print("회원 가입이 완료되었습니다.");
   }
   else {
   out.print("회원 가입 처리 중 오류가 발생하였습니다.");
   }
   
   String splitUid[] = uid.split("@");
   uid=splitUid[0];
   
   //sql = "CREATE TABLE IF NOT EXIST " + uid + 
//         "JarList(jarName VARCHAR(32) PRIMARY KEY, foldmethodName VARCHAR(32), cnt int UNSIGNED AUTO_INCREMENT)";
	    
   
   
   out.print("회원가입이 완료되었습니다 ^^");
   
%>