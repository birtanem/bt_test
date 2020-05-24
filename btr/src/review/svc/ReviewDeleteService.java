package review.svc;

import java.sql.*;

import common.dao.*;
import review.vo.*;

import static common.db.JdbcUtil.*;

public class ReviewDeleteService {

	public boolean DeleteArticle(int r_num) {
		System.out.println("ReviewDeleteService");
		boolean article = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int deleteCount = reviewDAO.Delete(r_num);
		
		if (deleteCount > 0) {
			commit(con);
			article = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return article;
	}



}
