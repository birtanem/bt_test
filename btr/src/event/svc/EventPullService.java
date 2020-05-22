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
		
		if(setPull == 2 || setPull == 3) {
			
			commit(con);
			
		}else {
			
			setPull = 0;
			rollback(con);
		}
		
		close(con);
		
		return setPull;
	}
}
