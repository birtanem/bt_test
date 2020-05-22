package suggestion.action;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import common.action.*;
import common.vo.*;
import suggestion.svc.*;
import suggestion.vo.*;

public class SuggestionWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		System.out.println("SuggestionWriteProAction");
		
		SuggestionBean suggestionBean = new SuggestionBean(); //수정필요22222222222222
		
		suggestionBean.setId(request.getParameter("id"));
		suggestionBean.setEmail(request.getParameter("email"));
		suggestionBean.setSubject(request.getParameter("subject"));
		suggestionBean.setContent(request.getParameter("content"));
		SuggestionWriteProService suggestionWriteProService = new SuggestionWriteProService();
		
		boolean isWriteSucces = suggestionWriteProService.registSuggestion(suggestionBean);//수정필요22222222222222
		
		if (!isWriteSucces) {
			
			response.setContentType("text/html:charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>"); 
			out.println("alert('건의사항 등록 실패!')");
			out.println("history.back()"); 
			out.println("</script>"); 
			
		}else {
			System.out.println("건의사항 등록 성공");

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("Suggestion_WriteForm.su");
		}
		return forward;
	}
}
