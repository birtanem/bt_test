package event.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventPageService;
import event.vo.EventWinBean;


public class EventPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventListAction");
		
		ActionForward forward = null;
	
		// EventListService 클래스 인스턴스 생성
		EventPageService eventPageService = new EventPageService();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "imumdae");
		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
					
			EventWinBean article = eventPageService.getArticle(id);
			
			Timestamp date = eventPageService.getDate();
			
			int point = eventPageService.getPoint(id);
			
			request.setAttribute("article", article);
			request.setAttribute("date", date);
			request.setAttribute("point", point);
			
			
		}
		
		
		forward = new ActionForward();
		
		forward.setPath("/event/event.jsp");
			
		return forward;
	}

}
