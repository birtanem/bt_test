package review_svc;

import static db.JdbcUtil.*;

import java.sql.*;
import java.util.*;

import dao.*;
import review_vo.*;
import vo.*;

public class ReviewListService {

	public int	 getListCount() {
		System.out.println("ReviewListService - getListCount()");
		int listCount = 0;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<ReviewBean> getArticleList(int page, int limit) {
		
		ArrayList<ReviewBean> articleList = null;
		
		System.out.println("ReviewListService -getArticleList()");
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page,limit);
		
		close(con);
		
		return articleList;
		
	}
	
}
