package place.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import common.action.Action;
import common.vo.ActionForward;
import member.svc.MemberMypageFormService;
import member.vo.MemberBean;
import place.vo.PlaceBean;
import place.svc.PlaceListService;
import place.vo.PlacePageInfo;

public class PlaceListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PlaceListAction");
		ActionForward forward = null;
		request.getParameter("check");
		
		int page = 1; // 현재 페이지 번호를 저장할 변수
		int limit = 3; // 한 페이지 당 출력할 게시물 수 지정
		
		// 파라미터로 전달받은 페이지 번호가 있을 경우 가져와서 page 변수에 저장
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); // String -> int 변환
		}
		
		// BoardListService 클래스 인스턴스 생성
		// 게시물 전체 갯수를 조회하기 위해 getListCount() 메서드 호출하여 갯수 리턴받기
		PlaceListService placeListService = new PlaceListService();
		int listCount = placeListService.getListCount();
//		System.out.println("전체 게시물 수 : " + listCount);
		
		// 지정한 갯수 만큼의 게시물 가져오기
		// BoardListService 클래스의 getArticleList() 메서드를 호출하여 게시물 목록 가져오기
		// => 파라미터 : 현재페이지번호(page), 한 번에 가져올 게시물 최대 갯수(limit)
		// => 리턴타입 : ArrayList<BoardBean> => 게시물 1개 저장할 BoardBean 제네릭 타입으로 지정
		ArrayList<PlaceBean> articleList = placeListService.getArticleList(page, limit);
		
//		for(BoardBean article : articleList) {
//			System.out.println(article.getBoard_subject());
//		}
		
		// 페이징 처리를 위해 페이지 수 계산
		// 1. 최대 페이지 번호 계산 : 전체 게시물 수 / limit 결과를 반올림 처리 위해 0.95 더함
		int maxPage = (int)((double)listCount / limit + 0.95);
		// 2. 현재 페이지에서 표시할 시작 페이지 번호 계산(1, 11, 21 등)
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		// 3. 현재 페이지에서 표시할 끝 페이지 번호 계산(10, 20, 30 등)
		int endPage = startPage + 10 - 1;
		// 단, 끝 페이지 번호가 최대 페이지 번호보다 클 경우 
		// => 최대 페이지 번호를 끝 페이지 번호로 사용
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징 정보를 저장할 PageInfo 객체 생성 및 데이터 저장
		PlacePageInfo pageInfo = new PlacePageInfo(page, maxPage, startPage, endPage, listCount);
		
		// request 객체에 PageInfo 객체와 ArrayList 객체 저장
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		
		
		//메인페이지 작업중 ~! 0: 세션없음 1: 세션있음
		String check=(String)request.getParameter("check");
		switch (check) {
		case "0":
			check="0";
			break;
		case "1":
			check="1";
			break;
		case "2":
			check="2";
			break;
		default:
			break;
		}
		
		String id=(String)request.getParameter("id");
		System.out.println("id:"+id);
		System.out.println("ck:"+check);
		
		
		if(check.equals("1")||check.equals("0")){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
//			out.print(articleList);
			System.out.println("세션있음 1와라~");
//			리스트 → 제이슨?
				MemberMypageFormService info=new MemberMypageFormService();
				MemberBean mb=info.getMemberInfo(id);
				
				JSONArray jsonArray = new JSONArray();
				for(int i=0; i<articleList.size();i++) {
					JSONObject obj=new JSONObject();
					obj.put("pl_img", articleList.get(i).getPl_image());
					obj.put("pl_theme", articleList.get(i).getPl_theme());
					obj.put("session", mb.getType());
					jsonArray.add(obj);
				}
				out.print(jsonArray);
//			list.add(articleList.)
//			필요한 데이터 : type, 사진
			return forward;	
				
		}else if(check.equals("2")) {
			forward = new ActionForward();
			forward.setPath("/place/place_list.jsp");
			System.out.println(check);
			return forward;
		}
		
		
		return forward;
	}

}
