<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>

<style type="text/css">
 table{
 	border-top: none;
 	text-align: center;
 }
</style>
</head>
<body>
<%
	String uemail = (String)session.getAttribute("email");
	String umember = (String)session.getAttribute("memberType");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
	}
	String managerType = "K";
	if (!umember.equals(managerType)) {

		String goback = "<script type=\"text/javascript\">";
		goback += "alert(\"접근 권한이 없습니다! 나의 회원 등급: "+umember+"\");";
		goback += "history.back();";
		goback += "</script>";
		out.print(goback);

		return;
		//test string: 
		//uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	session.setAttribute("memberType", umember);

	ArrayList<UserObj> list = (new UserDAO()).getUserList();
%>
        <header>
            <h2 class="title">회원 관리</h2>
		<%@include file="header.html"%>
        </header>
	<article>
		<%
			String str = "<form method=\"get\" action=\"../jsp/userDel.jsp\">";
			str += "<table align=\"center\">";
			str += "<tr><th>이름</th><th>이메일</th><th>보유코인</th><th>회원유형</th><th>삭제<th>";
			str += "<tr><td colspan=5><hr></td></tr>";
			for (UserObj user : list) {
			str += "<tr>";
			str += "<td>" + user.getName() + "</td>";
			str += "<td>" + user.getEmail() + "</td>";
			str += "<td>" + user.getCoin() + "</td>";
			str += "<td>" + user.getMemberType() + "</td>";
			str += "<td><input type=\"checkbox\" name=\"delUser\" value=\""+ user.getEmail() +"\"></td>";
			str += "</tr>";
			}
			str += "<tr><td colspan=5><input type=\"submit\" value=\"선택한 계정 삭제\"></td></tr>";
			str += "</table>";
			str += "</form>";
		out.print(str);
		%>
	</article>
</body>
</html>