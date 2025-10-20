package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import ajax01.Member;
import ajax01.MemberDao;

@WebServlet("/ajaxReply/ajaxReply.do")
public class AjaxServletReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("bno"));
		ReplyDao mDao = new ReplyDao();
		ArrayList<Reply> rep = mDao.getReply(num);
	
		response.setContentType("application/json; charset=UTF8"); 
		Gson gson = new Gson(); gson.toJson(rep, response.getWriter());
 
	}
}
