package product.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.javafx.collections.MappingChange.Map;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberMypageFormService;
import member.vo.MemberBean;
import place.vo.PlaceBean;
import product.svc.ProductListService;
import product.vo.ProductBean;
import review.svc.ReviewListService;
import review.vo.ReviewPageInfo;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		System.out.println("productListAction");
		
		
		int page = 1;
		int limit = 8;

		if (request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ProductListService productListService=new ProductListService();
		
		int listCount = productListService.getListCount();
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		ReviewPageInfo pageinfo = new ReviewPageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("pageInfo", pageinfo);

		
// ------------------------------------------------------------------------------------------------------------

		ArrayList<ProductBean> productList=productListService.getProductList(page, limit);
		System.out.println("tㅏ이즈"+productList.size());
	
		request.setAttribute("productList", productList);		
		
		
		
		//메인페이지 작업중 ~! 0: 세션없음 1: 세션있음
				String check=(String)request.getParameter("check");
				System.out.println(check);
				if(check==null) {
					check="2";
				}else {
					switch (check) {
					case "0":
						check="0";
						break;
					case "1":
						check="1";
						break;
					case "2" :
						check="2";
						break;
					default:
						break;
					}
				}
				
				String id=(String)request.getParameter("id");
				System.out.println("id:"+id);
				System.out.println("ck:"+check);
				
				if(check.equals("1")||check.equals("0")){
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
//					out.print(articleList);
					System.out.println("세션있음 1와라~");
//					리스트 → 제이슨?
						MemberMypageFormService info=new MemberMypageFormService();
						MemberBean mb=info.getMemberInfo(id);
						ArrayList<ProductBean> List = productListService.getProductList(1,10);
						JSONArray jsonArray = new JSONArray();
						for(int i=0; i<List.size();i++) {
							JSONObject obj=new JSONObject();
							obj.put("p_img", List.get(i).getP_image());
							obj.put("p_theme", List.get(i).getP_theme());
							obj.put("session", mb.getType());
							obj.put("p_num", List.get(i).getP_num());
							jsonArray.add(obj);
						}
						out.print(jsonArray);
					return forward;	
						
				}else if(check.equals("2")) {
					forward=new ActionForward();
					forward.setPath("/product/product_list3.jsp");
					System.out.println(check);
					return forward;
				}


		
		return forward;
	}

}
