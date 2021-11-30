package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;
import util.WritingObj;


public class WritingDAO {
	
	// insert writing
	public boolean insert(String email, String content, int paperCode, String jarName) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
			String realEmail = email;
			email = new UserDAO().splitemail(email);
            
			String sql = "INSERT INTO " + email + "WritingList(content, paperCode, jarName) VALUES(?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setInt(2, paperCode);
			stmt.setString(3, jarName);
			stmt.executeUpdate();
			
			sql = "UPDATE " + email + "JarList set cnt=cnt+1 where jarName= \"" + jarName + "\"";
			stmt.executeUpdate(sql);
			
			sql = "UPDATE user set coin=coin+1 where email= \"" + realEmail + "\"";
			int count = stmt.executeUpdate(sql);
			
			return (count == 1) ? true : false;
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
	
		}
	}
	
	
	//
	public int writingNo(String email, String jarName) throws NamingException, SQLException {
		Connection conn=ConnectionPool.get();
		PreparedStatement stmt=null;
		ResultSet rs=null;
    	try {
    		 email = new UserDAO().splitemail(email);
             String sql = "select cnt from " + email + "Jarlist where jarName=\"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql);
             rs = stmt.executeQuery(sql);
             rs.next();
             int writingNo = rs.getInt("cnt");
             
             
             return writingNo;
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
	}
	
    
    // view content
    public ArrayList<WritingObj> content(String email, String jarName) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	try {
    		 email = new UserDAO().splitemail(email);
   		 
		     // select contents
    		 String sql = "SELECT no, content, paperCode, ts FROM " + email + "WritingList WHERE jarName=\""+ jarName+ "\" ORDER BY rand() limit 1";
    		 stmt = conn.prepareStatement(sql);
    		 rs = stmt.executeQuery();
    		 
    		 ArrayList<WritingObj> wObj=new ArrayList<WritingObj>();
    		 while(rs.next()) {
    			 wObj.add(new WritingObj(rs.getInt("no"), rs.getString("content"), rs.getInt("paperCode"), rs.getTimestamp("ts")));
    		 }
    		 
             return wObj;
    	} finally {
    			if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
    }
    
    
    // delete content
    public boolean delete(int no, String jarName, String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	
        	email = new UserDAO().splitemail(email);
            String sql = "DELETE FROM" + email + "WritingList WHERE no = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            stmt.executeUpdate();
			
			sql = "UPDATE " + email + "JarList set cnt=cnt-1 where jarName= \"" + jarName + "\"";
            
            int count = stmt.executeUpdate(sql);
            
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
 // delete writing table
    public boolean deleteWritingTable(String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	
        	email = new UserDAO().splitemail(email);
            String sql = "DROP TABLE " + email + "WritingList";
            stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate();
			
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
    
}
