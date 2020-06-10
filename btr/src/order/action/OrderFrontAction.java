package order.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.vo.ActionForward;
public class OrderFrontAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderFrontAction");

		// 리턴 잊지 않도록 미리 선언 해주기
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
		
		
		
		return null;
	}

}
