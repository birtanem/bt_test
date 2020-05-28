package review.action;

import java.util.*;

import javax.servlet.http.*;

import common.action.*;
import common.vo.*;
import review.svc.*;
import review.vo.*;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("ReviewListAction");	
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ReviewListService reviewListService = new ReviewListService();
		
		int listCount = reviewListService.getListCount();
		
		System.out.println(listCount);
		
		CommentListService commentListService = new CommentListService();
				
		
		ArrayList<ReviewBean> articleList = reviewListService.getArticleList(page, limit);
		
		int commentCount = commentListService.getArticle();
		
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		ReviewPageInfo pageinfo = new ReviewPageInfo(page, maxPage, startPage, endPage, listCount, commentCount);
		
		request.setAttribute("pageinfo", pageinfo);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/review/review_List.jsp");
		
		return forward;
	}

}
