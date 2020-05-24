package product.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.collections.MappingChange.Map;

import common.action.Action;
import common.vo.ActionForward;
import product.svc.ProductListService;
import product.vo.ProductBean;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("productListAction");

		ArrayList<ProductBean> productList=ProductListService.getProductList();

		ProductListService productListService=new ProductListService();
		int ListCount=productListService.getListCount();

		request.setAttribute("productList", productList);		
		request.setAttribute("ListCount", ListCount);
		
		
		forward=new ActionForward();

		forward.setPath("/product/product_list3.jsp");


		return forward;
	}

}
