<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.JarDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uemail = request.getParameter("email");
	String jarName=request.getParameter("jarName");
	String foldmethodName=request.getParameter("foldmethodName");
	int cnt=Integer.parseInt(request.getParameter("cnt"));
	
	String sql="INSERT INTO savedJar(email, jarName, foldmethodName, cnt) VALUES(?, ?, ?, ?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/daily_happy", "root", "root");
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, uemail);
	stmt.setString(2, jarName);
	stmt.setString(3, foldmethodName);
	stmt.setInt(4, cnt);
	stmt.executeUpdate();
	
	out.print("새 유리병 추가가 완료되었습니다.");
%>
	