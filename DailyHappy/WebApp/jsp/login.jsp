<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/allStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/formStyle.css">
</head>
<%
request.setCharacterEncoding("utf-8");

String uemail = request.getParameter("email");
String upw = request.getParameter("pw");

UserDAO dao = new UserDAO();
int code = dao.login(uemail, upw);
if(code ==1){
	out.print("아이디 없음");
}
else if(code==2){
	out.print("비밀번호 없음");
}
else{
	session.setAttribute("email", uemail);
	out.print("로그인 되었습니다: "+uemail);
}
%>