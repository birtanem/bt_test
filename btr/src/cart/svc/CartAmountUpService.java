package cart.svc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cart.vo.CartBean;
import product.vo.ProductBean;

public class CartAmountUpService {

	public void upCart(String p_name, HttpServletRequest request) {
		System.out.println("CartAmountUpService");
	
		// 요청한 클라이언트의 세션 영역 객체 가져오기
		
		ArrayList<CartBean> cartList = (ArrayList<CartBean>)request.getAttribute("cartList");
		ArrayList<ProductBean> productList = (ArrayList<ProductBean>)request.getAttribute("productList");
		
		for(int i = 0; i < cartList.size(); i++) {
			if(productList.get(i).getP_name().equals(p_name) ) {
				cartList.get(i).setC_p_amount(cartList.get(i).getC_p_amount()+1);
		
		
			}
		}
		
		
		
	}
}
