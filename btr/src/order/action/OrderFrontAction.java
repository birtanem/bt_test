package order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberMypageFormService;
import member.vo.MemberBean;
import order.svc.OrderFrontService;
import product.vo.ProductBean;
public class OrderFrontAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("OrderFrontAction");

				
		// 상품번호(num), 수량(amount), 합계(price) 를 JSON 형태로 가져와서 파싱
		JSONParser parser = new JSONParser();
		JSONArray jsonObj = (JSONArray)parser.parse(request.getParameter("jsonData"));
		
		
		
		OrderFrontService orderFrontService = new OrderFrontService();
		
		ArrayList<ProductBean> arrayList = new ArrayList<ProductBean>();
		
		
		for(int i=0;i<jsonObj.size();i++) {
			JSONObject obj = (JSONObject)jsonObj.get(i);
			arrayList.add(orderFrontService.selectOrderList(obj));
		}
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); 
		// id가 없으면 login 페이지로 돌아가기
		if(id == null) {
		forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("MemberLogin.me");
		return forward;
		} 
		
	
		MemberMypageFormService memberMypageFormService = new MemberMypageFormService();
		MemberBean mb = memberMypageFormService.getMemberInfo((String)session.getAttribute("id"));
		System.out.println(mb.getId());
		session.setAttribute("arrayList", arrayList);
		session.setAttribute("info", mb);

		return forward;
	}

}
