package order.vo;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONObject;

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
	
	
	
} // 클래스 끝
 