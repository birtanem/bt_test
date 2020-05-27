package event.svc;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

import event.dao.EventDAO;


public class EventPullService {

	public int pullEventBox() {
		
		System.out.println("EventPullService");
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int setPull = eventDAO.setPull();
		
		if(setPull == 30001 || setPull == 50001 || setPull == 100001 || setPull == 1) {
			
			commit(con);
			
		}else {
		
			rollback(con);
		}
		
		close(con);
		
		return setPull;
	}
}
