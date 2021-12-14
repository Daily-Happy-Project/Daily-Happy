package dao;

import java.sql.*;
import java.text.ParseException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class FriendDAO {
	public String insert(String uemail, String fremail) throws NamingException, SQLException, ParseException { 
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
				String sql = "SELECT uemail FROM friend WHERE uemail = ? AND fremail = ?"; 
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uemail);
				stmt.setString(2, fremail);
				rs = stmt.executeQuery();
				if (rs.next()) 
					return "EX";
				stmt.close();
				sql = "INSERT INTO friend VALUES(?, ?)"; 
				stmt = conn.prepareStatement(sql); 
				stmt.setString(1, uemail);
				stmt.setString(2, fremail);
				int count = stmt.executeUpdate();
				
				return (count == 1) ? "OK" : "ER"; 
			} finally {
				if (stmt != null) stmt.close(); 
	            if (conn != null) conn.close();
	        }
	    }
	
	public String remove(String uemail, String fremail) throws NamingException, SQLException, ParseException { 
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
				String sql = "DELETE FROM friend WHERE uemail = ? AND fremail = ?"; 
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uemail);
				stmt.setString(2, fremail);
				int count = stmt.executeUpdate();
			
				return (count == 1) ? "OK" : "ER"; 
			} finally {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close(); 
				}
		}
	
	public String getList(String uemail) throws NamingException, SQLException, ParseException { 
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
				String sql = "SELECT fremail FROM friend WHERE uemail = ?"; 
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, uemail);
				rs = stmt.executeQuery();
				
				String str = ""; 
				int cnt = 0; 
				
				while(rs.next()) {
					if (cnt++ > 0) 
						str += ",";
					str += "\"" + rs.getString("fremail") + "\""; 
				}
				if (cnt == 0) 
					return "[]"; 
				
				rs.close(); 
				stmt.close();
				
				sql = "SELECT jsonstr FROM user WHERE email IN (" + str + ")"; 
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				str = "["; 
				cnt = 0; 
				
				while(rs.next()) {
					if (cnt++ > 0) 
						str += ",";
					str += rs.getString("jsonstr"); }
					str += "]";
					
					return str; 
				} finally {
					if (rs != null) 
						rs.close();
					if (stmt != null) 
						stmt.close(); 
					if (conn != null) 
						conn.close();
			} 
		}
	
	 // delete jar table
    public boolean deleteFriendTable(String email) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
        	email = new UserDAO().splitemail(email);
            String sql = "DROP TABLE " + email + "FriendList";
            stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate();
			
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }

}
