package suggestion.svc;

import static common.db.JdbcUtil.*;

import java.sql.*;
import java.util.*;

import common.dao.*;
import common.vo.*;
import suggestion.vo.SuggestionBean;


public class SuggestionListService {

	public int	 getListCount() {
		System.out.println("ReviewListService - getListCount()");
		int listCount = 0;
		
		Connection con = getConnection();
		
		SuggestionDAO suggestionDAO = SuggestionDAO.getInstance();
		
		suggestionDAO.setConnection(con);
		
		listCount = suggestionDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<SuggestionBean> getArticleList(String id) {
		
		ArrayList<SuggestionBean> articleList = null;
		
		System.out.println("ReviewListService -getArticleList()");
		
		Connection con = getConnection();
		
		SuggestionDAO suggestionDAO = SuggestionDAO.getInstance();
		
		suggestionDAO.setConnection(con);
		
//		articleList = suggestionDAO.selectArticleList(page,limit);
		articleList = suggestionDAO.selectArticleList(id);
		
		close(con);
		
		return articleList;
		
	}
	
}
