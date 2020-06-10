package order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.dao.CartDAO;
import common.action.Action;
import common.vo.ActionForward;
import order.vo.OrderBean;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAddAction");
		
		// 리턴 잊지 않도록 미리 선언 해주기
		ActionForward forward = null;
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		// 요청한 클라이언트의 세션 영역 객체 가져오기
		HttpSession session = request.getSession();
				
//		session.setAttribute("id", "nani");
						
		String id = (String)session.getAttribute("id"); 
		// id가 없으면 login 페이지로 돌아가기
		if(id == null) {
		forward.setRedirect(true);
		forward.setPath("MemberLogin.me");
		return forward;
		} 
		
		// OrderBean 객체 생성 ob
		OrderBean ob = new OrderBean();
		ob.setO_m_id(id);
		ob.setO_memo(request.getParameter("o_memo"));
		ob.setO_recieve_addr1(request.getParameter("o_receive_addr1"));
		ob.setO_recieve_addr2(request.getParameter("o_recieve_addr2"));
		ob.setO_recieve_phone(request.getParameter("o_recieve_phone"));
		ob.setO_recieve_name(request.getParameter("o_receive_name"));
		ob.setO_trade_type(request.getParameter("온라인 결제"));
		// 장바구니 디비 객체
		CartDAO cdao = new CartDAO();
		
		Vector vector = cdao.getList(id);
		
		List cartList = (List)vector.get(0);
		
		List productList = (List)vector.get(1);
		
		// 결제 API
		
		// 이동
		
		
		
		
		
		return forward;
	}

}
