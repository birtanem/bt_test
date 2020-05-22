package cart.svc;

import cart.dao.CartDAO;
import cart.vo.CartBean;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

public class ProductCartAddService {

	public boolean AddArticle(CartBean cb) {
		System.out.println("ProductCartAddService");
		
		boolean isWriteSuccess = false; // 장바구니 추가 성공여부
		
		// DB 작업 준비 => Connection 객체, DAO 객체, DAO 객체의 메서드
		// 공통작업 1. Connection 객체
		Connection con = getConnection(); // static import로 지정된 메서드 호출
		
		// 공통작업 2. DB 작업을 위해 BoardDAO의 객체 생성 => 싱글톤 패턴으로 생성된 객체 가져오기
		CartDAO cdao = CartDAO.getInstance();
		
		// 공통작업 3. CartCAO 객체에 Connection 객체 전달
		cdao.setConnection(con);
		
		// CartDAO 객체의 상품 중복체크 (있으면 1)
		// 중복이면 수량 update
		int check = cdao.checkProduct(cb);
		if (check != 1) { // 없으면(1이 아니면)
			cdao.cartAdd(cb);
			commit(con);
			isWriteSuccess = true; // 장바구니 추가 성공
		} else {
			rollback(con);
		}
		
		return isWriteSuccess;
	}



}
