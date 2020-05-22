package event.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventPullService;

public class EventCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("EventCheckAction");
		ActionForward forward = null;
		
		EventPullService eventPullService = new EventPullService();
		
		int setPullSuccess = eventPullService.pullEventBox();
		
		PrintWriter out = response.getWriter();
		
		System.out.println(setPullSuccess);
		if(setPullSuccess == 2) {
			
			out.print("1");
			
		}else if(setPullSuccess == 3){
			
			out.print("0");		
			
		}else {
			
			out.print("-1");
			
		}
		
		
		
		return forward;
	}

}
