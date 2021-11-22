package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;
import util.UserObj;

public class JarDAO {

	//new jar add
	public boolean insert(String email, String jarName, String foldmethodName, int cnt) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user(email, jarName, foldmethodName, cnt) VALUES(?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, jarName);
            stmt.setString(3, foldmethodName);
            stmt.setInt(4, cnt);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

	
	public ArrayList<UserObj> getJarList() throws NamingException, SQLException {
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	try {
    		String sql="SELECT jarName, goalnum, cnt FROM user ORDER BY name DESC";
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
	

	 // delete jar table
	    public boolean deleteJarTable(String email) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	
	        	email = new UserDAO().splitemail(email);
	            String sql = "DROP TABLE " + email + "jarlist";
	            stmt = conn.prepareStatement(sql);
	            int count = stmt.executeUpdate();
				
	            return (count > 0) ? true : false;
	        } finally {
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	            
	        }
	    }
	
}
