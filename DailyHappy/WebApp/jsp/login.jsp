<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%
String uid = request.getParameter("id");
if (uid == null) {
out.print("로그인 정보가 없습니다."); 
}
else {
session.setAttribute("id", uid); 
response.sendRedirect("main.jsp");
}
%>