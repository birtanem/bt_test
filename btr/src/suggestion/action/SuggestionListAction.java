package suggestion.action;

import java.sql.Connection;
import java.util.*;

import javax.servlet.http.*;

import static common.db.JdbcUtil.*;
import common.action.*;
import common.dao.SuggestionDAO;
import common.vo.*;
import suggestion.svc.*;
import suggestion.vo.*;

public class SuggestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SuggestionListAction");	

		ActionForward forward = null;
		
		SuggestionListService suggestionListService = new SuggestionListService();
		
		int listCount = suggestionListService.getListCount();
		
		System.out.println("전체 게시물 수 : " + listCount); //게시물수 
		
//		request.getSession(id); 세션 받아오기
		String id = "admin"; //임시 아이디
		
		ArrayList<SuggestionBean> articleList = suggestionListService.getArticleList(id);
		
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/suggestion/suggestion_List.jsp");
		
		return forward;
	}

}
