package member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberJoinCheckService;
import member.svc.MemberJoinProService;
import member.vo.MemberBean;


public class MemberJoinCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MemberJoinCheckAction");
		
		ActionForward forward =null;
		    	
		// 폼에서 입력받은 데이터  MemberBean 저장
		MemberBean memberBean = new MemberBean();

		
		memberBean.setId(request.getParameter("id"));
//		memberBean.setPass(request.getParameter("pass"));
//		memberBean.setName(request.getParameter("name"));
//		memberBean.setAge(Integer.parseInt(request.getParameter("age")));
//		memberBean.setGender(request.getParameter("gender"));
//		memberBean.setEmail(request.getParameter("email"));
//		memberBean.setPhone(request.getParameter("phone"));
//		memberBean.setType(request.getParameter("type"));

		
		// 회원가입 서비스 MemberJoinProService 생성하고
		// 회원가입 처리할 registMember() 메서드 실행
		MemberJoinCheckService memberJoinCheckService = new MemberJoinCheckService();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// dupCheck
		
		boolean isDuplicateIdCheck = memberJoinCheckService.duplicateIdCheck(request.getParameter("id"));
		
		if(!isDuplicateIdCheck) { //false 인 경우
			out.println(request.getParameter("id"));
		}else { // id 중복 true 인 경우
			out.println(1);						
		}  
		
        return forward;

	}

}
