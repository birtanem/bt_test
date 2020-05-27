package suggestion.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.*;

import javax.servlet.http.*;

import static common.db.JdbcUtil.*;
import common.action.*;
import common.dao.SuggestionDAO;
import common.vo.*;
import suggestion.svc.*;
import suggestion.vo.*;

public class adminSuggestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("adminSuggestionListAction");	

		ActionForward forward = null;
		
		SuggestionListService suggestionListService = new SuggestionListService();
		
		int listCount = suggestionListService.getListCount();
		
		System.out.println("전체 게시물 수 : " + listCount); //게시물수 
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id.equals("admin")) {
			ArrayList<SuggestionBean> articleList = suggestionListService.adminGetArticleList();
			
			request.setAttribute("articleList", articleList);
			
			forward = new ActionForward();
			forward.setPath("/suggestion/suggestion_List.jsp");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('관리자전용 페이지입니다')");
			out.println("history.back()");
			out.println("</script>"); 
		}
		return forward;
	}

}
