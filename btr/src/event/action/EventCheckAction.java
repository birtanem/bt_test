package event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import event.dao.EventDAO;
import static common.db.JdbcUtil.*;

import java.io.PrintWriter;
import java.sql.Connection;

public class EventCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		Connection con = getConnection();
		
		EventDAO eventDAO = EventDAO.getInstance();
		
		eventDAO.setConnection(con);
		
		int check = eventDAO.setPullCheck();
		
		commit(con);
		
		close(con);
		
		System.out.println(check);
		
		if(check == 0) {
		
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
//			out.print("0");
		}
		
		
		return forward;
	}

}
