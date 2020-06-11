package order.vo;

import static common.db.JdbcUtil.*;

import java.sql.Connection;


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
	
	
	
} // 클래스 끝
 