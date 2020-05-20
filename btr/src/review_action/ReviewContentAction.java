package review_action;

import javax.servlet.http.*;

import action.*;
import dao.*;
import review_svc.*;
import review_vo.*;
import vo.*;

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
