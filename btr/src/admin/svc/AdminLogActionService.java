package admin.svc;

import static common.db.JdbcUtil.close;
import static common.db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import admin.dao.AdminDAO;


public class AdminLogActionService {

	public int getMemberCount() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int memberCount = adminDAO.getMemberCount(); 
		
		close(con);
		
		return memberCount;
	}
	
	public int getBoardCount() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		int placeCount = adminDAO.getPlaceCount(); 
		
		close(con);
		
		return placeCount;
	}
	
	public long getRevenue() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		long revenue = adminDAO.getRevenue(); 
		
		close(con);
		
		return revenue;
	}

	public JSONArray getRevenueLog() {
		
		System.out.println("AdminLogActionService");
		
		Connection con = getConnection();
		
		AdminDAO adminDAO = AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		JSONArray jsonArray = adminDAO.getRevenueLog(); 
		
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
