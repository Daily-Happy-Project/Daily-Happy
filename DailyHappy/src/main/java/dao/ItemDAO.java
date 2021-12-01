package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ItemDAO {
	
	// insert paper, theme, foldmethod
	public boolean insert(String itemName, String itemType, int price, String info, String img1) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO item(itemName, itemType, price, info, img1) "
            		+ "VALUES(?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setString(2, itemType);
            stmt.setInt(3, price);
            stmt.setString(4,  info);
            stmt.setString(5, img1);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
	
	
	// insert jar
	public boolean insert(String itemName, String itemType, int price, String info, String img1, String img2, String img3, String img4) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO item(itemName, itemType, price, info, img1, img2, img3, img4) "
            		+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setString(2, itemType);
            stmt.setInt(3, price);
            stmt.setString(4,  info);
            stmt.setString(5, img1);
            stmt.setString(6, img2);
            stmt.setString(7, img3);
            stmt.setString(8, img4);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
	
	
	// lookup item
	public boolean exists(int itemType) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT itemCode FROM item WHERE itemType = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, itemType);
            rs = stmt.executeQuery();
            return rs.next();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
	
	
	// delete item
	public boolean delete(int itemCode) throws NamingException, SQLException {
        Connection conn = ConnectionPool.get();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "DELETE FROM item WHERE itemcode = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, itemCode);
            rs = stmt.executeQuery();
            return rs.next();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
	
	
}
