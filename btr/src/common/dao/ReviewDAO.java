package common.dao;

import static common.db.JdbcUtil.*;

import java.sql.*;
import java.util.*;

import common.vo.*;
import review.vo.*;

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
			
			String sql = "select max(r_num) from review";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1)+1;
			}
			
			sql = "insert into review values(?,?,?,?,?,?,now(),?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewBean.getMember_member_id());
			pstmt.setString(3, reviewBean.getR_subject());
			pstmt.setString(4, reviewBean.getR_content());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setString(7, reviewBean.getR_image());
			pstmt.setInt(8, reviewBean.getRegion_region_code());
			
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
			String sql = "select count(r_num) from review";
			
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
			String sql = "select * from review order by r_num desc";
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				ReviewBean reviewBean = new ReviewBean();
				
				reviewBean.setR_num(rs.getInt("r_num"));
				reviewBean.setMember_member_id(rs.getString("member_member_id"));
				reviewBean.setR_subject(rs.getString("r_subject"));
				reviewBean.setR_content(rs.getString("r_content"));
				reviewBean.setR_readcount(rs.getInt("r_readcount"));
				reviewBean.setR_likecount(rs.getInt("r_likecount"));
				reviewBean.setR_date(rs.getDate("r_date"));
				reviewBean.setR_image(rs.getString("r_image"));
				reviewBean.setRegion_region_code(rs.getInt("region_region_code"));
				
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

	public ReviewBean selectArticle(int r_num) {

		ReviewBean article = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "select * from review where r_num = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, r_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				article = new ReviewBean();
				
				article.setR_num(rs.getInt("r_num"));
				article.setMember_member_id(rs.getString("member_member_id"));
				article.setR_subject(rs.getString("r_subject"));
				article.setR_content(rs.getString("r_content"));
				article.setR_readcount(rs.getInt("r_readcount"));
				article.setR_likecount(rs.getInt("r_likecount"));
				article.setR_date(rs.getDate("r_date"));
				article.setR_image(rs.getString("r_image"));
				article.setRegion_region_code(rs.getInt("region_region_code"));
			}
		
		} catch (SQLException e) {
			System.out.println("BoardDAO - selectArticle() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return article;
	}

	public int updateCount(int r_num) {

		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update review set r_readcount = r_readcount+1 where r_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r_num);
			
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("BoardDAO - updateCount() 실패! : " + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public int update(int r_num) {

		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
		
			String sql = "update review set r_subject = ? , r_content = ? where r_num = ?";
			
			pstmt = con.prepareStatement(sql);

		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return updateCount;
	}

}
