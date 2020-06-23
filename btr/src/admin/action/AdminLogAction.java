package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import admin.svc.AdminLogActionService;
import common.action.Action;
import common.vo.ActionForward;

public class AdminLogAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		AdminLogActionService adminLogActionService = new AdminLogActionService();
		
		int memberCount = adminLogActionService.getMemberCount();
		
		request.setAttribute("memberCount", memberCount);
		
		int boardCount = adminLogActionService.getBoardCount();
		
		request.setAttribute("boardCount", boardCount);
		
		long revenue = adminLogActionService.getRevenue();
		
		JSONObject obj = new JSONObject();
				
		System.out.println(memberCount+", "+boardCount+", "+revenue);
		
		obj.put("memberCount", memberCount);
		obj.put("boardCount", boardCount);
		obj.put("revenue", revenue);
		
		request.setAttribute("total", obj);
		
		forward = new ActionForward();
		
		forward.setPath("/admin/adminLog.jsp");
		
			
		return forward;
	}

}
