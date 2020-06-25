package admin.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import admin.dao.AdminDAO;


public class AdminLogActionService {

	public int geTtotalJoinCount() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int memberCount = adminDAO.getTotalJoinCount(); 
		
		close(con);
		
		return memberCount;
	}
	
	public int getTotalReadCount() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int placeCount = adminDAO.getTotalReadCount(); 
		
		close(con);
		
		return placeCount;
	}
	
	public long getTotalRevenue() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		long revenue = adminDAO.getTotalRevenue(); 
		
		close(con);
		
		return revenue;
	}

	public JSONArray getDailyLog() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		JSONArray jsonArray = adminDAO.getDailyLog(); 
		
		close(con);
		
		return jsonArray;
		
	}

	public int[] getTypeCount() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int[] typeArr = adminDAO.getTypeCount();
		
		close(con);
		
		return typeArr;
	}

}
