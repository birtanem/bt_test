package order.action;



import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



import common.action.Action;
import common.vo.ActionForward;
import order.svc.OrderAddService;
import order.vo.OrderBean;



public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAddAction");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 리턴 잊지 않도록 미리 선언 해주기
		ActionForward forward = null;
		// insert 성공 여부 판별 변수선언
		boolean insertSuccess = false;
		
		JSONParser parser = new JSONParser();
		JSONArray jsonObj = (JSONArray)parser.parse(request.getParameter("jsonData"));
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMdd");
		
		Date date = new Date();
		
		String strDate = sdf.format(date);
		
		HttpSession session = request.getSession();
		
		OrderBean ob = new OrderBean();
		
		ob.setMember_id((String)session.getAttribute("id"));
		ob.setO_price(Integer.parseInt(request.getParameter("total")));
		ob.setO_pay(request.getParameter("pay"));
		ob.setO_num(Integer.parseInt(strDate));
		
				
		OrderAddService orderAddService = new OrderAddService();
		
		String orderNum = orderAddService.insertOrderList(ob, jsonObj.size()); // Bean 객체, 주문번호 하나에 따른 상품 종류 수
		
		orderAddService.updateSequence();

		insertSuccess =  orderAddService.insertOrderDetailList(jsonObj, orderNum);

				
		if(insertSuccess) {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('결제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		// 결제상품 수량 빼기
		boolean updateSuccess = orderAddService.updateProductAmount(jsonObj);
		
		if(!updateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수량 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		//  구매금액 1퍼 적립
		int point = (int)(ob.getO_price()*0.01);
		
		boolean saveSuccess = orderAddService.savePoint((String)session.getAttribute("id"), point);
		
		if(!saveSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('포인트 적립 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		// 주문번호 계산을 위해 num 에 오늘날짜 저장되어있음
		System.out.println(ob.getO_num());
		session.setAttribute("orderNum", orderNum);
		session.setAttribute("ob", ob);

		return forward;
	}

}
