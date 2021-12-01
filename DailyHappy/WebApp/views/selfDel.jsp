<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="util.*"%>
<%@ page import="dao.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String uemail = (String)session.getAttribute("email");
	if (uemail == null) {
		response.sendRedirect("loginView.jsp");
		//test string: 
		//uemail = "d@d";
	}
	session.setAttribute("email", uemail);
	ArrayList<UserObj> list = (new UserDAO()).myInfo(uemail);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>계정 삭제</title>
<style type="text/css">
	#del-wrap{
		position: fixed;
		bottom: 50%;
		display: flex;
		width: 100%;
		

	}
	#del{

		width: 100%;
		margin: auto;
		
	}
</style>
</head>
<body>
<div id="del-wrap" align="center">
<div id="del">
정말로 계정을 삭제하시겠습니까?<br>
한 번 삭제된 계정은 복구할 수 없습니다.<br><br>
<form method="get" id="delform" action="../jsp/userDel.jsp">
	<% out.print("<input type=\"text\" name=\"delUser\" value=\""+ uemail +"\" readonly>"); %><br><br>
	<input type="button" onclick="{window.location = document.referrer;}"value="취소"/>
	<input type="submit"  value="삭제"/>
</form>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#delform").submit(function(){
			//alert("테스트용 알림");
			session.invalidate();
		})
	})

</script>
</body>
</html>