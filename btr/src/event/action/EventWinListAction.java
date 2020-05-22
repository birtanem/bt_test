package event.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventWinListService;
import event.vo.EventWinBean;

public class EventWinListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventWinListAction");
		ActionForward forward = null;
		EventWinBean articleList = null;
		EventWinListService eventWinListService = new EventWinListService();
		
		ArrayList<EventWinBean> eventWinList =  eventWinListService.getArticleList();
		
		for(int i=0;i<eventWinList.size();i++) {
			
			articleList = (EventWinBean)eventWinList.get(i);
			
		}

		System.out.println(articleList.getEw_100000());
		// request 객체에 PageInfo 객체와 ArrayList 객체 저장
		request.setAttribute("articleList", articleList);
		
		
		
		
		// ActionForward 객체를 생성하여 Dispatcher 방식으로
		// 포워딩 경로를 board 폴더 내의 qna_board_list.jsp 페이지로 지정
		forward = new ActionForward();
		forward.setPath("event/eventAdmin.jsp");
		return forward;
	}

}
