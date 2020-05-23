package event.svc;

import java.sql.Connection;

import event.dao.EventDAO;
import event.vo.EventWinBean;

import static common.db.JdbcUtil.*;

public class EventExchangeService {

	public boolean exchangePoint(int point, String member_id) {
		
		Connection con = getConnection();
		
		boolean isExchageSuccess = false;
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int updaCount = eventDAO.updateExchangePoint(point, member_id);
		
		if(updaCount > 1) {
			
			
			EventWinBean article = eventDAO.selectArticle(member_id);
			if(article.getEw_30000() < 0 || article.getEw_50000() < 0 || article.getEw_100000() < 0) {
				rollback(con);
			}else {
				commit(con);
				isExchageSuccess = true;
			}

		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isExchageSuccess;
	}

}
