package ch04;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
// doService 필요 없음 지우기 저거때문에 안돌아감 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");//공백시  널이 아닌 빈칸이 들어감 
		String pw = request.getParameter("pw");
		
		
		if(id!="" && pw!=""){
// null로 하면 출력되어서 ""로 수정 ""는 공백일때 출력안됨
			
			//			HttpSession session = request.getSession();
//            session.setAttribute("idKey", id);
//            
        	request.getSession().setAttribute("idKey", id);
    		
		}
		response.sendRedirect("05.login.jsp");
		
		
		
	}

}
