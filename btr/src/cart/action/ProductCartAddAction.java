package cart.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import cart.dao.CartDAO;
import cart.svc.ProductCartAddService;
import cart.vo.CartBean;
import vo.ActionForward;

public class ProductCartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductCartAddAction");
		
		// 리턴 잊지 않도록 미리 선언 해주기
		ActionForward forward = null;
		
		// 장바구니 하나의 데이터를 저장할 CartBean 객체 생성
		CartBean cb = new CartBean();
		
		// 자바빈 저장
		cb.setC_p_num(Integer.parseInt(request.getParameter("p_num")));
		cb.setC_p_amount(Integer.parseInt(request.getParameter("p_mount")));
//		cb.setC_member_id(id); // 멤버 생성되면 추가해주기
		
		// ProductCartAddService 클래스 생성
		// AddArticle() 메서드 호출하여 추가 요청하기
		// 파라미터 : CartBean 객체, 리턴타입 boolean
		ProductCartAddService productCartAddService = new ProductCartAddService();
		boolean isAddSuccess = productCartAddService.AddArticle(cb);
		
		// 리턴 받아서 장바구니 추가 판별
		if(!isAddSuccess) {
		
			// response 객체를 사용하여 문서 타입 및 인코딩 설정
		response.setContentType("text/html;charset=UTF-8");
		// getWriter() 메서드 호출
		PrintWriter out = response.getWriter();	
		
		out.println("<script>");
		out.println("alert('장바구니 추가가 실패되었습니다.')");
		out.println("hilstory.back()");
		out.println("</script>");
	} else {
		System.out.println("장바구니에 추가되었습니다");
		// 현재에서 CartList.bo 서블릿을 요청하여 Redirect 방식 포워딩
		forward = new ActionForward();
		// 포워딩 방식 지정
		forward.setRedirect(true);
		// 포워딩 주소
		forward.setPath("CartList.bo");
	}
		
		return forward;
	}

}
