package event.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventExchangeService;


public class EventExchangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventExchangeAction");
		ActionForward forward = null;
		
		EventExchangeService eventExchangeService = new EventExchangeService();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "imumdae");
		
		int point = Integer.parseInt(request.getParameter("point"));
		

		
		if(session != null) {
			
			String id = (String)session.getAttribute("id");
			boolean isExchageSuccess =  eventExchangeService.exchangePoint(point, id);
			
			if(!isExchageSuccess) {
				
		
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('교환실패!')");
				out.println("history.back()");
				out.println("</script>");
				
				
			}else {

				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("event.ev");
			}		
		}	
		return forward;
	}

}
