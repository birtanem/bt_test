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
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewContentService reviewContentService = new ReviewContentService();
		
		ReviewBean article = reviewContentService.getArticle(num);
		
		request.setAttribute("article", article);
		
		forward = new ActionForward();
		
		forward.setPath("/review/review_Content.jsp");
		
		return forward;
	}

}
