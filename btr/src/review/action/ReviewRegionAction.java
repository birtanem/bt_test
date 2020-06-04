package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;

public class ReviewRegionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewRegionAction");
		
		int r_code = Integer.parseInt(request.getParameter("r_code"));
		
		System.out.println("지역코드 = "+r_code);
		
		
		
		return forward;
	}

}
