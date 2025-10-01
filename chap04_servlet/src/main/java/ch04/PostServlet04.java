package ch04;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/PostServlet")
public class PostServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
	
		response.setContentType("text/html; charser=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>Post Servlet에서 반환</h1>");	
		out.print("<h3> ID : "+id+"</h3>");	
		out.print("<h3> PW : "+pw+"</h3>");	
		out.print("<h3> EAMIL : "+email+"</h3>");	
		out.print("</body>");
		out.print("</html>");
		
		
		
		
	
	}

}
