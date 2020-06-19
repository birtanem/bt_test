package member.svc;

import static common.db.JdbcUtil.*;

import java.sql.*;
import java.util.*;

import member.dao.MemberDAO;
import member.vo.MemberBean;
import review.dao.ReviewDAO;
import review.vo.*;

public class MemberListService {

	public int getListCount(String id) {
		System.out.println("MemberListService - getListCount()");
		int listCount = 0;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		listCount = memberDAO.selectListCount(id);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<MemberBean> getMemberList(int page, int limit) {
		
		ArrayList<MemberBean> memberList = null;
		
		System.out.println("MemberListService -getMemberList()");
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		memberList = memberDAO.getMemberList(page,limit);
		
		close(con);
		
		return memberList;
	}
}
