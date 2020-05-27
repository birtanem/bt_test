package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import review.vo.CommentBean;

import static common.db.JdbcUtil.*;

public class CommentDAO {

	private CommentDAO() {}
	
	private static CommentDAO instance;
	
	public static CommentDAO getInstance() {
		
		if (instance == null) {
			instance = new CommentDAO();
		}
		
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int InsertArticle(CommentBean article) {

		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int rc_num = 0;
		
		try {
			
			String sql = "select max(rc_num) from review_comment";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rc_num = rs.getInt(1)+1;
			}
			
			sql = "insert into review_comment values(?,?,?,?,now(),?,?,?)";
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, rc_num);
			pstmt.setInt(2, article.getR_num());
			pstmt.setString(3, article.getRc_id());
			pstmt.setString(4, article.getRc_content());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("CommentDAO - InsertArticle() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int getArticle() {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int articleCount = 0;
		
		try {
			String sql = "select count(review_review_num) from review_comment";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				articleCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("CommentDAO - getArticle() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return articleCount;
	}

	public ArrayList<CommentBean> getArticleList(int r_num) {

		ArrayList<CommentBean> articleList = new ArrayList<CommentBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from review_comment where review_review_num = ?"
					+ " order by rc_num desc";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, r_num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CommentBean article = new CommentBean();
				
				article.setRc_num(rs.getInt("rc_num"));
				article.setR_num(rs.getInt("review_review_num"));
				article.setRc_id(rs.getString("review_member_member_id"));
				article.setRc_content(rs.getString("rc_content"));
				article.setRc_date(rs.getDate("rc_date"));
				article.setRc_ref(rs.getInt("rc_ref"));
				article.setRc_lev(rs.getInt("rc_seq"));
				article.setRc_seq(rs.getInt("rct_lev"));
				
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("CommentDAO - getArticleList() 실패! : " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	
}
