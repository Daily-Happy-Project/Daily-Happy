package dao;
<<<<<<< HEAD

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;
import util.WritingObj;


=======
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.naming.NamingException;

import util.ConnectionPool;
>>>>>>> main
public class WritingDAO {
	
	// insert writing
	public boolean insert(String email, String content, int paperCode, String jarName) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
<<<<<<< HEAD
			String realEmail = email;
=======
			
>>>>>>> main
			email = new UserDAO().splitemail(email);
            
			String sql = "INSERT INTO " + email + "WritingList(content, paperCode, jarName) VALUES(?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setInt(2, paperCode);
			stmt.setString(3, jarName);
			stmt.executeUpdate();
			
<<<<<<< HEAD
			sql = "UPDATE " + email + "JarList set cnt=cnt+1 where jarName= \"" + jarName + "\"";
			stmt.executeUpdate(sql);
			
			sql = "UPDATE user set coin=coin+1 where email= \"" + realEmail + "\"";
=======
			sql = "UPDATE " + email + "jarlist set cnt=cnt+1, coin=coin+1 where jarName= \"" + jarName + "\"";
			
>>>>>>> main
			int count = stmt.executeUpdate(sql);
			
			return (count == 1) ? true : false;
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
	
		}
	}
	
<<<<<<< HEAD
	
=======
>>>>>>> main
	//
	public int writingNo(String email, String jarName) throws NamingException, SQLException {
		Connection conn=ConnectionPool.get();
		PreparedStatement stmt=null;
		ResultSet rs=null;
    	try {
    		 email = new UserDAO().splitemail(email);
<<<<<<< HEAD
             String sql = "select cnt from " + email + "Jarlist where jarName=\"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql);
             rs = stmt.executeQuery(sql);
             rs.next();
             int writingNo = rs.getInt("cnt");
             
=======
             String sql = "select cnt from " + email + "jarlist where jarName=\"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql);
             int writingNo = stmt.executeUpdate(sql);
>>>>>>> main
             
             return writingNo;
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
	}
	
<<<<<<< HEAD
    
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
=======
    // view content
    public ResultSet content(String email, String jarName) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();

    	try {
        	 PreparedStatement stmt=null;
        	 ResultSet rs=null;
        	 int ranNo=0;
        	
    	     ranNo = new WritingDAO().writingNo(email, jarName);
		     ranNo = new Random().nextInt(ranNo+1);
		     System.out.println(ranNo);
		     
		     email = new UserDAO().splitemail(email);
   		 
		     // create view
    		 String sql = "CREATE VIEW " + email + "jarview SELECT * FROM "+ email +"WritingList where jarName= \"" + jarName + "\"";
		     stmt = conn.prepareStatement(sql); 
		     stmt.executeUpdate();
		     
		     // select contents
    		 sql = "SELECT content, name, ts FROM jarView order by rand() limit 1";
             
             return stmt.executeQuery(sql);
             
    	} finally {
    			if(rs!=null) rs.close();
>>>>>>> main
    			if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
    }
    
    
<<<<<<< HEAD
=======
    public boolean deletejarView(String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	
        	email = new UserDAO().splitemail(email);
            String sql = "DROP TABLE " + email + "jarView ";
            
            stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
			
            int count = stmt.executeUpdate(sql);
            
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
>>>>>>> main
    // delete content
    public boolean delete(int no, String jarName, String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	
        	email = new UserDAO().splitemail(email);
<<<<<<< HEAD
            String sql = "DELETE FROM " + email + "WritingList WHERE no=?";
=======
            String sql = "DELETE FROM" + email + "writinglist WHERE no = ?";
>>>>>>> main
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            stmt.executeUpdate();
			
<<<<<<< HEAD
			sql = "UPDATE " + email + "JarList set cnt=cnt-1 where jarName= \"" + jarName + "\"";
=======
			sql = "UPDATE " + email + "jarlist set cnt=cnt-1 where jarName= \"" + jarName + "\"";
>>>>>>> main
            
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
<<<<<<< HEAD
            String sql = "DROP TABLE " + email + "WritingList";
=======
            String sql = "DROP TABLE " + email + "writinglist";
>>>>>>> main
            stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate();
			
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
    
    
}
