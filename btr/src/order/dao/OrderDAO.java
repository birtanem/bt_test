package order.dao;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import order.vo.OrderBean;
import product.vo.ProductBean;


public class OrderDAO {

private static OrderDAO instance;
	
	public OrderDAO() {}
	
	public static OrderDAO getInstance() {
		// CartDAO 객체가 없을 경우에만 생성
		if(instance==null) {
			instance=new OrderDAO();
		}
		return instance;
	}
	//-------------------------------------
	
	Connection con; // Connection 객체 전달받아서 저장할 변수 선언
	
	// Service 클래스로부터 Conncetion 객체를 전달받는 메서드 setConnection() 정의
	public void setConnection(Connection con) {
		this.con = con;
	}

	public ProductBean selectOrderList(JSONObject obj) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductBean pb = null;
		System.out.println(obj.get("num"));
		
		try {
			String sql = "select * from cart c join product p on c.c_p_num = p.p_num where p.p_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt((String)obj.get("num")));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				pb = new ProductBean();
				pb.setP_num(rs.getInt("p_num"));
				pb.setP_name(rs.getString("p_name"));
				pb.setP_content(rs.getString("p_content"));
				pb.setP_image(rs.getString("p_image"));
				pb.setP_price(Integer.parseInt((String)obj.get("price")));
				pb.setP_amount(Integer.parseInt((String)obj.get("amount")));
				pb.setP_category(rs.getString("p_category"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			close(rs);
			close(pstmt);		
		}
					
		return pb;
	}

	public String insertOrderList(JSONObject obj, String strDate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		String num = "";
		String orderNum = null;
		
		try {
			String sql = "SELECT LPAD(MAX(num),4,0) num FROM order_seq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getString(1);
			}
			
			orderNum = strDate + num;
			
			sql = "INSERT INTO o_order(o_num, o_status, o_p_num, o_p_name, o_p_amount, o_sum_money, o_date) VALUES(6,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderNum);
			pstmt.setInt(2, Integer.parseInt((String)obj.get("num")));
			pstmt.setString(3,String.valueOf(obj.get("name")));
			pstmt.setInt(4, Integer.parseInt((String)obj.get("amount")));
			pstmt.setInt(5, Integer.parseInt((String)obj.get("price")));
			
			insertCount = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return orderNum;
		
	}

	public void updateSequence() {
		PreparedStatement pstmt = null;
			
		try {
			String sql = "INSERT INTO order_seq VALUES(null)";
			pstmt = con.prepareStatement(sql);
			System.out.println(pstmt.executeUpdate());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	
	}

//	public ArrayList<OrderBean> getOrderList(String id) {
//		
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<OrderBean> list = new ArrayList<OrderBean>();
//
//		try {
//			// 상품테이블이랑 조인해서 이미지 가져와야됨
//			String sql = "SELECT * FROM o_order WHERE o_m_id = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				
//				OrderBean ob = new OrderBean();
//				ob.setO_status(rs.getLong("o_status"));
//				ob.setO_p_name(rs.getString("o_p_name"));
//				ob.setO_p_amount(rs.getInt("o_p_amount"));
//				ob.setO_sum_money(rs.getInt("o_sum_money"));
//				ob.setDate(rs.getDate("o_date"));
//				list.add(ob);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {			
//			close(rs);
//			close(pstmt);		
//		}
//					
//		return list;
//	}
	
	public ArrayList<OrderBean> getOrderList(String id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderBean> list = new ArrayList<OrderBean>();

		try {
			// 상품테이블이랑 조인해서 이미지 가져와야됨
			String sql = "SELECT * FROM o_order2 WHERE o_m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderBean ob = new OrderBean();
				ob.setO_status(rs.getLong("o_status"));
				ob.setO_p_name(rs.getString("o_p_name"));
				ob.setO_p_amount(rs.getInt("o_p_amount"));
				ob.setO_sum_money(rs.getInt("o_sum_money"));
				ob.setDate(rs.getDate("o_date"));
				list.add(ob);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			close(rs);
			close(pstmt);		
		}
					
		return list;
	}


//	public ArrayList<OrderBean> getOrderSearchList(String id, String date) {
//		
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<OrderBean> list = new ArrayList<OrderBean>();
//
//		try {
//
//			String sql = "SELECT * FROM o_order WHERE o_m_id = ? AND o_date BETWEEN date(now()) AND date(?)+1";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, date);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				
//				OrderBean ob = new OrderBean();
//				ob.setO_status(rs.getLong("o_status"));
//				ob.setO_p_name(rs.getString("o_p_name"));
//				ob.setO_p_amount(rs.getInt("o_p_amount"));
//				ob.setO_sum_money(rs.getInt("o_sum_money"));
//				ob.setDate(rs.getDate("o_date"));
//				list.add(ob);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {			
//			close(rs);
//			close(pstmt);		
//		}
//					
//		return list;
//	}

	public ArrayList<OrderBean> getOrderSearchList(String id, String day) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrderBean> list = new ArrayList<OrderBean>();

		try {

			String sql = "SELECT * FROM o_order2 WHERE o_m_id = ? AND o_date BETWEEN date(?) AND date(now())+1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, day);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderBean ob = new OrderBean();
				ob.setO_status(rs.getLong("o_status"));
				ob.setO_p_name(rs.getString("o_p_name"));
				ob.setO_p_amount(rs.getInt("o_p_amount"));
				ob.setO_sum_money(rs.getInt("o_sum_money"));
				ob.setDate(rs.getDate("o_date"));
				list.add(ob);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			close(rs);
			close(pstmt);		
		}
					
		return list;
	}
	
	
	
	
} // 클래스 끝
 