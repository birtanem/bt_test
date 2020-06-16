package order.svc;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

import org.json.simple.JSONObject;

import order.vo.OrderDAO;

public class OrderAddService {

	public String insertOrderList(JSONObject obj, String strDate) {
		
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		String date = orderDAO.insertOrderList(obj, strDate);
		
	
		commit(con);
	
		close(con);
		
		return date;
	}

	public void updateSequence() {
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		orderDAO.updateSequence();
		
		commit(con);
		
		close(con);	
		
	}


}
