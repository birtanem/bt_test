package member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberJoinProService;
import member.vo.MemberBean;


public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MemberJoinProAction");
		
		ActionForward forward =null;
		    	
		// 폼에서 입력받은 데이터  MemberBean 저장
		MemberBean memberBean = new MemberBean();

		
		memberBean.setId(request.getParameter("id"));
		memberBean.setPass(request.getParameter("pass"));
		memberBean.setName(request.getParameter("name"));
		memberBean.setAge(Integer.parseInt(request.getParameter("age")));
		memberBean.setGender(request.getParameter("gender"));
		memberBean.setEmail(request.getParameter("email"));
		memberBean.setPhone(request.getParameter("phone"));
		memberBean.setType(request.getParameter("type"));

		
		// 회원가입 서비스 MemberJoinProService 생성하고
		// 회원가입 처리할 registMember() 메서드 실행
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// dupCheck
		
		boolean isDuplicateIdCheck = memberJoinProService.duplicateIdCheck(request.getParameter("id"));
		
		if(!isDuplicateIdCheck) { 
			
			boolean isDuplicateEmailSuccess = memberJoinProService.duplicateEmailCheck(request.getParameter("email"));
			
			if(!isDuplicateEmailSuccess) {
				
				boolean isDuplicatePhoneSuccess = memberJoinProService.duplicatePhoneCheck(request.getParameter("phone"));
				
				if(!isDuplicatePhoneSuccess) {
					
					// 중복 없음
					// 회원가입 진행
					
					boolean isJoinSuccess = memberJoinProService.registMember(memberBean);
									
					if(!isJoinSuccess) { // 회원가입 실패
						

						out.println("0");
						
						
					}else { // 회원가입 성공
						
						// 회원가입 성공하면 바로 로그인처리
						
						request.setAttribute("id", request.getParameter("id"));
						request.setAttribute("pass", request.getParameter("passwd"));
						forward = new ActionForward();
//						forward.setRedirect(true);
						forward.setPath("MemberLoginPro.me");
					}
					
					
				}else { // phone 중복					
					out.println("phone");				
				}
				
			}else { // email 중복			
				out.println("email");
			}
			
		}else { // id 중복			
			out.println("id");						
		}  
		
        return forward;

	}

}
