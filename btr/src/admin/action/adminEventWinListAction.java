package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.adminEventWinListService;
import event.vo.EventWinBean;

public class adminEventWinListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("adminEventAction");
		ActionForward forward = null;
		adminEventWinListService admineventWinListService = new adminEventWinListService();
		
		ArrayList<EventWinBean> eventWinList =  admineventWinListService.getWinArticleList();

		request.setAttribute("eventWinList", eventWinList);

		forward = new ActionForward();
		forward.setPath("/event/eventAdmin.jsp");
		return forward;
	}

}
