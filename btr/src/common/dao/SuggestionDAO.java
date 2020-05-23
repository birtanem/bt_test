package common.dao;

import java.sql.*;
import java.util.*;

import suggestion.vo.*;

import static common.db.JdbcUtil.*;

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
		
		int num = 0;
		String check="미확인";
		
		try {
			
			String sql = "select max(sg_num) from suggestion";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1)+1;
			}
			
			sql = "insert into suggestion values(?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, suggestionBean.getId());
			pstmt.setString(3, suggestionBean.getContent());
			pstmt.setString(4, suggestionBean.getEmail());
			pstmt.setString(5, check);
			pstmt.setString(6, suggestionBean.getSubject());
			
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
