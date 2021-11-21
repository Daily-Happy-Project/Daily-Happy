<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
request.setCharacterEncoding("utf-8");

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
	session.setAttribute("email", uemail);
	if(loginChk != null){	//auto login
        Cookie cookie = new Cookie("email", uemail);
        cookie.setMaxAge(60);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
	out.print("로그인 되었습니다: "+uemail);
	out.print("<a href=\"../views/mainView.jsp\">메인화면 가기</a>");
}
%>