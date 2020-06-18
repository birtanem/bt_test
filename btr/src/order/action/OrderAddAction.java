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



public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderAddAction");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// 리턴 잊지 않도록 미리 선언 해주기
		ActionForward forward = null;
		boolean insertSuccess = false;
		
		
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMdd");
		
		Date date = new Date();
		
		String strDate = sdf.format(date);
		
		String strDate2 = null;
		
		
		JSONParser parser = new JSONParser();
		JSONArray jsonObj = (JSONArray)parser.parse(request.getParameter("jsonData"));
		
		OrderAddService orderAddService = new OrderAddService();
		
		for(int i=0;i<jsonObj.size();i++) {
			JSONObject obj = (JSONObject)jsonObj.get(i);

			 strDate2 = orderAddService.insertOrderList(obj, strDate);
			
		}
		
		orderAddService.updateSequence();
		
		if(insertSuccess) {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('결제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("orderNum", strDate2);

	
		
		// 결제 API
		
		// 이동

		return forward;
	}

}
