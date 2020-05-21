package dao;

import java.sql.*;
import java.util.*;

import suggestion_vo.*;
import vo.*;

import static db.JdbcUtil.*;

public class SuggestionDAO {

	private SuggestionDAO() {}
	
	private static SuggestionDAO instance;
	
	public static SuggestionDAO getInstance() { //?????
		
		if (instance == null) {
			instance = new SuggestionDAO();
		}
		
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertSuggestion(SuggestionBean suggestionBean) {

		int insertCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "insert into suggestion(member_id,member_email,suggestion_subject,suggestion_content,suggestion_date,suggestion_check) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, suggestionBean.getId());
			pstmt.setString(2, suggestionBean.getEmail());
			pstmt.setString(3, suggestionBean.getSubject());
			pstmt.setString(4, suggestionBean.getContent());
			pstmt.setDate(5, suggestionBean.getDate());
			pstmt.setString(6, suggestionBean.getCheck());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SuggestionDAO - insertSuggestion() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

//	public ArrayList<ReviewBean> selectArticleList(int page, int limit) {
//
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		int startRow = (page-1)*limit;
//		
//		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
//		
//		try {
//			String sql = "select * from review order by num desc";
//			
//			pstmt = con.prepareStatement(sql);
//
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//
//				ReviewBean reviewBean = new ReviewBean();
//				
//				reviewBean.setNum(rs.getInt("num"));
//				reviewBean.setSubject(rs.getString("subject"));
//				reviewBean.setContent(rs.getString("content"));
//				reviewBean.setReadcount(rs.getInt("readcount"));
//				reviewBean.setLikecount(rs.getInt("likecount"));
//				reviewBean.setDate(rs.getDate("date"));
//				
//				articleList.add(reviewBean);
//				
//			}
//		
//		} catch (SQLException e) {
//			System.out.println("BoardDAO - selectArticleList() 실패! : " + e.getMessage());
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		return articleList;
//	}

//	public ReviewBean selectArticle(int num) {
//
//		ReviewBean article = null;
//		
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			String sql = "select * from review where num = ?";
//			
//			pstmt = con.prepareStatement(sql);
//
//			pstmt.setInt(1, num);
//			
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				
//				article = new ReviewBean();
//				
//				article.setNum(rs.getInt("num"));
//				article.setSubject(rs.getString("subject"));
//				article.setContent(rs.getString("content"));
//				article.setReadcount(rs.getInt("readcount"));
//				article.setLikecount(rs.getInt("likecount"));
//				article.setDate(rs.getDate("date"));
//			}
//		
//		} catch (SQLException e) {
//			System.out.println("BoardDAO - selectArticle() 실패! : " + e.getMessage());
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		
//		return article;
//	}
	
}
