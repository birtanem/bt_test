package review.action;

import java.io.PrintWriter;

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
		String page = request.getParameter("page");
		
		System.out.println("ReviewLikeAction");
		
		ReviewContentService reviewContentService = new ReviewContentService();
		
		boolean likeArticle = reviewContentService.getLikeArticle(r_num);
		
		if (!likeArticle) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('좋아요 실패!')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			
			System.out.println("좋아요 성공");
			
			forward = new ActionForward();
			
			forward.setPath("/Review_Content.re?r_num="+r_num+"&page="+page);
		}
		
		
		return forward;
	}

}
