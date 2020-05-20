package review_svc;

import java.sql.*;

import dao.*;
import review_vo.*;

import static db.JdbcUtil.*;

import vo.*;

public class ReviewContentService {

	public ReviewBean  getArticle(int num) {
		
		ReviewBean article = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		article = reviewDAO.selectArticle(num);
		
		if (article != null) {
			int updateCount = reviewDAO.updateCount(num);
			if (updateCount > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		
		return article;
		
	}
	
}
