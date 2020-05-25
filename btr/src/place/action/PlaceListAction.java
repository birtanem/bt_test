package place.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;

public class PlaceListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PlaceListAction");
		ActionForward forward = null;
		forward = new ActionForward();
		forward.setPath("/place/place_list.jsp");
		
		
		return forward;
	}

}
