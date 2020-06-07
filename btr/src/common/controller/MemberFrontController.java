package common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.dao.MemberDAO;
import common.vo.ActionForward;
import member.action.MemberJoinProAction;
import member.action.MemberLoginProAction;
import member.action.MemberLogoutProAction;
import member.vo.MemberBean;
import suggestion.action.SuggestionWriteFormAction;


/**
 * Servlet implementation class MemberJoinProc
 */
@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reqPro(request,response);
	}
	
	protected void reqPro(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		
		// POST 방식 한글 처리
			request.setCharacterEncoding("UTF-8");
				
		
			String command = request.getServletPath();
			
			System.out.println(command);
			
			//각 요청을 공통적으로 처리하기 위해 필요한 변수 선언
			Action action = null;
			ActionForward forward = null;
		
			//action 폼으로 이동
			//로그인 폼
			if(command.equals("/MemberLoginForm.me")) {
				
				forward = new ActionForward();
				forward.setPath("/member/LoginForm.jsp");
				
			}
			
			//회원가입 폼	
			else if(command.equals("/MemberJoinForm.me")) {
			
			forward = new ActionForward();
			forward.setPath("/member/JoinForm.jsp");
			
			//데이터가 입력되면 db에 쌓이고, (action?service?)
			//로그인화면 보여줘야 한다.
			
			}
			else if(command.equals("/MemberLoginPro.me")) {
				
				action = new MemberLoginProAction();

				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			
				
			}
			// action -> service & dao 확인으로 멤버 로그인 되었으면
			
			else if(command.equals("/MemberJoinPro.me")){
				
				action = new MemberJoinProAction();
				
				try {
					forward = action.execute(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			} 
			//민건 수정 로그아웃 시작
			else if(command.equals("/MemberLogout.me")) {
				
				action = new MemberLogoutProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//민건 수정 로그아웃 끝
			
	//		
		
		
			if(forward != null) {
				
			if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
			} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
					
				}
			}
		
		
		
		
	}
	
	

}