package review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import review.svc.CommentWriteService;
import review.vo.CommentBean;

public class CommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("CommentWriteProAction");
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		CommentBean article = new CommentBean();

		article.setR_num(r_num);
		article.setRc_id(request.getParameter("id"));
		article.setRc_content(request.getParameter("rc_content"));
		
		CommentWriteService commentWriteService = new CommentWriteService();
		
		boolean isComment = commentWriteService.isWriteComment(article);
		
		forward = new ActionForward();
		forward.setPath("/Review_Content.re?r_num="+r_num);
		
		return forward;
	}

}
