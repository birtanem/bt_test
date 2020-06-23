package admin.dao;

import static common.db.JdbcUtil.*;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class AdminDAO {

	public AdminDAO() {}
	
	private static AdminDAO instance;

	public static AdminDAO getInstance() {
		// BoardDAO 객체가 없을 경우에만 생성
		if(instance == null) {
			instance = new AdminDAO();
		}	
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int getMemberCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int memberCount = 0;
		
		String sql = "SELECT COUNT(*) FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return memberCount;
	}

	public int getPlaceCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardCount = 0;
		
		String sql = "SELECT SUM(pl_readcount) FROM place";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardCount;
	}
	
	public long getRevenue() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		long revenue = 0;
		
		String sql = "SELECT SUM(o_price) FROM `order`";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				revenue = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return revenue;
	}

	public JSONArray getRevenueLog() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray jsonArray = new JSONArray();
		
		String sql = "SELECT l.date as date, truncate((l2.revenue - l.revenue)/l.revenue*100,0) as rate, l2.revenue as revenue  FROM log l JOIN log l2 ON l.num = l2.num-1 ORDER BY date DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject obj = new JSONObject();
				
				obj.put("date",rs.getString("date"));
				obj.put("rate",rs.getString("rate"));
				obj.put("revenue",rs.getString("revenue"));
				
				jsonArray.add(obj);
								
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}


		return jsonArray;
	}
}
