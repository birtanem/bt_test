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
		
		System.out.println("ProductListService - getProductList");
		close(con);
		
		return productList;
	}
	public int getListCount() {
		System.out.println("productListService - getListCount()");
		int ListCount=0;
		Connection con=getConnection();
		ProductDAO productDAO=ProductDAO.getInstance();
		productDAO.setConnection(con);
		ListCount=productDAO.selectListCount();
		System.out.println("ProductListService - getListCount");
		close(con);
		
		return ListCount;
	}
	
}
