package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;


import member.vo.JoinException;
import member.vo.MemberBean;

import static common.db.JdbcUtil.*;

public class MemberDAO {
	
		public MemberDAO() {}
		
		private static MemberDAO instance;
		
//		private Connection getConnection() throws Exception{
//			// 예외처리를 메서드호출한 곳에서 처리하겠다
//			
////			// 1단계 드라이버로더
////			 Class.forName("com.mysql.jdbc.Driver");
////			 // 2단계 디비연결
////			 String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
////			 String dbUser="jspid";
////			 String dbPass="jsppass";
////			 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
////			 return con;
//			
//			Context init=new InitialContext();
//			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
//			Connection con=(Connection) ds.getConnection();
//			return con;
//		}
		
		public static MemberDAO getInstance() {
			// BoardDAO 객체가 없을 경우에만 생성
			if(instance == null) {
				instance = new MemberDAO();
			}	
			return instance;
		}
		
	
		Connection con;
		
		public void setConnection(Connection con) {
			this.con = con;
			
		}
		public int insertMember(MemberBean memberBean) {
			
			PreparedStatement pstmt = null;
			int insertCount = 0;
			
			try {
							
				String sql = "insert into member(id,pass,name,age,gender,email,phone,date,point,type,cp_3,cp_5,cp_10) values(?,?,?,?,?,?,?,now(),0,?,0,0,0)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,memberBean.getId());
				pstmt.setString(2,memberBean.getPass());
				pstmt.setString(3,memberBean.getName());
				pstmt.setInt(4,memberBean.getAge());
				pstmt.setString(5,memberBean.getGender());
				pstmt.setString(6,memberBean.getEmail());
				pstmt.setString(7,memberBean.getPhone());
				pstmt.setString(8,memberBean.getType());

				insertCount = pstmt.executeUpdate();
				
			}catch(Exception e) {
				
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
			return insertCount;
			
		}

		public int selectLoginMember(String id, String pass) {
			// TODO Auto-generated method stub
			
			int loginResult = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//false라면 나오고
			//true라면 메인페이지로 이동
			
			//아이디에 해당하는 패스워드 존재여부
			//_db에서 확인해야한다. 
			// 1. 아이디와 패스워드가 일치하는 레코드 검색.
			
		    //_ 비교대상필요
		
				//  1. 아이디와 패스워드가 일치하는 레코드 검색
				// => 아이디, 패스워드 중 틀린 항목에 대한 구분이 불가능
				
				// 2. 아이디에 해당하는 패스워드 검색
				// String sql = "Select pass from member where =id? ";
				// 이렇게 하면 id가 맞아면 pass만 확인하면 되고 아예 id조차틀린경우
				// 아이디만 바로 판별가능
				
				

				
				try {
					
					String sql = "SELECT pass FROM member WHERE id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) { // 아이디가 존재하는 경우(패스워드가 조회되는 경우)
						// 패스워드 일치 여부 판별
						if(pass.equals(rs.getString(1))) { // 패스워드가 일치할 경우
							loginResult = 1;
						}else {
							loginResult = -1;
						}
						
					}
				
				} catch (SQLException e) { //조심해야하는데 sql 이 틀려도 튀어나감.. 
					
					e.printStackTrace();
					
				} finally {
					close(rs);
					close(pstmt);
				}
				
			return loginResult;
		}



		public boolean selectJoinMember(String id) throws Exception {
			
			boolean JoinResult = false;
			

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			//그리고 db에서 아이디(고유값) 일치하는 회원이 있는지 확인하면 되잖아?
			//실제는 반복 가입 막기위해서 핸드폰을 인증하고 해야한
			
				try {
				
				
				//기존의 회원 아이디 있는지 확인
				
				
				String sql = "SELECT id FROM member WHERE id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { // 아이디가 존재하는 경우
					// 패스워드 일치 여부 판별
					if(id.equals(rs.getString(1))) { // 패스워드가 일치할 경우
						JoinResult = true;
					} else {
						//예외객체 직접 발생시켜서 예외메세지에
					//패스워드 오류 메세지 전달.
						
						throw new JoinException("회원 존재");//예외클래스 꼭대기 exception 쓰거나 우리가 만들거나, 
						//   이 과정이 예외 객체 생성
						// 정상적인 리턴이면 결과값 나오는데
						// 정상적 로그인이 안된다면, ? ? 트라이캐치하면 또,, 
						// 예외강제 throw ,,고 밖으로 던지는건 throws
					}
					
					
				}else {
					
					throw new JoinException("회원이 존재하지 않습니다.");
				}
				
				
				
				} catch (SQLException e) { //조심해야하는데 sql 이 틀려도 튀어나감.. 
					
					e.printStackTrace();
					
				} finally {
					close(rs);
					close(pstmt);
				}
				
				return JoinResult;
		}

		public boolean duplicateIdCheck(String id) {
			
			boolean isDuplicateMember = false;	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// board_num 에 해당하는 게시물을 조회하여 패스워드(board_pass) 일치 여부 확인
			try {
				String sql = "SELECT id FROM member WHERE id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { 			
					isDuplicateMember = true;				
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return isDuplicateMember;
		}
		public boolean duplicateEmailCheck(String email) {
			
			boolean isDuplicateEmailCheck = false;	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// board_num 에 해당하는 게시물을 조회하여 패스워드(board_pass) 일치 여부 확인
			try {
				String sql = "SELECT email FROM member WHERE email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { 			
					isDuplicateEmailCheck = true;				
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return isDuplicateEmailCheck;
		}
		
		public boolean duplicatePhoneCheck(String phone) {
			
			boolean isDuplicatePhoneCheck = false;	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// board_num 에 해당하는 게시물을 조회하여 패스워드(board_pass) 일치 여부 확인
			try {
				String sql = "SELECT phone FROM member WHERE phone = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, phone);
				rs = pstmt.executeQuery();
				
				if(rs.next()) { 			
					isDuplicatePhoneCheck = true;				
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return isDuplicatePhoneCheck;
		}
	
}

			
		