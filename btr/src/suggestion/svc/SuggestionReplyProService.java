package suggestion.svc;
import static common.db.JdbcUtil.*;
import java.sql.*;
import common.dao.*;
import common.vo.*;
import suggestion.vo.*;

public class SuggestionReplyProService {

	public boolean updateCheck(SuggestionBean suggestionBean) {
		boolean isReplySucces = false;
		
		Connection con = getConnection();
		SuggestionDAO suggestionDAO = SuggestionDAO.getInstance();
		suggestionDAO.setConnection(con);

		int updateCount = suggestionDAO.updateCheck(suggestionBean);
		
		if (updateCount > 0) {
			commit(con);
			isReplySucces = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isReplySucces;
	}
	
}
