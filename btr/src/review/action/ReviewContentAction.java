package review.action;

import javax.servlet.http.*;

import common.action.*;
import common.dao.*;
import common.vo.*;
import review.svc.*;
import review.vo.*;

public class ReviewContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewContentAction");
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		String page = request.getParameter("page");
		
		ReviewContentService reviewContentService = new ReviewContentService();
		
		ReviewBean article = reviewContentService.getArticle(r_num);
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		
		forward = new ActionForward();
		
		forward.setPath("/review/review_Content.jsp");
		
		return forward;
	}

}
