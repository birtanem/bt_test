package review.action;

import java.util.ArrayList;

import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.action.*;
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

		ArrayList<ReviewBean> arrayList = reviewContentService.getArrayList();

		CommentListService commentListService = new CommentListService();
		
		ArrayList<CommentBean> articleList = commentListService.getArticleList(r_num);
		
		int commentCount = commentListService.getArticle(r_num);
		
		ReviewPageInfo pageinfo = new ReviewPageInfo(commentCount);
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		request.setAttribute("pageinfo", pageinfo);
		request.setAttribute("arrayList",arrayList);
		request.setAttribute("articleList",articleList);
		
		forward = new ActionForward();
		forward.setPath("/review/review_Content.jsp");
		
		return forward;
	}

}
