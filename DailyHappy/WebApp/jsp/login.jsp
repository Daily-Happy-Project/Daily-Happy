<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

	
	
%>
<%
String uemail = request.getParameter("email");
String upw = request.getParameter("pw");
String loginChk = request.getParameter("loginChk");


UserDAO dao = new UserDAO();
int code = dao.login(uemail, upw);
if(code ==1){
	out.print("아이디 없음");
}
else if(code==2){
	out.print("비밀번호 없음");
}
else{
	ArrayList<UserObj> list = (new UserDAO()).myInfo(uemail);
	for (UserObj user : list) {
		session.setAttribute("email", uemail);
		session.setAttribute("memberType", user.getMemberType());
	}
	
	
	if(loginChk != null){	//auto login
        Cookie cookie = new Cookie("email", uemail);
        cookie.setMaxAge(60);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
    response.sendRedirect("../views/mainView.jsp");
	
}
%>