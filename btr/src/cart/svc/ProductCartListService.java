package cart.svc;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import cart.dao.CartDAO;
import cart.vo.CartBean;
import common.vo.ActionForward;

import static common.db.JdbcUtil.*;

public class ProductCartListService {
	
	public static List<CartBean> getCartList() {
	System.out.println("ProductCartListService - getCartList()");
		
		ArrayList<CartBean> cartList = null;
		

		// DB 작업 준비 => Connection 객체, DAO 객체, DAO 객체의 메서드
		// 공통작업 1. Connection 객체
		Connection con = getConnection();
		
		// 공통작업 2. DB 작업을 위해 CartDAO 의 객체 생성 => 싱글톤 패턴으로 생성된 객체 가져오기
		CartDAO cdao = CartDAO.getInstance();
		
		// 공통작업 3. CartCAO 객체에 Connection 객체 전달
		cdao.setConnection(con);
		
		cartList = cdao.getList();
		
		close(con);
		
		return cartList;
	}



}
