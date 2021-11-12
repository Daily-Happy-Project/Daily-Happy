package dao;
import java.sql.*;
import java.util.Random;

import javax.naming.NamingException;
import util.*;
public class WritingDAO {
	public boolean insert(String content, String paperName) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO feed(content, paperName) VALUES(?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setString(2, paperName);
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
	
		}
	}
	
	
	public int randomNo(String email, String jarName) throws NamingException, SQLException {
		Connection conn=ConnectionPool.get();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		int maxNo=0;
		int ranNo=0;
    	try {
    		 String sql = "SELECT cnt FROM savedJar WHERE email = ? AND jarName = ?";
		     stmt = conn.prepareStatement(sql);
		     
    		 stmt.setString(1, email);
    		 stmt.setString(2, jarName);
             
             rs = stmt.executeQuery();
             maxNo = rs.getInt("cnt"); 
             
             Random random = new Random();
             ranNo = random.nextInt(maxNo+1);
             
             return ranNo;
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
	}
	
    
    public void content(int ranNo) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	String content;
    	String name;
    	Date ts;
    	try {
    		 String sql = "SELECT content, name, ts FROM feed WHERE no = ?";
		     stmt = conn.prepareStatement(sql);
		    
    		 stmt.setInt(1, ranNo);
             
             rs = stmt.executeQuery();
             
             content = rs.getString("content");
             name= rs.getString("name");
             ts = rs.getDate("ts");
             
             
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
    }
    
    
    public boolean delete(int no) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM feed WHERE no = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            
            int count = stmt.executeUpdate();
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
}

