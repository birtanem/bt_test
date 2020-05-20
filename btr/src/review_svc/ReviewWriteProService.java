package review_svc;

import vo.*;

import static db.JdbcUtil.*;

import java.sql.*;

import dao.*;
import review_vo.*;

public class ReviewWriteProService {

	public boolean registArticle(ReviewBean reviewBean) {
		
		boolean isWriteSucces = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int insertCount = reviewDAO.insertArticle(reviewBean);
		
		if (insertCount > 0) {
			commit(con);
			isWriteSucces = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isWriteSucces;
	}
	
}
