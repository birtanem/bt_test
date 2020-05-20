package suggestion_svc;

import vo.*;

import static db.JdbcUtil.*;

import java.sql.*;

import dao.*;

public class SuggestionWriteProService {

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
