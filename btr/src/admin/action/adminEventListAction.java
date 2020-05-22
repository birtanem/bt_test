package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.adminEventListService;
import event.vo.EventBean;

public class adminEventListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("adminEventListAction");
		ActionForward forward = null;
		adminEventListService adminEventListService = new adminEventListService();
		
		ArrayList<EventBean> eventList =  adminEventListService.getArticleList();

		request.setAttribute("eventList", eventList);

		forward = new ActionForward();
		forward.setPath("/event/eventAdmin.jsp");
		return forward;
	}

}
