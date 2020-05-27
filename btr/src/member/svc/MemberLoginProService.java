package member.svc;

import static common.db.JdbcUtil.*;


import java.sql.Connection;

import javax.security.auth.login.LoginException;

import common.dao.MemberDAO;

public class MemberLoginProService {

	public boolean isLoginMember(String id, String pass) throws LoginException {
		// TODO Auto-generated method stu
		
		System.out.println("MemberLoginProService");
		boolean isMember = false;
		
		
		//서비스의 기본작업?? 
		//커넥션, dao 가져오고  전달하고?
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		
		
		// MemberDAO 클래스의 selectLoginMember() 메서드를 호출하여 로그인 수행
		// => 파라미터 : 아이디, 패스워드    리턴타입 boolean(isMember)
	
		isMember = memberDAO.selectLoginMember(id, pass);
		
		
		
		
		
		
		
		close(con);
		
		return isMember;
		
		
		
		
		
		
		
		
		
	}



}
