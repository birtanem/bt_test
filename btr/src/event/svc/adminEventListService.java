package event.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import event.dao.EventDAO;
import event.vo.EventBean;


public class adminEventListService {

	public ArrayList<EventBean> getArticleList() {
		
		System.out.println("adminEventWinListService");
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		ArrayList<EventBean> eventList = eventDAO.getArticle();	
		
		close(con);
		
		return eventList;
		
	}
}
