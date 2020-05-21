package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cart.vo.CartBean;
import static db.JdbcUtil.*;

public class CartDAO {
	
	private static CartDAO instance;
	
	private CartDAO() {}
	
	public static CartDAO getInstance() {
		// CartDAO 객체가 없을 경우에만 생성
		if(instance==null) {
			instance=new CartDAO();
		}
		return instance;
	}
	//-------------------------------------
	
	Connection con; // Connection 객체 전달받아서 저장할 변수 선언
	
	// Service 클래스로부터 Conncetion 객체를 전달받는 메서드 setConnection() 정의
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 장바구니 중복 확인
	public int checkProduct(CartBean cb) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;
		
		try { // 멤버 아이디와 상품명이 중복되는 상품 확인하기
			String sql = "select * from cart where c_member_id=? and c_p_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cb.getC_member_id());
			pstmt.setInt(2, cb.getC_p_num());
			// rs 실행
			rs=pstmt.executeQuery();
			
			// 데이터가 있으면 check = 1
			// c_m_id와 c_p_num
			// c_amount 업데이트 
			if(rs.next()) {
				check = 1;
				sql = "update cart set c_p_amount = c_p_amount+? where c_m_id=? and c_p_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cb.getC_p_amount());
				pstmt.setString(2, cb.getC_member_id());
				pstmt.setInt(3, cb.getC_p_num());
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("CartDAO - checkProduct() 실패 ! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return check;
	} // 장바구니 중복 확인 메서드 끝

	// 장바구니 추가
	public void cartAdd(CartBean cb) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int c_num = 0;
		
		try {
			// 장바구니 max num 구하기
			String sql = "select max(c_num) from cart";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				c_num = rs.getInt(1)+1;
			} else {
				c_num = 1;
			}
			// 장바구니 추가
			sql = "insert into cart values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_num);
			pstmt.setString(2, cb.getC_member_id());
			pstmt.setInt(3, cb.getC_p_num());
			pstmt.setInt(4, cb.getC_p_amount());
			
		} catch (SQLException e) {
			System.out.println("CartDAO - cartAdd() 실패 ! : " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
	} // 장바구니 추가 메서드 끝


	
}// 클래스 끝
