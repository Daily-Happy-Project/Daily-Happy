package util;

import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

public class ConnectionPool {
	private static DataSource _ds = null;
	public static Connection get() throws NamingException, SQLException {
	if (_ds == null) {
	_ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/daily_happy");
	}
	return _ds.getConnection(); }
}
