package order.svc;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import order.dao.OrderDAO;
import order.vo.OrderBean;
import order.vo.OrderDetailBean;

public class OrderAddService {

	public String insertOrderList(OrderBean ob, int amount) {
		
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		String date = orderDAO.insertOrderList(ob, amount);
		
		commit(con);
	
		close(con);
		System.out.println("머킷");
		return date;
	}
	public boolean insertOrderDetailList(JSONArray jsonObj, String oderNum) {
		
		boolean InsertSuccess = false;
		int insertCount = 0;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		for(int i=0;i<jsonObj.size();i++) {
			
			JSONObject obj = (JSONObject)jsonObj.get(i);

			insertCount = orderDAO.insertOrderDetailList(obj, oderNum);
			
			if(insertCount > 0) {
				InsertSuccess = true;
			}else {
				InsertSuccess = false;
				break;
			}
		}
				
		if(InsertSuccess) {
			
			commit(con);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return InsertSuccess;
	}
	
	public boolean savePoint(String id, int point) {
		
		boolean saveSuccess = false;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		int updateCount =  orderDAO.updateSavePonint(id, point);
		
		if(updateCount > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);	
		
		return saveSuccess;
		
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
