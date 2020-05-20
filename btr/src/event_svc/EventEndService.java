package event_svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.EventDAO;

public class EventEndService {
	
	public boolean setEventEndDate() {
		
		boolean isSetDate = false;
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int setDate = eventDAO.setEndDate();
		
		if(setDate > 0) {
			commit(con);
			isSetDate = true;
		}else {
			rollback(con);
		}
		return isSetDate;
	}
}
