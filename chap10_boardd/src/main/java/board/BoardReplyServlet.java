package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/boardReply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Board upBean = new Board();
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setIp(request.getParameter("ip"));
		
		upBean.setRef(Integer.parseInt(request.getParameter("ref")));
		upBean.setPos(Integer.parseInt(request.getParameter("pos")));
		upBean.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		HttpSession session = request.getSession();
		Board dbBean = (Board)session.getAttribute("bean");
		
		BoardDao bDao = new BoardDao();
		bDao.updateRef(upBean.getRef(), upBean.getPos());
		bDao.replyBoard(upBean);			
		
		
		response.sendRedirect("list.jsp?nowPage="+nowPage);

	}

}
