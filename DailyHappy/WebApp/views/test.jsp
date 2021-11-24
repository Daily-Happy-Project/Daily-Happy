<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트용 페이지</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

out.print(request.getParameter("Jname")+"<br>");
out.print(request.getParameter("Jshape"));
%>
</body>
</html>