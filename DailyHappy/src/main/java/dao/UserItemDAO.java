package dao;

import java.sql.*;
import javax.naming.NamingException;

import util.ConnectionPool;

public class UserItemDAO {
	
	// insert writing
		public boolean insert(String email, int itemcode) throws NamingException, SQLException {
			Connection conn = ConnectionPool.get();
			Statement stmt = conn.createStatement();
			try {
				
				email = new UserDAO().splitemail(email);
	            
				String sql = "INSERT INTO " + email + "item(itemcode) VALUES("+itemcode+")";
				
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
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	email = new UserDAO().splitemail(email);
	        	
	            String sql = "DELETE email FROM "+ email + "Item WHERE itemcode = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, itemcode);
	            stmt.executeQuery(sql);
	            
	            int count = stmt.executeUpdate(sql);
				
				return (count == 1) ? true : false; 
	        } finally {
	            if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
		
		
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
		
		
		// delete jar table
	    public boolean deleteItemTable(String email) throws NamingException, SQLException {
	        Connection conn = ConnectionPool.get();
	        PreparedStatement stmt = null;
	        try {
	        	
	        	email = new UserDAO().splitemail(email);
	            String sql = "DROP TABLE " + email + "item";
	            stmt = conn.prepareStatement(sql);
	            int count = stmt.executeUpdate();
				
	            return (count > 0) ? true : false;
	        } finally {
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	            
	        }
	    }
	
}
