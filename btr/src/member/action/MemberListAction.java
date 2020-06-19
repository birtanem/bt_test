package member.action;

import java.util.*;

import javax.servlet.http.*;

import common.action.*;
import common.vo.*;
import member.svc.MemberWriteListService;
import member.vo.MemberBean;
import member.svc.*;
import review.vo.*;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		System.out.println("MemberListAction");	
		
		int page = 1;
		int limit = 10;

		if (request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		MemberListService memberListService = new MemberListService();
		
		int listCount = memberListService.getListCount();
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		ReviewPageInfo pageinfo = new ReviewPageInfo(page, maxPage, startPage, endPage, listCount);

		
// ------------------------------------------------------------------------------------------------------------
		
			ArrayList<MemberBean> articleList = memberListService.getMemberList(page, limit);

			request.setAttribute("pageinfo", pageinfo);
			request.setAttribute("articleList", articleList);

		
		forward = new ActionForward();
		forward.setPath("/member/member_MemberList.jsp");
		
		System.out.println("1");
		return forward;
	}

}
