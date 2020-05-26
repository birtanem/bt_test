package event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventWinService;

public class EventWinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventWinAction");
		ActionForward forward = null;
	
		EventWinService eventWinService = new EventWinService();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "test");
		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
			int point = Integer.parseInt(request.getParameter("point"));
			System.out.println(point);
			boolean isInsertSuccess =  eventWinService.addWinCoupon(point, id);
			boolean isInsertSuccess2 = eventWinService.addWinList(id); 
			
			if(!isInsertSuccess || isInsertSuccess2) {
				
			}else {
				
				
			}
		}
		
		
		
		return forward;
	}

}
