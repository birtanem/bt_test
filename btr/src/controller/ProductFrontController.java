package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ProductListAction;
import action.ProductRegistProAction;
import vo.ActionForward;

/**
 * Servlet implementation class ProductFrontController
 */
@WebServlet("*.bo")
public class ProductFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST 방식 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 서블릿 주소 가져오기
		String command = request.getServletPath();
		
		// 각 요청을 공통적으로 처리하기 위해 필요한 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/productRegistForm.bo")) { // 상품 등록을 보여줌
				// 등록 페이지는 비즈니스 로직이 필요 없다 => JSP 페이지로 바로 연결 수행
				// dispatcher 방식으로 설정(기본값 생략)
				forward = new ActionForward();
				forward.setPath("/product/product_registForm.jsp");
		} else if(command.equals("/productRegistPro.bo")){ // 상품 등록함
			try {
				System.out.println("상품 등록 프론트 컨트롤러");
				action = new ProductRegistProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		} else if(command.equals("/productList.bo")) {
			System.out.println("pl.bo");
			try {
				action=new ProductListAction();
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
					
		// 포워딩
		if(forward != null) {
		// ActionForward 객체 내의 포워딩 방식(Dispatcher or Redirect) 판별
		if(forward.isRedirect()) { // Redirect 방식
			// Redirect 방식으로 포워딩(주소표시줄 변경 O, request 객체가 공유되지 않음)
			// => response 객체의 sendRedirect() 메서드를 호출하여 포워딩 할 페이지 전달
			response.sendRedirect(forward.getPath());
		} else { // Dispatcher 방식
			// Dispatcher 방식으로 포워딩(주소표시줄 변경 X, request 객체가 공유됨)
			// => request 객체의 getRequestDispatcher() 메서드를 호출하여 포워딩 할 페이지 전달
			//    => RequestDispatcher 객체가 리턴됨
		    RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			// => RequestDispatcher 객체의 forward() 메서드를 호출하여 request, response 객체 전달
			dispatcher.forward(request, response);
		}
	}	
			
		
		}
		

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
}
