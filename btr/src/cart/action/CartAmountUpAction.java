package cart.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.svc.CartAmountUpService;
import cart.vo.CartBean;
import common.action.Action;
import common.vo.ActionForward;
import product.vo.ProductBean;

public class CartAmountUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CartAmountUpAction");
		ActionForward forward = null;
		
		// 요청한 클라이언트의 세션 영역 객체 가져오기
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "nani");
				
		String id = (String)session.getAttribute("id"); 
		// id가 없으면 login 페이지로 돌아가기
		if(id == null) {
		forward.setRedirect(true);
		forward.setPath("MemberLogin.me");
		return forward;
		} 
		
		// 장바구니 이름 가져오기
		String p_name = request.getParameter("p_name");
		
		// 서비스
		CartAmountUpService cartAmountUpService = new CartAmountUpService();
		cartAmountUpService.upCart(p_name,request);
		
		forward = new ActionForward();
		// 포워딩 방식 지정
		forward.setRedirect(true);
		// 포워딩 주소
		forward.setPath("ProductCartList.ca");
		
		return forward;
	}

}
