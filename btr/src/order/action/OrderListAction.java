package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
import order.svc.OrderListService;
import order.vo.OrderBean;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderListAction");
		ActionForward forward = null;
		int total = 0;
		// 주문 리스트 가져오기
		
		HttpSession session = request.getSession();
		
		OrderListService orderListService = new OrderListService();
		
		ArrayList<OrderBean> list = orderListService.getOrderList((String)session.getAttribute("id"));
		
		System.out.println(list.size());
		
		for(int i=0;i<list.size();i++) {
			OrderBean ob = (OrderBean)list.get(i);
			total += ob.getO_sum_money();
		}

		request.setAttribute("list", list);
		request.setAttribute("total", total);
		
		forward = new ActionForward();
		
		forward.setPath("/order/order_list.jsp");
		
		return forward;
	}

}
