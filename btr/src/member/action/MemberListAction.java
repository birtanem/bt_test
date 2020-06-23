package member.action;

import java.util.*;

import javax.servlet.http.*;

import common.action.*;
import common.vo.*;
import member.svc.MemberWriteListService;
import member.vo.MemberBean;
import member.vo.MemberPageInfo;
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
		
		int listCount = memberListService.memberListCount();
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		MemberPageInfo pageinfo = new MemberPageInfo(page, maxPage, startPage, endPage, listCount);

		
// ------------------------------------------------------------------------------------------------------------
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();	
		String type = null;
		
		if(request.getParameter("type") == null) {
			type = "id ASC";
		} else {
			type = request.getParameter("type");
		}
		
		memberList = memberListService.getMemberList(page, limit, type);
		forward = new ActionForward();
		forward.setPath("/member/member_MemberList.jsp?type="+type);

			
		request.setAttribute("pageinfo", pageinfo);
		request.setAttribute("articleList", memberList);
		
		System.out.println("1");
		return forward;
	}

}
