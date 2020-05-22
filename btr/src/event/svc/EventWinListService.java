package event.svc;

import java.sql.Connection;
import java.util.ArrayList;

import event.dao.EventDAO;
import event.vo.EventWinBean;

import static common.db.JdbcUtil.*;

public class EventWinListService {
	
	public ArrayList<EventWinBean> getArticleList() {
		
		System.out.println("EventWinListService");
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		ArrayList<EventWinBean> articleList = eventDAO.getArticle();
		
		
		close(con);
		
		return articleList;
		
	}
}
