<%@ page contentType="text/html" pageEncoding="utf-8" %> 
<%
String uid = (String) session.getAttribute("id"); 
if (uid == null) {
out.print("로그인 정보가 없습니다."); 
}
else {
out.print("메인 페이지입니다."); 
session.setAttribute("id", uid);
}
%>