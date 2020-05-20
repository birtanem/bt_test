package suggestion_action;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import action.*;
import suggestion_svc.*;
import vo.*;

public class SuggestionWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		System.out.println("SuggestionWriteProAction");
		
		ReviewBean reviewBean = new ReviewBean(); //수정필요22222222222222
		
		reviewBean.setSubject(request.getParameter("subject"));//수정필요22222222222222
		reviewBean.setContent(request.getParameter("content"));//수정필요22222222222222
		
		SuggestionWriteProService suggestionWriteProService = new SuggestionWriteProService();
		
		boolean isWriteSucces = suggestionWriteProService.registArticle(reviewBean);//수정필요22222222222222
		
		if (!isWriteSucces) {
			
			response.setContentType("text/html:charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>"); 
			out.println("alert('글 등록 실패!')");
			out.println("history.back()"); 
			out.println("</script>"); 
			
		}else {
			System.out.println("글 등록 성공");

			forward = new ActionForward();
			
			forward.setRedirect(true);
			
			forward.setPath("Suggestion_WriteForm.re.re");
		}
		
		return forward;
	}

}
