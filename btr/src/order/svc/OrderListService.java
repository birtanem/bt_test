package order.svc;

import common.db.JdbcUtil.*;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import order.dao.OrderDAO;
import order.vo.OrderBean;
import product.vo.ProductBean;

public class OrderListService {

	public ArrayList<OrderBean> getOrderList(String id) {
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);

		ArrayList<OrderBean> list = orderDAO.getOrderList(id);
				
		close(con);
		
		return list;
	}

	
}
