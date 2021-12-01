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
	String email=(String)session.getAttribute("email");
	String jarList[] = request.getParameterValues("delJar");
	
	int loc = 0;
	if (jarList.length > 1){
		loc = 1;
	}
	JarDAO dao = new JarDAO();
	
	
	for(String jar : jarList){
		dao.delete(email, jar);
	}
%>

<%
	String str = ("<script type=\"text/javascript\">");
	str += ("alert(\"유리병 삭제가 완료되었습니다.\");");
	str += ("var loc ="+ loc +";");
	str += ("if(loc==0){ window.location = \"../views/myJarView.jsp\";}");
	str += ("else{ window.location = document.referrer;}");
	out.print(str);
%>

</script>
</body>
</html>