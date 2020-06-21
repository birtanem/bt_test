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
		
		int updateCount =  orderDAO.updateSavePoint(id, point);
		
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
	public boolean updateProductAmount(JSONArray jsonObj) {
		
		boolean updateSuccess = false;
		
		Connection con = getConnection();
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		orderDAO.setConnection(con);
		
		for(int i=0;i<jsonObj.size();i++) {
			JSONObject obj = (JSONObject)jsonObj.get(i);
			int updateCount = orderDAO.updateProduntAmount(Integer.parseInt((String)obj.get("num")), Integer.parseInt((String)obj.get("amount")));
			if(updateCount > 0) {
				updateSuccess = true;
			}else {
				rollback(con);
				updateSuccess = false;
				break;
			}
		}	
		commit(con);
		
		close(con);	
		return updateSuccess;
	}


}
