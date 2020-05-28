package product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import product.svc.productUpdateService;

public class ProductUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		boolean isUpdate=false;
		
		productUpdateService productUpdateServie=new productUpdateService();
		int p_num=Integer.parseInt(request.getParameter("p_num"));
		int region_region_code=Integer.parseInt(request.getParameter("region_region_code")) ;
		String p_category=request.getParameter("p_category");
		String p_name=request.getParameter("p_name");
		int p_price= Integer.parseInt(request.getParameter("p_price")) ;
		int p_amount=Integer.parseInt(request.getParameter("p_amount")) ;
		
		isUpdate=productUpdateServie.productUpdate(p_num,region_region_code,p_category,p_name,p_price,p_amount);
		
		return forward;
	}

}
