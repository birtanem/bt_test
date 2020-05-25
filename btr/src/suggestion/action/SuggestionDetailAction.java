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

public class SuggestionDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SuggestionDetailAction");	

		ActionForward forward = null;
		
		
		
//		SuggestionListService suggestionListService = new SuggestionListService();
//		ArrayList<SuggestionBean> articleList = suggestionListService.getArticleList(id);
//		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/suggestion/suggestion_Detail.jsp");
		
		return forward;
	}

}
