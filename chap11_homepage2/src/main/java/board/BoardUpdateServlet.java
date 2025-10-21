package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Board upBean = new Board();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		
		HttpSession session = request.getSession();
		Board dbBean = (Board)session.getAttribute("bean");
		
		BoardDao bDao = new BoardDao();
		if(dbBean.getPass().equals(upBean.getPass())) {
			bDao.updateBoard(upBean);
			String url = "read.jsp?num=" + upBean.getNum() + "&nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
	}
}
