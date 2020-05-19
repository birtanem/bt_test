package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.EventWinBean;

import static db.JdbcUtil.*;

public class EventDAO {
	

	private EventDAO() {}
	
	private static EventDAO instance;

	public static EventDAO getInstance() {
		// BoardDAO 객체가 없을 경우에만 생성
		if(instance == null) {
			instance = new EventDAO();
		}	
		return instance;
	}

	Connection con; // Connection 객체 전달받아 저장할 변수 선언
	
	// Service 클래스로부터 Connection 객체를 전달받는 메서드 setConnection() 정의
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public String getDate(int num) { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String date = null;
		try {
			
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
			close(rs);
			close(pstmt);
		}
		
		return date;
	}
	public void setDate(String date, int num) { 
		PreparedStatement pstmt = null;
			
		try {
			String sql = "UPDATE event SET e_sdate = now(), e_edate = ? WHERE e_num = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	}
	public void setEndDate(int num) { 

		PreparedStatement pstmt = null;
				
		try {

			String sql = "UPDATE event SET e_edate = now() WHERE e_num = ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	}
	public EventWinBean selectArticle(String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventWinBean article = null;
			
		try {
			String sql = "SELECT * FROM event_win WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				article = new EventWinBean();
				article.setEw_30000(rs.getInt("ew_30000"));
				article.setEw_50000(rs.getInt("ew_50000"));
				article.setEw_100000(rs.getInt("ew_100000"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("EventDAO - selectArticle() 실패! : "+e.getMessage());
		}	
		return article;
	}
}
