package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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
		int boardCount = adminLogActionService.getBoardCount();		
		long revenue = adminLogActionService.getRevenue();
		
	
		JSONArray jsonArray = adminLogActionService.getRevenueLog();
		
		int[] typeArr = adminLogActionService.getTypeCount();
		
		for(int i=0;i<typeArr.length;i++) {
			System.out.println(typeArr[i]);
		}

		
		JSONObject obj = new JSONObject();
				
		System.out.println(memberCount+", "+boardCount+", "+revenue);
		
		obj.put("memberCount", memberCount);
		obj.put("boardCount", boardCount);
		obj.put("revenue", revenue);
		
		request.setAttribute("type", typeArr);
		request.setAttribute("list", jsonArray);
		request.setAttribute("total", obj);
		
		forward = new ActionForward();
		
		forward.setPath("/admin/adminLog.jsp");
		
			
		return forward;
	}

}
