package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;

public class ReviewDeleteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewDeleteFormAction");
		
		forward = new ActionForward();
		forward.setPath("/review/review_Delete.jsp");
		
		return forward;
	}

}
