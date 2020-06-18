package order.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.action.Action;
import common.vo.ActionForward;
import order.svc.OrderListSearchService;
import order.vo.OrderBean;

public class OrderListSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderListSearchAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance( );
		
		int betweenDay = Integer.parseInt(request.getParameter("betweenDay"));
		

		if(betweenDay == -1 || betweenDay == -3 || betweenDay == -6 ) {
			betweenDay *= -1;
			cal.add (Calendar.MONTH, - betweenDay); // 이전 달
			
		}else {
			cal.add (Calendar.DAY_OF_MONTH, - betweenDay); // 이전 일
		}
				
		String day = sdf.format(cal.getTime());
		
		System.out.println(day);
		
		OrderListSearchService  orderListSearchService = new OrderListSearchService();
		
		ArrayList<OrderBean> list = orderListSearchService.getOrderSearchList((String)session.getAttribute("id"), day);

		System.out.println("사이즈:"+list.size());
		
		JSONArray result = new JSONArray();

	
		for(int i=0;i<list.size();i++) {
			
			OrderBean ob = (OrderBean)list.get(i);
			JSONObject obj = new JSONObject();
			
			obj.put("orderNum", ob.getO_status());
			obj.put("name", ob.getO_p_name());
			obj.put("amount", ob.getO_p_amount());
			obj.put("price", ob.getO_sum_money());
			obj.put("date", ob.getDate()+"");
			result.add(obj);
		}
		
		
		System.out.println(result);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	
		return forward;
	}

}
