package dao;
import java.sql.*;
import java.util.Random;

import javax.naming.NamingException;
import util.*;
public class WritingDAO {
	
	// insert writing
	public boolean insert(String email, String content, int paperCode, String jarName) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try {
			String splitUid[] = email.split("@");
            email=splitUid[0];
			String sql = "INSERT INTO " + email + "WritingList(content, paperCode, jarName) VALUES(?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setInt(2, paperCode);
			stmt.setString(3, jarName);
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
	
		}
	}
	
	//
	public int randomNo(String email, String jarName) throws NamingException, SQLException {
		Connection conn=ConnectionPool.get();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		int maxNo=0;
		int ranNo=0;
    	try {
    		 String splitUid[] = email.split("@");
             email=splitUid[0];
             
    		 String sql = "CREATE VIEW jarview SELECT * FROM "+ email +"WritingList where jarName="+jarName;
		     stmt = conn.prepareStatement(sql);
             
		     rs = stmt.executeQuery();
             
		     // ���̺� Į�� �� ���� �߰�. ������ view ����
		     sql = "select count(*) from jarview";
		     rs = stmt.executeQuery(sql);
             
		     maxNo = rs.getInt("count");
		     
             Random random = new Random();
             ranNo = random.nextInt(maxNo+1);
             
             
             return ranNo;
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
	}
	
    // view content
    public boolean content(int ranNo) throws NamingException, SQLException{
    	Connection conn=ConnectionPool.get();
    	PreparedStatement stmt=null;
    	ResultSet rs=null;

    	try {
    		 String sql = "SELECT content, name, ts FROM jarView WHERE no = ?";
		     stmt = conn.prepareStatement(sql);
    		 stmt.setInt(1, ranNo);
             rs = stmt.executeQuery();
             return rs.next();
//             String content = rs.getString("content");
//             String name= rs.getString("name");
//             Date ts = rs.getDate("ts");
//                          
    	} finally {
    		    if(rs!=null) rs.close();
    		    if(stmt!=null) stmt.close();
    		    if(conn!=null) conn.close();
    	}
    }
    
    // delete content
    public boolean delete(int no) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM feed WHERE no = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, no);
            
            int count = stmt.executeUpdate();
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
            
        }
    }
}
