package review.svc;

import java.sql.Connection;

import common.dao.ReviewDAO;
import review.vo.ReviewBean;

import static common.db.JdbcUtil.*;

public class ReviewUpdateService {

	public ReviewBean SelectUpdateArticle(int r_num) {

		ReviewBean article = null;
		
		int updateCount = 0;
		
		System.out.println("ReviewUpdateService");
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		article = reviewDAO.selectArticle(r_num);
		
		close(con);
		
		return article;
	}

}
