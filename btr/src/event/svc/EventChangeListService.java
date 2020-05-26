package event.svc;

import java.sql.Connection;
import java.util.ArrayList;

import event.dao.EventDAO;
import event.vo.EventWinBean;
import static common.db.JdbcUtil.*;

public class EventChangeListService {

	public ArrayList<EventWinBean> changeEventWinList(int sel) {
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		ArrayList<EventWinBean> articleList = eventDAO.getChangeWinArticle(sel);
		
		close(con);
		return articleList;
	}

}
