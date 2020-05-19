package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static db.JdbcUtil.*;
import vo.ProductBean;

public class ProductDAO {
	private static ProductDAO instance;
	private ProductDAO() {}
	public static ProductDAO getInstance() {
		if(instance==null) {
			instance=new ProductDAO();
		}
		return instance;
	}
	Connection con;
	public void setConnection(Connection con) {
		this.con=con;
	}
	// 상품 등록 메서드
	public int insertArticle(ProductBean productBean) {
		
		int insertCount = 0;
		
		// DB 작업에 필요한 변수 선언(Connection 객체는 이미 외부로부터 전달받음)
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			int num = 1;
			
			// 새 글 번호 결정
			String sql = "SELECT MAX(p_num) FROM product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// 게시글 등록
			sql = "INSERT INTO product VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, productBean.getP_name());
			pstmt.setString(3, productBean.getP_content());
			pstmt.setString(4, productBean.getP_image());
			pstmt.setInt(5, productBean.getP_price());
			pstmt.setInt(6, productBean.getP_amount());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("productDAO - insertArticle메서드 실패ㅠㅠ " + e.getMessage());
		} finally {
			close(rs);
			close(pstmt);
		}
		 
		
		return insertCount;
	} // 상품 등록 메서드 끝

	public ArrayList<ProductBean> getList(){
		ArrayList<ProductBean> productList=new ArrayList<ProductBean>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			String sql="select * from product order by p_num";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductBean productBean=new ProductBean();
				productBean.setP_num(rs.getInt(1));
				productBean.setP_name(rs.getString(2));
				productBean.setP_content(rs.getString(3));
				productBean.setP_image(rs.getString(4));
				productBean.setP_price(rs.getInt(5));
				productBean.setP_amount(rs.getInt(6));
				productList.add(productBean);
			}
		} catch (SQLException e) {
			System.out.println("ProductDAO getList실패"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return productList;
	}
	public int selectListCount() {
		int listCount=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			String sql="select count(p_num) from product";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("ProductDAO - selectListCount 실패"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	
	
}
