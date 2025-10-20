package ajax01;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ajax01/ajax5.do")
public class AjaxServlet05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao mDao = new MemberDao();
		ArrayList<Member> mem = mDao.getMember();
	
		/*
		 * response.setContentType("application/json; charset=UTF8"); 
		 * Gson gson = new Gson(); gson.toJson(mem, response.getWriter());
		 * 
		 */
		
		// 1. JSONArray
		/*
		 * JSONArray jArr = new JSONArray(); for(Member m : mem) { JSONObject jObj = new
		 * JSONObject(); jObj.put("id", m.getId()); jObj.put("name", m.getName());
		 * jObj.put("gender", m.getGender()); jObj.put("email", m.getEmail());
		 * jArr.add(jObj); } response.setContentType("application/json; charset=UTF8");
		 * response.getWriter().print(jArr);
		 */
	
		 // 2. GSON
		 response.setContentType("application/json; charset=UTF8"); 
		 Gson gson = new Gson(); gson.toJson(mem, response.getWriter());
		  
		 
	
	
	
	
	
	
	}
}
