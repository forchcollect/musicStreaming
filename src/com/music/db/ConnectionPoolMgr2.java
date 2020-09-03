package com.music.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolMgr2 {
	private DataSource ds;
	
	public ConnectionPoolMgr2() {
		try {	
			Context ctx = new InitialContext();
			ds=(DataSource) ctx.lookup("java:/comp/env/jdbc/oracledb2");
			System.out.println("DataSource ������!");
		}catch (NamingException e) {
			System.out.println("DataSource ���� ����!");
			e.printStackTrace();
		}
	}
	
	public ConnectionPoolMgr2(String name) {
		try {	
			Context ctx = new InitialContext();
			ds=(DataSource) ctx.lookup("java:/comp/env/"+name);
			System.out.println("DataSource ������!");
		}catch (NamingException e) {
			System.out.println("DataSource ���� ����!");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException {
		Connection con=ds.getConnection();
		System.out.println("db���� ���� con="+con);
		
		return con;
	}
	
	public void dbClose(Connection con, PreparedStatement ps) throws SQLException {
		if(con!=null) con.close();
		if(ps!=null) ps.close();
	}
	
	public void dbClose(Connection con, PreparedStatement ps, ResultSet rs) throws SQLException {
		if(con!=null) con.close();
		if(ps!=null) ps.close();
		if(rs!=null) rs.close();
		
	}
	
}
