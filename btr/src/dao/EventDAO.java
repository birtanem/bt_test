package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EventDAO {
	

	private Connection getConnection() throws Exception{
	
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public Timestamp getDate(int idx) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp date = null;
		try {
			
			con = getConnection();
			String sql = "SELECT * FROM event WHERE idx = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				date = rs.getTimestamp("date");
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
	public void setDate(Timestamp date, int idx) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			con = getConnection();
			String sql = "UPDATE event SET date = ? WHERE idx = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setTimestamp(1, date);
			pstmt.setInt(2, idx);
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
}
