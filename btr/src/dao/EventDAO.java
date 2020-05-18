package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.JdbcUtil;

public class EventDAO {
	

	private Connection getConnection() throws Exception{
	
//		Context init=new InitialContext();
//		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
//		Connection con=ds.getConnection();
//		return con;
		
		JdbcUtil jdbcUtil = new JdbcUtil();
		
		Connection con = jdbcUtil.getConnection();
		
		return con;
	}

	public String getDate(int num) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String date = null;
		try {
			
			con = getConnection();
			String sql = "SELECT e_edate FROM event WHERE e_num = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				date = rs.getString("e_edate");
				System.out.println(date);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return date;
	}
	public void setDate(String date, int num) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			con = getConnection();
			String sql = "UPDATE event SET e_sdate = now(), e_edate = ? WHERE e_num = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
	}
	public void setEndDate(int num) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			con = getConnection();
			String sql = "UPDATE event SET e_edate = now() WHERE e_num = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
	}
}
