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
	public boolean insert(String email, String jarName, String Jshape, String Fshape, int goalNum, String jarImgName) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	email = new UserDAO().splitemail(email);
            String sql = "INSERT INTO " + email +"JarList(jarName, jarItemName, foldMethodName, goalNum, jarImgName) VALUES(?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, jarName);
            stmt.setString(2, Jshape);
            stmt.setString(3, Fshape);
            stmt.setInt(4, goalNum);
            stmt.setString(5, jarImgName);
            
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
    		String sql="SELECT jarName, jarItemName, foldMethodName, jarImgName, goalNum, cnt FROM " + email + "JarList";
    		stmt=conn.prepareStatement(sql);
    		rs=stmt.executeQuery();
    		
    		ArrayList<JarObj> jars=new ArrayList<JarObj>();
    		while(rs.next()) {
    			jars.add(new JarObj(rs.getString("jarName"), rs.getString("jarImgName"), rs.getInt("cnt"), rs.getInt("goalNum"), rs.getString("jarItemName"), rs.getString("foldMethodName")));
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
    
    
    // main jar Img
    public String mainJarImg(String jarImgName, int goalNum, int cnt) throws NamingException, SQLException {
    	Connection conn = ConnectionPool.get();
    	PreparedStatement stmt = null;
    	ResultSet rs = null;
    	try {
    		String sql = "";
    		String img = "";
    		
    		if (cnt==0) {
    			sql = "SELECT img1 FROM jarImg WHERE imgName=\"" + jarImgName + "\"";
    			stmt = conn.prepareStatement(sql);
    			rs = stmt.executeQuery(sql);
        		rs.next();
        		img = rs.getString("img1");
        	}
			else if((cnt>0) && (cnt<=goalNum*0.333))  {
    			sql = "SELECT img2 FROM jarImg WHERE imgName=\"" + jarImgName + "\"";
    			stmt = conn.prepareStatement(sql);
    			rs = stmt.executeQuery(sql);
        		rs.next();
        		img = rs.getString("img2");
    		}
		    else if((cnt>(goalNum*(0.333))) && (cnt<=(goalNum*0.666))) { 
			    sql = "SELECT img3 FROM jarImg WHERE imgName=\"" + jarImgName + "\"";
			    stmt = conn.prepareStatement(sql);
			    rs = stmt.executeQuery(sql);
			    rs.next();
			    img = rs.getString("img3"); 
			} 
		    else if (cnt>(goalNum*0.666)) { 
		    	sql = "SELECT img4 FROM jarImg WHERE imgName=\"" + jarImgName + "\"";
		    	stmt = conn.prepareStatement(sql);
		    	rs = stmt.executeQuery(sql);
		    	rs.next(); 
		    	img = rs.getString("img4"); 
			}
			 
    		return img;    		
    	} finally {
    		if (rs != null) rs.close();
    		if (stmt != null) stmt.close();
            if (conn != null) conn.close();
		}
    }
    
    
}