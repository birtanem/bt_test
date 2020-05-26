package cart.svc;

import cart.dao.CartDAO;
import cart.vo.CartBean;

import static common.db.JdbcUtil.*;

import java.sql.Connection;

public class ProductCartAddService {

	public boolean AddArticle(CartBean cb) {
		System.out.println("ProductCartAddService");
		
		boolean isAddSuccess = false; // 장바구니 추가 성공여부
		
		// DB 작업 준비 => Connection 객체, DAO 객체, DAO 객체의 메서드
		// 공통작업 1. Connection 객체
		Connection con = getConnection(); // static import로 지정된 메서드 호출
		
		// 공통작업 2. DB 작업을 위해CartDAO의 객체 생성 => 싱글톤 패턴으로 생성된 객체 가져오기
		CartDAO cdao = CartDAO.getInstance();
		
		// 공통작업 3. CartCAO 객체에 Connection 객체 전달
		cdao.setConnection(con);
		

		// CartDAO 객체의 cartAdd() 메서드 호출하여 장바구니 추가 처리
		// => 파라미터 CartBean 객체, 리턴타입 int(insertCount)
		int insertCount = cdao.cartAdd(cb);

		
		// 리턴받은 작업 결과 판별
		if(insertCount > 0) {
			commit(con);
			isAddSuccess = true;
		} else {
			rollback(con);
		}
			
	
		close(con);
	
		return isAddSuccess;
	}



}
