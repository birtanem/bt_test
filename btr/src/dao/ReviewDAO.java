package dao;

import java.sql.*;
import java.util.*;

import vo.*;

import static db.JdbcUtil.*;

public class ReviewDAO {

	private ReviewDAO() {}
	
	private static ReviewDAO instance;
	
	public static ReviewDAO getInstance() {
		
		if (instance == null) {
			instance = new ReviewDAO();
		}
		
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertArticle(ReviewBean reviewBean) {

		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0;
		
		try {
			
			String sql = "select max(num) from review";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1)+1;
			}
			
			sql = "insert into review values(?,?,?,?,?,now())";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewBean.getSubject());
			pstmt.setString(3, reviewBean.getContent());
			pstmt.setInt(4, 0);
			pstmt.setInt(5, 0);
			

			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO - insertArticle() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int selectListCount() {

		int selectCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(num) from review";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				selectCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardDAO - selectListCount() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return selectCount;
	}

	public ArrayList<ReviewBean> selectArticleList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page-1)*limit;
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		
		try {
			String sql = "select * from review";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				ReviewBean reviewBean = new ReviewBean();
				
				reviewBean.setNum(rs.getInt("num"));
				reviewBean.setSubject(rs.getString("subject"));
				reviewBean.setContent(rs.getString("content"));
				reviewBean.setReadcount(rs.getInt("readcount"));
				reviewBean.setLikecount(rs.getInt("likecount"));
				reviewBean.setDate(rs.getDate("date"));
				
				articleList.add(reviewBean);
				
			}
		
		} catch (SQLException e) {
			System.out.println("BoardDAO - selectArticleList() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
}
