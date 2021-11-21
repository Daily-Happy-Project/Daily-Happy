package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.naming.NamingException;

import util.ConnectionPool;
public class WritingDAO {
	
	// insert writing
	public boolean insert(String email, String content, int paperCode, String jarName) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
			
			email = new UserDAO().splitemail(email);
            
			String sql = "INSERT INTO " + email + "WritingList(content, paperCode, jarName) VALUES(?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setInt(2, paperCode);
			stmt.setString(3, jarName);
			stmt.executeUpdate();
			
			sql = "UPDATE " + email + "jarlist set cnt=cnt+1 where jarName= \"" + jarName + "\"";
			
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
             String sql = "select cnt from " + email + "jarlist where jarName=\"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql);
             int writingNo = stmt.executeUpdate(sql);
             
             return writingNo;
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
	}
	
    // view content
    public boolean content(String email, String jarName) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	int ranNo=0;

    	try {
    		
    	     ranNo = new WritingDAO().writingNo(email, jarName);
		     ranNo = new Random().nextInt(ranNo+1);
   		 
		     // create view
    		 String sql = "CREATE VIEW jarview SELECT * FROM "+ email +"WritingList where jarName= \"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql); 
		     stmt.executeQuery();
		     
		     // select contents
    		 sql = "SELECT content, name, ts FROM jarView WHERE no = ?";
		     stmt.executeQuery(sql);
		     stmt.setInt(1, ranNo);
             rs = stmt.executeQuery();
             
             // delete view
             stmt.executeQuery("DELETE VIEW jarview ");
             
             return rs.next();
    	} finally {
    		    if(rs!=null) rs.close();
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
            String sql = "DELETE FROM" + email + "writinglist WHERE no = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            stmt.executeUpdate();
			
			sql = "UPDATE " + email + "jarlist set cnt=cnt-1 where jarName= \"" + jarName + "\"";
            
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
            String sql = "DROP TABLE " + email + "writinglist";
            stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate();
			
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
    
}
