package common.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.vo.ActionForward;
import place.action.PlaceListAction;
import place.svc.PlaceListService;
import place.vo.PlaceBean;

public class MainListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainListAction");
		ActionForward forward = null;
		PlaceListService placeListService = new PlaceListService();
		
		ArrayList<PlaceBean> list = placeListService.getList();
		
		request.setAttribute("list", list);
		
		forward = new ActionForward();
		
		forward.setPath("/index.jsp");
		
		return forward;
	}

}
