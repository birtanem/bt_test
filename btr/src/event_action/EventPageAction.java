package event_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import event_svc.EventPageService;
import event_vo.EventWinBean;
import vo.ActionForward;


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
			
			request.setAttribute("article", article);
			
		}
		
		
		forward = new ActionForward();
		
		forward.setPath("/event.jsp");
			
		return forward;
	}

}
