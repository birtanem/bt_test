package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProductDAO;

import static db.JdbcUtil.*;
import vo.ProductBean;

public class ProductListService {
	public static ArrayList<ProductBean> getProductList(){
		ArrayList<ProductBean> productList=null;
		Connection con=getConnection();
		ProductDAO productDAO=ProductDAO.getInstance();
		productDAO.setConnection(con);
		productList=productDAO.getList();
		
		close(con);
		
		return productList;
	}
}
