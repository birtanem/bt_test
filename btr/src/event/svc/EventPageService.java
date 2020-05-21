package event.svc;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.Date;

import event.dao.EventDAO;
import event.vo.EventWinBean;


public class EventPageService {
	
	public EventWinBean getArticle(String memeber_id) {

		System.out.println("EventPageService");
		EventWinBean article = null;
		Date date = null;
		
		// DB 작업을 위한 준비 => Connection 객체, DAO 객체, DAO 객체의 메서드 호출
		// 공통작업-1. DB 작업에 필요한 Connection 객체 가져오기
		Connection con = getConnection(); // static import 로 지정된 메서드 호출
		
		// 공통작업-2. DB 작업을 위한 BoardDAO 객체 생성 => 싱글톤 패턴으로 생성된 객체 가져오기
		EventDAO eventDAO = EventDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달
		eventDAO.setConnection(con);
		
	
		article = eventDAO.selectArticle(memeber_id);
		
		date = eventDAO.selectDate();
		
		article.setEw_date(date);
		
		// article 객체가 null 이 아닐 때 조회수 증가
		
		if(article != null && date != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		// 공통작업-5. Connection 객체 반환
		close(con);
		
		return article;
	}
}
