package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import review.svc.ReviewContentService;

public class ReviewLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		System.out.println("ReviewLikeAction");
		
		ReviewContentService reviewContentService = new ReviewContentService();
		
		int likeArticle = reviewContentService.getLikeArticle(r_num);
		
		forward = new ActionForward();
		
		forward.setPath("/Review_Content.re");
		
		return forward;
	}

}
