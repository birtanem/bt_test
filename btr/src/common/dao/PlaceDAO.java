package common.dao;

import static common.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import place.vo.PlaceBean;

public class PlaceDAO {
	/*
	 * ------------ 싱글톤 디자인 패턴을 활용한 BoardDAO 인스턴스 작업 -------------
	 * 1. 외부에서 인스턴스 생성이 불가능하도록 private 접근제한자를 사용하여 생성자 정의
	 * 2. 직접 인스턴스를 생성하여 변수(instance)에 저장
	 * 3. 외부에서 인스턴스를 전달받을 수 있도록 Getter 메서드 정의
	 * 4. getInstance() 메서드에 인스턴스 생성없이 접근 가능하도록 static 메서드로 정의
	 *    => 메서드 내에서 접근하는 멤버변수 instance 도 static 변수로 정의
	 * 5. 인스턴스를 통해 instance 변수에 접근 불가능하도록 접근제한자 private 지정
	 */
	private PlaceDAO() {}
	
	private static PlaceDAO instance;

	public static PlaceDAO getInstance() {
		// BoardDAO 객체가 없을 경우에만 생성
		if(instance == null) {
			instance = new PlaceDAO();
		}
		
		return instance;
	}
	// ---------------------------------------------------------------------------------
	
	Connection con; // Connection 객체 전달받아 저장할 변수 선언
	
	// Service 클래스로부터 Connection 객체를 전달받는 메서드 setConnection() 정의
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 게시물 등록
		public int insertArticle(PlaceBean pb) {
			// Service 클래스로부터 BoardBean 객체를 전달받아 DB 에 INSERT 작업 수행
			// => 수행 결과 값으로 int형 insertCount 를 리턴받아 다시 Service 클래스로 리턴
			int insertCount = 0;
			
			// DB 작업에 필요한 변수 선언(Connection 객체는 이미 외부로부터 전달받음)
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				
				int num = 1; // 새 게시물 번호를 저장할 변수(초기값으로 초기번호 1번 설정)
				
				// 현재 게시물의 번호 중 가장 큰 번호(최대값)를 조회하여 다음 새 글 번호 결정(+1)
				String sql = "SELECT MAX(pl_num) FROM place"; // 최대값 조회 쿼리문
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { // 등록된 게시물이 하나라도 존재할 경우 게시물 번호 조회 성공
					// 조회된 번호 + 1 을 수행하여 새 글 번호로 저장
					num = rs.getInt(1) + 1;
				} 
				
				sql = "INSERT INTO place VALUES (?,?,?,?,?,?,?,?,now(),?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num); // 계산된 새 글 번호 사용
				pstmt.setInt(2, pb.getRegion_code());
				pstmt.setString(3, pb.getPl_name());
				pstmt.setString(4, pb.getPl_content());
				pstmt.setString(5, pb.getPl_address());
				pstmt.setString(6, pb.getPl_image());
				pstmt.setInt(7,0); //readCount
				pstmt.setInt(8, 0); // likeCount
				pstmt.setString(9, pb.getPl_theme()); 
			
				
				// INSERT 구문 실행 후 리턴되는 결과값을 insertCount 변수에 저장
				insertCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("PlaceDAO - insertArticle() 실패! : " + e.getMessage());
			} finally {
				// DB 자원 반환
				// => 주의! Connection 객체는 Service 클래스에서 별도로 사용해야하므로 닫으면 안됨!
//				JdbcUtil.close(rs);
//				JdbcUtil.close(pstmt);
				// => static import 기능을 사용하여 db.JdbcUtil 클래스 내의 모든 static 멤버 import
				close(rs);
				close(pstmt);
			}
			
			return insertCount;
		}
	
}
