<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%

	request.setCharacterEncoding("utf-8");
		
	String uid = request.getParameter("id");
	String upass = request.getParameter("pw");
	String uname = request.getParameter("username");
	
	String sql = "INSERT INTO user(email, pw, name) VALUES(?, ?, ?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/daily_happy", "root", "1111");
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	stmt.setString(2, upass);
	stmt.setString(3, uname);
	stmt.executeUpdate();
	

	stmt.executeUpdate("CREATE TABLE IF NOT EXIST " + uid + 
			"JarList(jarName VARCHAR(32) PRIMARY KEY, foldmethodName VARCHAR(32), cnt int UNSIGNED AUTO_INCREMENT)");
	
	stmt.executeUpdate("CREATE TABLE IF NOT EXIST " + uid + 
			"WritingList(no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, name VARCHAR(32), content VARCHAR(8192), paperCode int, ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (jarName) REFERENCES" + uid + "JarList(jarName))");
	
	out.print("회원가입이 완료되었습니다 ^^");
%>