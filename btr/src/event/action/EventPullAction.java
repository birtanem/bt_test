package event.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventPullService;

public class EventPullAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		EventPullService eventPullService = new EventPullService();
		
		int setPullSuccess = eventPullService.pullEventBox();
		
		PrintWriter out = response.getWriter();
		
		if(setPullSuccess == 30001) {
			
			out.println("30000");
			
		}else if(setPullSuccess == 50001){
			
			out.println("50000");		
			
		}else if(setPullSuccess == 100001){
			
			out.println("100000");
			
		}else if(setPullSuccess == 1) { // 꽝
			
			out.println("1");
			
		}else if(setPullSuccess == 0){ // 종료
			
			out.println("0");
		}else {
			
			
		}
		
		return forward;
	}

}
