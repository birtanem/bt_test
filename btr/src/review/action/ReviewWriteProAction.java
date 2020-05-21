package review.action;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import common.action.*;
import common.vo.*;
import review.svc.*;
import review.vo.*;

public class ReviewWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewWriteProAction");
		
		ReviewBean reviewBean = new ReviewBean();
		
		reviewBean.setSubject(request.getParameter("subject"));
		reviewBean.setContent(request.getParameter("content"));
		
		ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
		
		boolean isWriteSucces = reviewWriteProService.registArticle(reviewBean);
		
		if (!isWriteSucces) {
			
			response.setContentType("text/html:charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>"); 
			out.println("alert('글 등록 실패!')");
			out.println("history.back()"); 
			out.println("</script>"); 
			
		}else {
			System.out.println("글 등록 성공");

			forward = new ActionForward();
			
			forward.setRedirect(true);
			
			forward.setPath("Review_List.re");
		}
		
		return forward;
	}

}
