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
</head>
<body>
<% 
	String userList[] = request.getParameterValues("delUser");
	
	int loc = 0;
	if (userList.length > 1){
		loc = 1;
	}
	UserDAO dao = new UserDAO();
	
	
	for(String user : userList){
		dao.delete(user);
		new WritingDAO().deleteWritingTable(user);
		new JarDAO().deleteJarTable(user);
		new UserItemDAO().deleteItemTable(user);
	}
%>

<%
	String str = ("<script type=\"text/javascript\">");
	str += ("alert(\"계정 삭제가 완료되었습니다. 감사합니다.\");");
	str += ("var loc ="+ loc +";");
	str += ("if(loc==0){ window.location = \"../views/indexView.jsp\";}");
	str += ("else{ window.location = document.referrer;}");
	out.print(str);
%>

</script>
</body>
</html>