package event_dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import event_vo.EventWinBean;

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

	public int checkDate() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkDate = 1;
		
		String sql = "SELECT e_num FROM event WHERE e_edate > now()";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checkDate = 0;
			}
			
		} catch (SQLException e) { 
			e.printStackTrace();
			System.out.println("EventDAO - checkDate() 실패! : "+ e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return checkDate;
	}
	public int setStartDate(String date) { 
		PreparedStatement pstmt = null;
		int setDateCount = 0;
		System.out.println(date);
		int checkDate = checkDate();
		
		if(checkDate == 1) {
			
			try {
				String sql = "INSERT INTO event VALUES(null, now(), ?)";
				pstmt  = con.prepareStatement(sql);
				pstmt.setString(1, date);
				setDateCount = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("EventDAO - setStartDate() 실패! : "+e.getMessage());
			}finally {
				close(pstmt);
			}
			
		}
		return setDateCount;
	}
	public int setEndDate() { 

		PreparedStatement pstmt = null;
		int setDate = 0;
		try {

			String sql = "UPDATE event SET e_edate = now() WHERE e_num = (SELECT MAX(e_num) FROM (SELECT e_num FROM event) as a)";
			pstmt  = con.prepareStatement(sql);
			setDate = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EventDAO - setEndDate() 실패! : "+e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return setDate;
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

	public Date selectDate() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Date date = null;
		
		String sql = "SELECT e_edate FROM event WHERE e_num = (SELECT MAX(e_num) FROM event) ";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				date = rs.getDate("e_edate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("EventDAO - selectDate() 실패! : "+e.getMessage());
		}
		
		return date;
	}
}
