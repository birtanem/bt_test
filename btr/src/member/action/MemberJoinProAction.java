package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.action.Action;
import common.dao.MemberDAO;
import common.vo.ActionForward;
import member.svc.MemberJoinProService;
import member.vo.JoinException;
import member.vo.MemberBean;


public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MemberJoinProAction");
		
		ActionForward forward =null;
		
	    String id = request.getParameter("id");
	    
	      
		
		MemberBean bean = null;
		
		
		MemberDAO mdao = null;
		
		mdao.insertMember(bean);
		
		
		MemberJoinProService mjps = new MemberJoinProService();
		
		// 회원가입 요청을 위한 isJoinMember() 메서드 호출 (어디서부터?)
		
		
		try {
			
			boolean isMember = mjps.isJoinMember(id);
			

			// 
			if(isMember) {
				
				// 아이디 있는지 확인 
				// => request 객체로부터 HttpSession 객체 가져와서 setAttribute() 호출하여 저장
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./");
				
			}
			
			
			
			
			
		} catch (JoinException e) {
			
			// LoginException 예외가 발생하여 전달되면 catch 구문 실행됨
			// => 전달받은 예외 객체의 메세지를 자바스크립트로 출력하면
			//    로그인 실패에 대한 결과 메세지 출력 구분 가능
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 실패! - "+e.getMessage() +"')");
			out.println("history.back()");
			out.println("</script>");
		}		
        
        
        
      
        
        return forward;
        
        
        
    
	

	}

}
