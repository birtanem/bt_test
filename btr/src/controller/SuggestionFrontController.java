package controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import suggestion_action.SuggestionWriteProAction;
import vo.*;

@WebServlet("*.su")
public class SuggestionFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println(command + "11");
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Suggestion_WriteForm.su")) {
			
			forward = new ActionForward();
			
			forward.setPath("/suggestion/suggestion_Write.jsp");
//-----------------------------------------------------------------------------------------------------------------			
		}else if(command.equals("/Suggestion_WritePro.su")) {
			
			action = new SuggestionWriteProAction(); //ddddddddd
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if (forward != null) {
			
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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
