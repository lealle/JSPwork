package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/boardPost")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pass = request.getParameter("pass");
		String ip = request.getParameter("ip");
			
		Board postBean = new Board();
		BoardDao bDao = new BoardDao();
		postBean.setNum(bDao.getNextNum());
		postBean.setName(request.getParameter("name"));
		postBean.setSubject(request.getParameter("subject"));
		postBean.setContent(request.getParameter("content"));
		postBean.setPass(request.getParameter("pass"));
		postBean.setIp(request.getParameter("ip"));
		boolean flag = bDao.addBoard(postBean);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(flag) {
			String url = "list.jsp";
			response.sendRedirect(url);
		}else {
			out.print("<script>");
			out.print("alert('글쓰기 실패.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
		
		
	}

}
