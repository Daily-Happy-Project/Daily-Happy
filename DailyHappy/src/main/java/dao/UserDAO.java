package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;
import util.UserObj;

public class UserDAO {
	public boolean insert(String email, String name, String pw) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user(email, name, pw) VALUES(?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, name);
            stmt.setString(3, pw);
            
            int count = stmt.executeUpdate();           
            
            String splitUid[] = email.split("@");
            email=splitUid[0];
            
            stmt.execute("CREATE TABLE IF NOT EXISTS " + email + "JarList("
            		+ "jarName VARCHAR(32) PRIMARY KEY, "
            		+ "foldMethodName VARCHAR(32), "
            		+ "cnt int UNSIGNED DEFAULT 0, "
            		+ "goalNum int UNSIGNED DEFAULT 0)");
            
            stmt.execute("CREATE TABLE IF NOT EXISTS " + email + "WritingList("
            		+ "no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, "
            		+ "jarName VARCHAR(32), "
            		+ "content VARCHAR(8192), "
            		+ "paperCode int, "
            		+ "ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "
            		+ "FOREIGN KEY (jarName) REFERENCES " + email + "JarList (jarName))");
            
            stmt.execute("CREATE TABLE IF NOT EXISTS " + email + "Item("
//            		+ "email VARCHAR(128) PRIMARY KEY, "
            		+ "itemCode int UNSIGNED PRIMARY KEY, "
            		+ "apply tinyint(1) DEFAULT 0,"
            		+ "FOREIGN KEY (itemCode) REFERENCES item (itemCode))");
          
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean exists(String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT email FROM user WHERE name = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            return rs.next();
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean delete(String email) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM user WHERE email = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            
            int count = stmt.executeUpdate();
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
    public int login(String email, String pw) throws NamingException, SQLException {
    	Connection conn = null;
    	PreparedStatement stmt = null;
    	ResultSet rs = null;
	    try {
	    	String sql = "SELECT email, pw FROM user WHERE email = ?";
	    
		    conn = ConnectionPool.get();
		    stmt = conn.prepareStatement(sql);
		    stmt.setString(1, email);
		    
		    rs = stmt.executeQuery();
		    if (!rs.next())
		    	return 1;
		    if (!pw.equals(rs.getString("pw")))
		    	return 2; 
		    
		    return 0;
	    } finally {
		    if(rs!=null) 
		    	rs.close();
		    if(stmt!=null) 
		    	stmt.close();
		    if(conn!=null) 
		    	conn.close();
		}
}
	    
    
    //my info 
    public ArrayList<UserObj> myInfo(String email) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs = null;
    	try {
    		 String sql = "SELECT name, email, coin FROM user WHERE email = ?";
		     stmt = conn.prepareStatement(sql);
    		 stmt.setString(1, email);
    		 rs=stmt.executeQuery();
    		 ArrayList<UserObj> users=new ArrayList<UserObj>();
     		while(rs.next()) {
     			users.add(new UserObj(rs.getString("email"), rs.getString("name"), rs.getInt("coin")));
     		}
     		
     		return users;
             
    	} finally {
    			if(rs!=null) 
		    	rs.close();
    		    if(stmt!=null) 
    		    	stmt.close();
    		    if(conn!=null) 
    		    	conn.close();
    	}
    }
    
    //user list
    public ArrayList<UserObj> getUserList() throws NamingException, SQLException {
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	try {
    		String sql="SELECT email, name, coin, memberType FROM user ORDER BY name DESC";
    		stmt=conn.prepareStatement(sql);
    		rs=stmt.executeQuery();
    		
    		ArrayList<UserObj> users=new ArrayList<UserObj>();
    		while(rs.next()) {
    			users.add(new UserObj(rs.getString("email"), rs.getString("name"), rs.getInt("coin"), rs.getString("memberType")));
    		}
    		
    		return users;
    	} finally {
    		if(rs!=null) 
		    	rs.close();
		    if(stmt!=null) 
		    	stmt.close();
		    if(conn!=null) 
		    	conn.close();
    	}
    }
    
    
    public String splitemail(String email) {
    	String splitUid[] = email.split("@");
        email=splitUid[0];
        
        return email;
    }
    

    public ResultSet memberType(String email) throws NamingException, SQLException{
    	Connection conn = ConnectionPool.get();
    	PreparedStatement stmt = null;
    	ResultSet rs = null;
    	try {
    		email = new UserDAO().splitemail(email);
    		String sql = "SELECT memberType FROM user WHERE=\"" + email + "\"";
    		stmt = conn.prepareStatement(sql);
    		rs = stmt.executeQuery();
    		
    		return rs;
    	} finally {
			
		}
    }

    
    
}
