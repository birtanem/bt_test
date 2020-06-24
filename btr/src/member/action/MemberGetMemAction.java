package member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberJoinCheckService;
import member.svc.MemberJoinProService;
import member.svc.MemberListService;
import member.vo.MemberBean;


public class MemberGetMemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberGetMemAction");
		
		ActionForward forward =null;
		String type = null;
		boolean idSearch = false;
		
		if(request.getParameter("id") != null) {
			
			type = request.getParameter("id");
			idSearch = true;
		}
//		String email = request.getParameter("email");
//		String phone = request.getParameter("phone");
		System.out.println(type);
//		System.out.println(email);
//		System.out.println(phone);

		
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		MemberListService memberListService = new MemberListService();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int page = 1;
		int limit = 10;
		
		memberList = memberListService.getMemberList(page, limit, type, idSearch);
		
//		// dupCheck
//		boolean isDuplicateCheck = false;
//		
//		if(request.getParameter("id") != null) {
//			isDuplicateCheck = memberJoinCheckService.duplicateIdCheck(id);
//		} 
//		
//		if (request.getParameter("email") != null) {
//			isDuplicateCheck = memberJoinCheckService.duplicateEmailCheck(email);
//		} 
//		
//		if (request.getParameter("phone") != null) {
//			isDuplicateCheck = memberJoinCheckService.duplicatePhoneCheck(phone);
//		}
//
//		if(!isDuplicateCheck) { //false 인 경우
////			out.println(request.getParameter("id"));
//			out.println(0);
//		}else { // id 중복 true 인 경우
//			out.println(1);						
//		}  
		
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < memberList.size(); i++) {
			
			JSONObject jObject = new JSONObject();
//			jObject.put("get_id", memberList.get(i).getId());
//			jObject.put("rc_date", memberList.get(i).getEmail());
//			jObject.put("rc_num", memberList.get(i).getGender());
//			jsonArray.add(jObject);
			
			jObject.put("get_id", memberList.get(i).getId());
			jObject.put("get_name", memberList.get(i).getName());
			jObject.put("get_age", memberList.get(i).getAge());
			jObject.put("get_gender", memberList.get(i).getGender());
			jObject.put("get_email", memberList.get(i).getEmail());
			jObject.put("get_phone", memberList.get(i).getPhone());
			jObject.put("get_date", memberList.get(i).getDate()+"");
			jObject.put("get_point", memberList.get(i).getPoint());
			jObject.put("get_type", memberList.get(i).getType());
			jsonArray.add(jObject);
		}
		
		out.print(jsonArray);
		System.out.println(jsonArray);
	
		
        return forward;

	}

}
