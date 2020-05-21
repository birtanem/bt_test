package suggestion_svc;

import vo.*;

import static db.JdbcUtil.*;

import java.sql.*;

import dao.*;
import suggestion_vo.*;

public class SuggestionWriteProService {

	public boolean registSuggestion(SuggestionBean suggestionBean) {
		boolean isWriteSucces = false;
		Connection con = getConnection();
		
		SuggestionDAO suggestionDAO = SuggestionDAO.getInstance();
		
		suggestionDAO.setConnection(con);
		
		int insertCount = suggestionDAO.insertSuggestion(suggestionBean);
		
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
