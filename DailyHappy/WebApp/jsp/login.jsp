<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="main.UserDAO" %>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String upw = request.getParameter("pw");

UserDAO dao = new UserDAO();
int code = dao.login(uid, upw);
if(code ==1){
	out.print("아이디 없음");
}
else if(code==2){
	out.print("비밀번호 없음");
}
else{
	session.setAttribute("id", uid);
	out.print("로그인 되었습니다: "+uid);
}
%>