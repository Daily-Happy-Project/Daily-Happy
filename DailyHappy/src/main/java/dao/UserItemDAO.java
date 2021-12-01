package dao;

<<<<<<< HEAD
import java.sql.*;
import java.util.ArrayList;
=======
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
>>>>>>> main

import javax.naming.NamingException;

import util.ConnectionPool;

<<<<<<< HEAD
import util.UserItemObj;

import util.UserObj;

public class UserItemDAO {
	
// insert writing
	public boolean insert(String email, int itemCode, String itemType) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		Statement stmt = conn.createStatement();
		try {
			
			email = new UserDAO().splitemail(email);


			String sql = "INSERT INTO " + email + "Item(itemCode, itemType) VALUES(\"" + itemCode + "\",\"" + itemType + "\")";
			
			int count = stmt.executeUpdate(sql);
			return (count == 1) ? true : false;
			
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
			}
		}
	

	// item lookup. type byeol lo check (make new jar)
    public ArrayList<UserItemObj> getUserItemList(String email, String itemType) throws NamingException, SQLException {
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;
    	try {
    		email = new UserDAO().splitemail(email);
    		String sql = "SELECT a.itemcode, itemName, img1 ";
    		sql += "FROM "+ email + "Item a join item b on (a.itemCode = b.itemCode) "; 
    		sql += "where b.itemType = \""+ itemType + "\"";
    		stmt=conn.prepareStatement(sql);
    		rs=stmt.executeQuery();
    		
    		ArrayList<UserItemObj> uItems=new ArrayList<UserItemObj>();
    		while(rs.next()) {
    			uItems.add(new UserItemObj(rs.getInt("itemCode"), rs.getString("itemName"), rs.getString("img1")));
    		}
    		
    		return uItems;
    	} finally {
    		if(rs!=null) 
		    	rs.close();
		    if(stmt!=null) 
		    	stmt.close();
		    if(conn!=null) 
		    	conn.close();
    	}
    }


	
	// delete item
		public boolean delete(String email, int itemCode) throws NamingException, SQLException {
=======
public class UserItemDAO {
	
	// insert writing
		public boolean insert(String email, int itemcode) throws NamingException, SQLException {
			Connection conn = ConnectionPool.get();
			PreparedStatement stmt = null;
			try {
				
				email = new UserDAO().splitemail(email);
	            
				String sql = "INSERT INTO " + email + "item(itemcode) VALUES(?)";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, itemcode);
				stmt.executeUpdate();
				
				int count = stmt.executeUpdate(sql);
				return (count == 1) ? true : false;
			} finally {
				if (stmt != null) stmt.close(); 
				if (conn != null) conn.close();
		
			}
		}	
	
	
	// item lookup. type byeol lo check
		public boolean exists(String email, String itemtype) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        try {
	        	email = new UserDAO().splitemail(email);
	        	
	            String sql = "SELECT email FROM "+ email + "Item WHERE itemtype = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setString(1, itemtype);
	            rs = stmt.executeQuery();
	            return rs.next();
	        } finally {
	            if (rs != null) rs.close(); 
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
	
		
	
	// delete item
		public boolean delete(String email, int itemcode) throws NamingException, SQLException {
>>>>>>> main
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	email = new UserDAO().splitemail(email);
	        	
<<<<<<< HEAD
	            String sql = "DELETE email FROM "+ email + "Item WHERE itemCode = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, itemCode);
=======
	            String sql = "DELETE email FROM "+ email + "Item WHERE itemcode = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, itemcode);
>>>>>>> main
	            stmt.executeQuery(sql);
	            
	            int count = stmt.executeUpdate(sql);
				
				return (count == 1) ? true : false; 
	        } finally {
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
		
<<<<<<< HEAD

	
	// random Paper
		public ArrayList<UserItemObj> randomPaper(String email) throws NamingException, SQLException {
			Connection conn = ConnectionPool.get();
			PreparedStatement stmt = null;
			PreparedStatement stmt2 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			try {
				
				email = new UserDAO().splitemail(email);
				String sql = "SELECT itemCode FROM " + email + "Item WHERE itemType=\"paper\" Order by rand() limit 1";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				int itemCode = 0;
				while(rs.next()) { 
					itemCode=rs.getInt("itemCode"); 
					}
				
				
				sql = "SELECT img1, itemCode FROM item WHERE itemCode=\"" + itemCode +"\"";
				stmt2 = conn.prepareStatement(sql);
				rs2 = stmt.executeQuery(sql);
				ArrayList<UserItemObj> items = new ArrayList<UserItemObj>();
				while(rs2.next()) {
					items.add(new UserItemObj(rs2.getInt("itemCode"), rs2.getString("img1")));
				}
				return items;			

			} finally {
				if (rs2 != null) rs2.close();
				if (stmt2 != null) stmt2.close(); 
				if (rs != null) rs.close();
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
			}
		}
		
		
		
=======
		
	// random Paper
		public String randomPaper(String email) throws NamingException, SQLException {
			Connection conn = ConnectionPool.get();
			PreparedStatement stmt = null;
			try {
				email = new UserDAO().splitemail(email);
				String sql = "CREATE VIEW userpaper "
						+ "SELECT " + email + "item.itemcode, item.itemcode, item.img1"
						+ "FROM " + email + "item, item "
						+ "where "+ email+ "item.itemcode=item.itemcode "
						+ "and item.itemtype=\"paper\"";
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate();
				
				sql = "SELECT img1 FROM userpaper ORDER BY rand() LIMIT 1";
				stmt.executeUpdate(sql);
				
				return sql;			
				
			} finally {
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
			}
			
		}
		
		
>>>>>>> main
		// delete jar table
	    public boolean deleteItemTable(String email) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	
	        	email = new UserDAO().splitemail(email);
<<<<<<< HEAD
	            String sql = "DROP TABLE " + email + "Item";
=======
	            String sql = "DROP TABLE " + email + "item";
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
