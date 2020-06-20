package order.svc;

import common.db.JdbcUtil.*;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;

import order.dao.OrderDAO;
import order.vo.OrderBean;
import product.vo.ProductBean;
import review.dao.ReviewDAO;

public class OrderListService {

	public JSONArray getOrderList(String id, int page, int limit) {
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);

		JSONArray jsonArray = orderDAO.getOrderList(id, page, limit);
				
		close(con);
		
		return jsonArray;
	}
	
	public int getOrderListCount(String id) {
	
		int listCount = 0;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		listCount = orderDAO.getListCount(id);
		
		close(con);
		
		return listCount;
	}

	
}
