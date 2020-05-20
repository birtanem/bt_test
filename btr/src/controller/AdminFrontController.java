package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin_action.adminProductAction;
import vo.ActionForward;


@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("서블릿 확인:"+command);
		Action action =null;
		ActionForward forward=null;
		
		if(command.equals("/adminPage.ad")) {
			forward=new ActionForward();
			forward.setPath("/admin/adminPage.jsp");
		}else if(command.equals("/adminProduct.ad")) {
			try {
				action=new adminProductAction();
				
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if(forward !=null ) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
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
