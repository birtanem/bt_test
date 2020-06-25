package member.svc;

import static common.db.JdbcUtil.*;

import java.sql.*;
import java.util.*;

import member.dao.MemberDAO;
import member.vo.MemberBean;
import review.dao.ReviewDAO;
import review.vo.*;

public class MemberListService {

	public int memberListCount() {
		System.out.println("MemberListService - memberListCount()");
		int listCount = 0;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		listCount = memberDAO.memberListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<MemberBean> getMemberList(int page, int limit, String type, boolean idSearch, boolean pointChange, int cPoint) {
		ArrayList<MemberBean> memberList = null;
		
		System.out.println("MemberListService -getMemberList()");
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		if(idSearch) {
			memberList = memberDAO.getMemberListIdSearch(page,limit,type);
		} else if(pointChange){
			memberDAO.memPointChange(type,cPoint);
			commit(con);
			
			memberList = memberDAO.getMemberListIdSearch(page,limit,type);
		} else {
			memberList = memberDAO.getMemberList(page,limit,type);
		}

		close(con);
		
		return memberList;
	}
	
}
