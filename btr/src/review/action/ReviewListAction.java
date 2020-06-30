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
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		ReviewPageInfo pageinfo = new ReviewPageInfo(page, maxPage, startPage, endPage, listCount);

		ReviewContentService reviewContentService = new ReviewContentService();
		
		ArrayList<ReviewBean> arrayList = reviewContentService.getArrayList();
		
		request.setAttribute("arrayList",arrayList);
		
// ------------------------------------------------------------------------------------------------------------
		
		if (request.getParameter("r_code") != null) {
			int rc_code = Integer.parseInt(request.getParameter("r_code"));
			
			ArrayList<ReviewBean> articleList = reviewListService.getArticleList(page, limit, rc_code);
			
			request.setAttribute("pageinfo", pageinfo);
			request.setAttribute("articleList", articleList);
			
		}else if(request.getParameter("r_search") != null) {
			
			String r_search = request.getParameter("r_search");
			
			ArrayList<ReviewBean> articleList = reviewListService.getArticleList(page, limit, r_search);
			
			request.setAttribute("pageinfo", pageinfo);
			request.setAttribute("articleList", articleList);
			
		}else {
			ArrayList<ReviewBean> articleList = reviewListService.getArticleList(page, limit);

			request.setAttribute("pageinfo", pageinfo);
			request.setAttribute("articleList", articleList);
			
		}
		
		forward = new ActionForward();
		forward.setPath("/review/review_List.jsp");
		
		return forward;
	}

}
