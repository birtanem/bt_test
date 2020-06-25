package review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.action.Action;
import common.vo.ActionForward;
import review.svc.ReviewContentService;
import review.vo.ReviewBean;

public class ReviewLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		String page = request.getParameter("page");
		
		System.out.println("ReviewLikeAction");
		String id = request.getParameter("id");
		String ip = request.getParameter("ip");
		System.out.println(ip);
		ReviewContentService reviewContentService = new ReviewContentService();
		
		boolean likeArticle = reviewContentService.LikeArticle(r_num, id);
		
		if (!likeArticle) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('좋아요 실패!')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			System.out.println("좋아요 성공");
			
			ReviewBean article = reviewContentService.getArticle(r_num);
			
			JSONObject json = new JSONObject();
			
			json.put("likecount", article.getR_likecount());
			
			out.print(json);
			System.out.println(json);
//			forward = new ActionForward();
			
//			forward.setPath("/Review_Content.re?r_num="+r_num+"&page="+page);
		}
		
		return forward;
	}

}
