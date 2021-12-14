<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%-- <%
	String userID=null;
	if(session.getAttribute("userID")!=null) {
		userID=(String) session.getAttribute("userID");
	}

/* 	int no = Integer.parseInt(request.getParameter("no")); */
	int no = (Integer)session.getAttribute("no");
	String email = (String)session.getAttribute("email");
	String jarName = request.getParameter("jarName");
	
	
	new WritingDAO().delete(no, jarName, email);

%> --%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>	
	<%
		
		int no = Integer.parseInt(request.getParameter("no"));
	 	String jarName = request.getParameter("jarName");
		String email = (String)session.getAttribute("email");
		
		
		WritingDAO dao = new WritingDAO();
		dao.delete(no, jarName, email);
	%>
	<%
		
/* 		if ((dao.delete(no, jarName, email))==true){ */
	
			String str = ("<script type=\"text/javascript\">");
			str += ("alert(\"글 삭제가 완료되었습니다.\");");
			str += ("window.location = \"../views/mainView.jsp\"");
			out.print(str);
			
			
		/* }
		else {
			out.print("글 삭제 중 오류가 발생하였습니다.<br>");
			out.print("<a href=\"../views/mainView.jsp\"메인화면으로 돌아가기</a>");
		} */
		
	%>
</script>
</body>
</html>