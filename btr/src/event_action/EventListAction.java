package event_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import event_svc.EventListService;
import vo.ActionForward;
import vo.EventBean;
import vo.EventWinBean;

public class EventListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventListAction");
		
		ActionForward forward = null;
		
		// EventListService 클래스 인스턴스 생성
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "imumdae");
		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
			
			EventListService eventListService = new EventListService();
			
			EventWinBean article = eventListService.getArticle(id);
			
			request.setAttribute("article", article);
			
			System.out.println("1");
			
		}

		
		forward = new ActionForward();
		
		forward.setPath("/event.jsp");
			
		return forward;
	}

}
