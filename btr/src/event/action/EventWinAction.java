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
		
		session.setAttribute("id", "imumdae");
		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
			int point = Integer.parseInt(request.getParameter("point"));
			System.out.println(point);
			boolean isInsertSuccess =  eventWinService.insertWinList(point, id);
			
			if(!isInsertSuccess) {
				
			}else {
				
				
			}
		}
		
		
		
		return forward;
	}

}
