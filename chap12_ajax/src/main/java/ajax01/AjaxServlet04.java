package ajax01;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxServlet04
 */
@WebServlet("/ajax01/ajax4.do")
public class AjaxServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDao mDao = new MemberDao();
		Member mem = mDao.checkById(id);
		/* 1. 오류 제어가 없음 
		 * JSONObject jObj = new JSONObject(); jObj.put("id", mem.getId());
		 * jObj.put("name", mem.getName()); jObj.put("email", mem.getEmail());
		 * jObj.put("gender", mem.getGender()); // key - value 여기서 key 값은 내 맘대로 써도 됨 받을때
		 * 어떤값으로 하는지만 알면 된다. response.setContentType("application/json; charset=UTF8");
		 * response.getWriter().print(jObj);
		 */

		/* 2.
		 * JSONObject jObj = new JSONObject(); if(mem == null || mem.getId() == null) {
		 * jObj.put("status","fail"); jObj.put("message","해당 ID를 찾을 수 없습니다"); }else {
		 * jObj.put("status","success"); jObj.put("id", mem.getId()); jObj.put("name",
		 * mem.getName()); jObj.put("email", mem.getEmail()); jObj.put("gender",
		 * mem.getGender()); // key - value 여기서 key 값은 내 맘대로 써도 됨 받을때 어떤값으로 하는지만 알면 된다.
		 * } response.setContentType("application/json; charset=UTF8");
		 * response.getWriter().print(jObj);
		 */		

		// 3. 
		//  GSON(Gson) : 객체를 알아서 JSONObject 로 변경해줌 
		/*
		// toJson(응답할자바객체 , 응답할스트림) -> 자동으로 위의 형태로 변환(성공시)
		 * Gson gson = new Gson(); // toJson(응답할자바객체 , 응답할스트림) -> 자동으로 위의 형태로 변환(성공시)
		 * gson.toJson(mem, response.getWriter());
		 */		
		
		/*
		 * response.setContentType("application/json; charset=UTF8"); // 이건 있어야함 
		 * 		// 1줄로 줄이면 
		 *  new Gson().toJson(mem, response.getWriter());
		 */
		
		

		// 4. GSON으로 fail success 넣기 
		response.setContentType("application/json; charset=UTF8"); // 이건 있어야함 
		Gson gson = new Gson();
		
		if(mem.getId() == null) {
			Map<String, String> result = new HashMap<>();
			result.put("status", "fail");
			result.put("message", "해당 ID를 찾을 수 없습니다.");
			gson.toJson(result, response.getWriter());
		}else {
			Map<String, Object> result = new HashMap<>();
			result.put("status", "success");
			result.put("member", mem);
			gson.toJson(result, response.getWriter());
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
