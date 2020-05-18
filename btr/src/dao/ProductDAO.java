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
	
	
	public ArrayList<ProductBean> getList(){
		ArrayList<ProductBean> productBeanList=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			String sql="select * from product order by num";
			pstmt=con.prepareStatement(sql);
			
			while(rs.next()) {
				ProductBean productBean=new ProductBean();
				productBean.setP_num(rs.getInt(1));
				productBean.setP_name(rs.getString(2));
				productBean.setP_content(rs.getString(3));
				productBean.setP_image(rs.getString(4));
				productBean.setP_price(rs.getInt(5));
				productBean.setP_amount(rs.getInt(6));
				productBeanList.add(productBean);
			}
		} catch (SQLException e) {
			System.out.println("ProductDAO getList실패"+e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return productBeanList;
	}
	
	
}
