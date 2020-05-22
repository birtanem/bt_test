package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import review.vo.ReviewBean;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewUpdateProAction");
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		ReviewBean reviewBean = new ReviewBean();
		
		reviewBean.setR_num(r_num);
		reviewBean.setR_subject(request.getParameter("r_subject"));
		reviewBean.setR_content(request.getParameter("r_content"));
		
		forward = new ActionForward();
		forward.setPath("Review_List.re");
		
		return forward;
	}

}
