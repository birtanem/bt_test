package event.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.commit;
import static common.db.JdbcUtil.getConnection;
import static common.db.JdbcUtil.rollback;

import java.sql.Connection;

import javax.swing.text.DefaultEditorKit.InsertContentAction;

import event.dao.EventDAO;
import event.vo.EventWinBean;

public class EventWinService {

	public boolean addWinCoupon(int point, String member_id) {
		System.out.println("EventWinService - insertWinList");
		Connection con = getConnection();
		
		boolean isInsertSuccess = false;
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int insertCount = eventDAO.updateCoupon(point, member_id);
		
		if(insertCount > 0) {
			
			commit(con);
			isInsertSuccess = true;

		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isInsertSuccess;
	}
	
	public boolean addWinList(int point, String member_id) {
		System.out.println("EventWinService - addWinList");
		Connection con = getConnection();
		
		boolean isInsertSuccess = false;
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int insertCount = eventDAO.insertWinArticle(point, member_id);
		
		if(insertCount > 0) {
			
			commit(con);
			isInsertSuccess = true;

		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return isInsertSuccess;
	}

}
