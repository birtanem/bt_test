package event.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventPageService;
import event.svc.EventPointService;

public class EventPointAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventPointAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "test");
		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
			EventPointService eventPointService = new EventPointService();
			
			boolean isMinusPointSuccess =  eventPointService.minusPoint(id);
			
			if(!isMinusPointSuccess) {
				
				
				
			}else {
				response.setContentType("text/html;charset=UTF-8");
				EventPageService eventPageService = new EventPageService();
				PrintWriter out = response.getWriter();
				
				out.println(eventPageService.getPoint(id));
						
			}
			
			
		}
	
		return forward;
	}

}
