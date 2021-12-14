<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	int loc = 0;
	
	String email = (String)session.getAttribute("email");
	String jarName=request.getParameter("Jname");
	String Jshape=request.getParameter("Jshape");
	String Fshape=request.getParameter("Fshape");
	int goalNum=Integer.parseInt(request.getParameter("GoalNum"));
	boolean shareState=Boolean.parseBoolean(request.getParameter("shareState"));
	String jarImgName=Jshape+Fshape;
	
	
	new JarDAO().insert(email, jarName, Jshape, Fshape, goalNum, shareState, jarImgName);
%>


<%	
	String str = ("<script type=\"text/javascript\">");
	str += ("alert(\"새 유리병 추가가 완료되었습니다.\");");
	str += ("var loc ="+ loc +";");
	str += ("if(loc==0){ window.location = \"../views/myJarView.jsp\";}");
	str += ("else{ window.location = document.referrer;}");
	out.print(str);
	
%>

</script>
</body>
</html>