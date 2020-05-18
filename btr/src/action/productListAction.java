package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.productListService;
import vo.ActionForward;
import vo.ProductBean;

public class productListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("productListAction");
		ArrayList<ProductBean> productList=productListService.getProductList();
		
		for(ProductBean bean:productList) {
			System.out.println("번호:"+bean.getP_num());
		}
		
		forward=new ActionForward();
		forward.setPath("/product/product_list.jsp");
		return forward;
	}

}
