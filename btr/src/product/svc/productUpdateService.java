package product.svc;

import static common.db.JdbcUtil.*;  
import java.sql.Connection;

import product.dao.ProductDAO;
import product.vo.ProductBean;

public class productUpdateService {

	public boolean productUpdate(int p_num, int region_region_code, String p_category, String p_name, int p_price,
			int p_amount) {
		boolean isUpdate=false;
		
		Connection con=getConnection();
		ProductDAO productDAO=ProductDAO.getInstance();
		productDAO.setConnection(con);
		
		
		
		
		close(con);

		return isUpdate;
	}
	
	
}
