package product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import product.svc.productUpdateService;
import product.vo.ProductBean;

public class ProductUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("productUpdateAction도착!");
		ActionForward forward=null;
		boolean isUpdate=false;
		
		productUpdateService productUpdateServie=new productUpdateService();
		ProductBean productBean=new ProductBean();
		productBean.setP_num(Integer.parseInt(request.getParameter("p_num")));
		productBean.setRegion_region_code(Integer.parseInt(request.getParameter("region_region_code")));
		productBean.setP_category(request.getParameter("p_category"));
		productBean.setP_name(request.getParameter("p_name"));
		productBean.setP_price(Integer.parseInt(request.getParameter("p_price")));
		productBean.setP_price(Integer.parseInt(request.getParameter("p_amount")));
		productBean.setP_content(request.getParameter("p_content"));
		productBean.setP_image(request.getParameter("p_image"));
		productBean.setRegion_name(request.getParameter(request.getParameter("region_name")));

		isUpdate=productUpdateServie.productUpdate(productBean);
		
		return forward;
	}

}
