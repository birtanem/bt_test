package event.dao;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import event.vo.EventBean;
import event.vo.EventWinBean;

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
				
				String sql = "UPDATE event_box SET eb_pull = 0";
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
				
				
				sql = "INSERT INTO event VALUES(null, now(), ?)";
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

	public Timestamp selectDate() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp date = null;
		
		String sql = "SELECT e_edate FROM event WHERE e_num = (SELECT MAX(e_num) FROM event) ";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				date = rs.getTimestamp("e_edate");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("EventDAO - selectDate() 실패! : "+e.getMessage());
		}
	
		
		return date;
	}
	
	public int setPull() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		int checkNum = 0;
		int checkPull = 0;
		try {
			
			String sql = "SELECT * FROM event_box WHERE eb_rank > 0 AND eb_pull = 0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				sql = "SELECT * FROM event_box WHERE eb_pull = 0 ORDER BY rand() LIMIT 1";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
							
				if(rs.next()) {
					
					num = rs.getInt("eb_num");
					
					if(num==3 || num==6 || num==9) {
						checkNum = 1; // 당첨	
					}else {
						checkNum = 2; // 꽝	
					}
					
				}else {
					
					checkNum = -1;
				}
				
				sql = "UPDATE event_box SET eb_pull = 1 WHERE eb_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				checkPull = pstmt.executeUpdate() + checkNum;				
			}
								
			System.out.println(checkPull);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("EventDAO - setPull() 실패! : "+e.getMessage());
		}
		
	
		return checkPull;
	}

	public ArrayList<EventWinBean> getWinArticle() {
		
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		ArrayList<EventWinBean> articleList = new ArrayList<EventWinBean>();
		
		try {
			String sql = "SELECT * FROM event_win";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EventWinBean article = new EventWinBean();
				article.setMember_id(rs.getString("member_id"));
				article.setEw_date(rs.getDate("ew_date"));
				article.setEw_100000(rs.getInt("ew_100000"));
				article.setEw_50000(rs.getInt("ew_50000"));
				article.setEw_30000(rs.getInt("ew_30000"));
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("EventDAO - getArticle() 실패! : "+e.getMessage());
			e.printStackTrace();
		}
		
		return articleList;
	}
	
	public ArrayList<EventBean> getArticle() {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		ArrayList<EventBean> articleList = new ArrayList<EventBean>();
		
		try {
			String sql = "SELECT * FROM event";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EventBean article = new EventBean();
				article.setE_num(rs.getInt("e_num"));
				article.setE_sdate(rs.getDate("e_sdate"));
				article.setE_edate(rs.getDate("e_edate"));
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("EventDAO - getArticle() 실패! : "+e.getMessage());
			e.printStackTrace();
		}
		
		return articleList;
	}
}
