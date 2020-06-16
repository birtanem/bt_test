package event.svc;

import java.sql.Connection;

import event.dao.EventDAO;
import member.vo.MemberBean;

import static common.db.JdbcUtil.*;

public class EventPointService {

	public boolean minusPoint(String member_id) {
		
		boolean isMinusPointSuccess = false;
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int updateCount = eventDAO.updateMinusPoint(member_id);
		
		if(updateCount > 0) {
			
			MemberBean article = eventDAO.selectArticle(member_id);
			if(article.getPoint() < 0) {
				rollback(con);
			}else {
				commit(con);
				isMinusPointSuccess = true;
			}
			
		}else {
			rollback(con);
		}
		
		close(con);
		return isMinusPointSuccess;
	}

}
