package member.svc;

import java.sql.Connection;
import static common.db.JdbcUtil.*;


import common.dao.MemberDAO;
import member.vo.JoinException;

public class MemberJoinProService {

	public boolean isJoinMember(String id) throws Exception {
		// TODO Auto-generated method stub
		boolean isMember = false;
		
		
		//서비스의 기본작업?? 
		//커넥션, dao 가져오고  전달하고?
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		
		
		//member가 있는지 기존에 확인
	
		isMember = memberDAO.selectJoinMember(id);
		
		
		
		
		
		
		
		
		close(con);
		
		return isMember;
		
		
		
		
		
		
		
		
		
	}

	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
}
