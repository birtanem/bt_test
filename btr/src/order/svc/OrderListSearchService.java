package order.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import order.dao.OrderDAO;
import order.vo.OrderBean;
import product.vo.ProductBean;

public class OrderListSearchService {

	public ArrayList<OrderBean> getOrderSearchList(String id, String day, String day2) {
		
		System.out.println("OrderListSearchService");
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
			
		ArrayList<OrderBean> list = orderDAO.getOrderSearchList(id, day, day2);
		
		close(con);
		
		return list;
	}

}
