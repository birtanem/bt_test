package member.svc;

import java.sql.Connection;
import static common.db.JdbcUtil.*;


import common.dao.MemberDAO;
import member.vo.JoinException;
import member.vo.MemberBean;

public class MemberJoinCheckService {

	public boolean duplicateIdCheck(String id) {
		System.out.println("MemberJoinCheckService - duplicateIdCheck()");
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean isDuplicateIdCheck = memberDAO.duplicateIdCheck(id);

		close(con);
		
		return isDuplicateIdCheck;
	}
	
	public boolean duplicateEmailCheck(String id) {
		System.out.println("MemberJoinProService - duplicateEmailCheckMember()");
		
		// 커넥션 생성
		Connection con = getConnection();
		// MeberDAO 생성
		MemberDAO memberDAO = MemberDAO.getInstance();
		// MemberDAO 커넥션 연결
		memberDAO.setConnection(con);
		
		boolean isDuplicateEmailCheck = memberDAO.duplicateEmailCheck(id);

		close(con);
		
		return isDuplicateEmailCheck;
	}
	
	public boolean duplicatePhoneCheck(String id) {
		System.out.println("MemberJoinProService - duplicatePhoneCheckMember()");
		
		// 커넥션 생성
		Connection con = getConnection();
		// MeberDAO 생성
		MemberDAO memberDAO = MemberDAO.getInstance();
		// MemberDAO 커넥션 연결
		memberDAO.setConnection(con);
		
		boolean isDuplicatePhoneCheck = memberDAO.duplicatePhoneCheck(id);

		close(con);
		
		return isDuplicatePhoneCheck;
	}
}
