package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

@WebServlet("/ajaxReply/ajaxInsertReply.do")
public class AjaxServletInsertReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String name = "아무개";
		int ref = 1;
		// 원래는 받아와야하는데 임의로 넣어줌 
		
		Reply re = new Reply();
		re.setContent(content);
		re.setRef(ref);
		re.setName(name);
		
		/*
		 * Reply re = new Reply( re.setContent(content), re.setRef(ref), re.setName(name)); 생성자 형식에 맞게 만들어서 이런식으로 해도 됨
		 */
		
		
		ReplyDao mDao = new ReplyDao();
		boolean flag =  mDao.InsertReply(re);
	
		response.setContentType("application/json; charset=UTF8"); 
		Gson gson = new Gson(); gson.toJson(flag, response.getWriter());
		  
		 
	
	
	
	
	}

}
