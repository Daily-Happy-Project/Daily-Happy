<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%

	request.setCharacterEncoding("utf-8");
		
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/daily_happy", "root", "1111");
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	stmt.setString(2, upass);
	stmt.setString(3, uname);
	int count = stmt.executeUpdate();
	

	stmt.executeUpdate("CREATE TABLE IT NOT EXIST " + uid + 
			"JarList(email VARCHAR(128) PRIMARY KEY, jarName VARCHAR(32), foldmethodName VARCHAR(32), cnt int UNSIGNED AUTO_INCREMENT)");
	
	stmt.executeUpdate("CREATE TABLE IT NOT EXIST " + uid + 
			"WritingList(email VARCHAR(128) PRIMARY KEY, name VARCHAR(32), content VARCHAR(8192), paperName)");
	
%>