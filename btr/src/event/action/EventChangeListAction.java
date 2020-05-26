package event.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.media.sound.ModelAbstractChannelMixer;

import common.action.Action;
import common.vo.ActionForward;
import event.svc.EventChangeListService;
import event.vo.EventBean;
import event.vo.EventWinBean;
import jdk.nashorn.internal.runtime.JSONListAdapter;

public class EventChangeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventChangeListAction");
		ActionForward forward = null;
		
		int sel = Integer.parseInt(request.getParameter("sel"));
		
		EventChangeListService eventChangeListService = new EventChangeListService();
		ArrayList<EventWinBean> articleList = eventChangeListService.changeEventWinList(sel);


//		request.setAttribute("articleList", articleList);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		
		JSONObject jso=new JSONObject();    // JASON 객체생성

		jso.put("List", articleList);   

		out.print(jso.toString());
	
		
		
		return forward;
	}

}
