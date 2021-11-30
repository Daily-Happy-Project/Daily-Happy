package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

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
    		sql += "where itemType = \""+ itemType + "\"";
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
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	email = new UserDAO().splitemail(email);
	        	
	            String sql = "DELETE email FROM "+ email + "Item WHERE itemCode = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, itemCode);
	            stmt.executeQuery(sql);
	            
	            int count = stmt.executeUpdate(sql);
				
				return (count == 1) ? true : false; 
	        } finally {
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
		
		
		
	// random Paper
	/*
	 * public String randomPaper(String email) throws NamingException, SQLException
	 * { Connection conn = ConnectionPool.get(); PreparedStatement stmt = null; try
	 * { email = new UserDAO().splitemail(email); String sql =
	 * "CREATE VIEW userpaper " + "SELECT " + email +
	 * "Item.itemCode, item.itemCode, item.img1" + "FROM " + email + "Item, item " +
	 * "where "+ email+ "Item.itemCode=item.itemCode " +
	 * "and item.itemType=\"paper\""; stmt = conn.prepareStatement(sql);
	 * stmt.executeUpdate();
	 * 
	 * sql = "SELECT img1, FROM userpaper ORDER BY rand() LIMIT 1";
	 * stmt.executeUpdate(sql);
	 * 
	 * return sql;
	 * 
	 * } finally { if (stmt != null) stmt.close(); if (conn != null) conn.close(); }
	 * 
	 * }
	 */
		
		
	// random Paper
	public ArrayList<UserItemObj> randomPaper(String email) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			email = new UserDAO().splitemail(email);
			String sql = "SELECT img1, itemCode FROM " + email + "item WHERE itemType=\"paper\"";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
//			String img = rs.getString("img1");
//			int itemCode = rs.getInt("itemCode");
			ArrayList<UserItemObj> items = new ArrayList<UserItemObj>();
			while(rs.next()) {
				items.add(new UserItemObj(rs.getInt("itemCode"), rs.getString("img1")));
			}
			
			
			return items;			
			
		} finally {
			if (rs != null) rs.close();
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
		
	}
		
		
		// delete jar table
	    public boolean deleteItemTable(String email) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	
	        	email = new UserDAO().splitemail(email);
	            String sql = "DROP TABLE " + email + "Item";
	            stmt = conn.prepareStatement(sql);
	            int count = stmt.executeUpdate();
				
	            return (count > 0) ? true : false;
	        } finally {
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	            
	        }
	    }
	
}
