package review.svc;

import static common.db.JdbcUtil.*;

import java.sql.*;

import common.dao.*;
import common.vo.*;
import review.vo.*;

public class ReviewContentService {

	public ReviewBean  getArticle(int r_num) {
		
		ReviewBean article = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		article = reviewDAO.selectArticle(r_num);
		
		if (article != null) {
			int updateCount = reviewDAO.updateCount(r_num);
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
