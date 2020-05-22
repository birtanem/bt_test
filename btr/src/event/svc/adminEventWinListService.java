package event.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import event.dao.EventDAO;
import event.vo.EventWinBean;

public class adminEventWinListService {

	public ArrayList<EventWinBean> getArticleList() {
		
		System.out.println("adminEventWinListService");
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		ArrayList<EventWinBean> eventWinList = eventDAO.getWinArticle();
		
		
		close(con);
		
		return eventWinList;
		
	}
}
