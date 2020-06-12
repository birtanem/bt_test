package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import review.svc.*;
import review.vo.ReviewBean;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewUpdateProAction");
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int r_code = Integer.parseInt(request.getParameter("r_code"));
		String page = request.getParameter("page");
		
		System.out.println(r_num);

		ReviewBean reviewBean = new ReviewBean();
		
		reviewBean.setR_num(r_num);
		reviewBean.setR_subject(request.getParameter("r_subject"));
		reviewBean.setR_content(request.getParameter("r_content"));
		reviewBean.setR_image(request.getParameter("r_image"));
		reviewBean.setR_code(r_code);
		
		ReviewUpdateService reviewUpdateService = new ReviewUpdateService();
		
		boolean isUpdate = reviewUpdateService.UpdateArticle(reviewBean);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("Review_Content.re?r_num="+r_num+"&page="+page);
		
		return forward;
	}

}
