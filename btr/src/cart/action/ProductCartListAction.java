package cart.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.svc.ProductCartListService;
import cart.vo.CartBean;
import common.action.Action;
import common.vo.ActionForward;

public class ProductCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductCartListAction");
		
		ActionForward forward = null;
		
		// 요청한 클라이언트의 세션 영역 객체 가져오기
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("id"); // ==> 로그인 완료되면 추가하기 !!
//		// id가 없으면 login 페이지로 돌아가기
//		if(id == null) {
//			forward.setRedirect(true);
//			forward.setPath("MemberLogin.me");
//			return forward;
//		}
		
		// 장바구니 리스트
		List<CartBean> cartList = ProductCartListService.getCartList();
		
		
		// 서비스 생성
		ProductCartListService productCartListService = new ProductCartListService();
		
		// 총 금액 계산 => CartBean에 price 추가한 뒤 수정하기
//		int totalMoney = 0;
//		int money = 0;
//		
//		for(int i = 0; i < cartList.size(); i++) {
//			money = cartList.get(i).get
//		}
		
		
		// 장바구니 목록을 request 영역에 공유하기
		request.setAttribute("cartList", cartList);		
		
		// 디스패쳐 방식으로 이동 
		forward.setPath("/product/cartList.jsp");
		
		
		return forward;
	}

}
