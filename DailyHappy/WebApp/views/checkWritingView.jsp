<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail=request.getParameter("email");
	String ujarName=(String)session.getAttribute("nowJar");
	
	ResultSet rs = new WritingDAO().content(uemail, ujarName);
	
	String str="";
	while(rs.next()){
		str+="<div class=\"writing\">";
		str+="<div class=\"contnet" + rs.getString("content") + "</div>";
		str+="<div class=\"name" + rs.getString("name") + "</div>";
		str+="<div class=\"ts" + rs.getString("ts") + "</div>";
				
		str+="</div>";
		
	}	
	
%>

<%-- <%

			String str = "<form method=\"get\" action=\"../jsp/userDel.jsp\">";
			str += "<table align=center>";
			str += "<tr><th>이름</th><th>이메일</th><th>보유코인</th><th>회원유형</th><th>삭제<th>";
			str += "<tr colspan=5><hr></tr>";
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
		%> --%>

