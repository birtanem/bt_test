package suggestion.svc;

import static common.db.JdbcUtil.*;

import java.sql.*;
import java.util.*;
import static common.db.JdbcUtil.*;

import common.dao.*;
import common.vo.*;
import suggestion.vo.SuggestionBean;


public class SuggestionDetailService {

	public SuggestionBean getArticleList(int su_num) { //수정필요
		
		SuggestionBean article = null;
		
		//공통작업-1. DB 작업에 필요한 Connection 객체 가져오기
		Connection con = getConnection();
		
		// 공통작업-2. DB 작업을 위한 BoardDAO 객체 생성 => 싱글톤 패턴으로 생성된 객체 가져오기
		SuggestionDAO suggestionDAO = SuggestionDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달
		suggestionDAO.setConnection(con);
		
		// 4. 게시물 상세 내용 조회 및 조회수 증가
		article = suggestionDAO.selectArticle(su_num);

		// 공통작업-5. Connection 객체 반환
		close(con);
		
		// 6. 작업 결과 리턴
		return article;
		
	}
	
}
