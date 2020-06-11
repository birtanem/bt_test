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

			
			String id = (String)session.getAttribute("id");
			EventPointService eventPointService = new EventPointService();
			
			boolean isMinusPointSuccess =  eventPointService.minusPoint(id);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(!isMinusPointSuccess) {
				
				out.println("0");
				
			}else {
				
				EventPageService eventPageService = new EventPageService();
				
				
				out.println(eventPageService.getPoint(id));
						
			}

	
		return forward;
	}

}
