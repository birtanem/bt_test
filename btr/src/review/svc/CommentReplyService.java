package review.svc;

import review.dao.CommentDAO;
import review.vo.CommentBean;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

public class CommentReplyService {

	public boolean insertArticle(CommentBean article) {

		boolean isReply = false;
		
		System.out.println("CommentReplyService - insertArticle");
		
		Connection con = getConnection();
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.setConnection(con);
		
		int replyCount = commentDAO.ReplyArticl(article);
		
		if (replyCount > 0) {
			commit(con);
			isReply = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isReply;
	}

}
