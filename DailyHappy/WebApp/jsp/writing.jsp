<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	String sql = "SELECT * FROM feed ORDER BY ts DESC";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	String str = "<table align=center>";
	str += "<tr><th colspan=2>작성글 리스트</th></tr>";
	while(rs.next()) {
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td><small>" + rs.getString("id") + "</small></td>";
		str += "<td><small>&nbsp;(" + rs.getString("ts") + ")</small></td>";
		str += "</tr>";
		str += "<tr><td colspan=2>" + rs.getString("content") + "</td></tr>";
	}
	str += "</table>";
	out.print(str);
	
	rs.close(); stmt.close(); conn.close();
%>


<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="core.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	
	UserDAO dao = new UserDAO();
	int code = dao.login(uid, upass);
	if (code == 1) {
		out.print("아이디가 존재하지 않습니다.");
	}
	else if (code == 2) {
		out.print("패스워드가 일치하지 않습니다.");
	}
	else {
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}
%>



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