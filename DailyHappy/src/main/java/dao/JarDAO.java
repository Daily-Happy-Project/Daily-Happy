package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;
import util.JarObj;

public class JarDAO {

	//add new jar
	public boolean insert(String email, String jarName, int jarCode, String foldMethodName, int goalNum) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	email = new UserDAO().splitemail(email);
            String sql = "INSERT INTO " + email +"JarList(jarName, jarItemCode, foldMethodName, goalNum) VALUES(?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, jarName);
            stmt.setInt(2, jarCode);
            stmt.setString(3, foldMethodName);
            stmt.setInt(4, goalNum);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

	
	//jar list
    public ArrayList<JarObj> getJarList(String email) throws NamingException, SQLException {
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	try {
    		email = new UserDAO().splitemail(email); 
    		String sql="SELECT jarName, goalNum, cnt FROM " + email + "JarList";
    		stmt=conn.prepareStatement(sql);
    		rs=stmt.executeQuery();
    		
    		ArrayList<JarObj> jars=new ArrayList<JarObj>();
    		while(rs.next()) {
    			jars.add(new JarObj(rs.getString("jarName"), rs.getInt("goalNum"), rs.getInt("cnt")));
    		}
    		
    		return jars;
    	} finally {
    		if(rs!=null) 
		    	rs.close();
		    if(stmt!=null) 
		    	stmt.close();
		    if(conn!=null) 
		    	conn.close();
    	}
    }
	
	//delete jar
		public boolean delete(String email, String jarName) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	email = new UserDAO().splitemail(email);
	            String sql = "DELETE FROM " + email + "JarList where jarName=\"" + jarName + "\"";
	            stmt = conn.prepareStatement(sql);
	            int count = stmt.executeUpdate();
	            
	            return (count == 1) ? true : false;
	            
	        } finally {
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
	
	

	 // delete jar table
	    public boolean deleteJarTable(String email) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	
	        	email = new UserDAO().splitemail(email);
	            String sql = "DROP TABLE " + email + "JarList";
	            stmt = conn.prepareStatement(sql);
	            int count = stmt.executeUpdate();
				
	            return (count > 0) ? true : false;
	        } finally {
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	            
	        }
	    }
	
}
