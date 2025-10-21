package com.study.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/el.do")
public class Elservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
			* 데이터를 담을 수 있는 JSP 내장 객체의 종류
			
			1. ServletContext(application Scope)
			* 한 애플리케이션당 단 1개가 존재하는 객체
			* 이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
			* 공유범위 가장 큼(jsp/servlet/java)
			* 
			2. HttpSession(session Scope)
			* 한 브라우저당 1개가 존재하는 객체
			* 이 영역에 데이터를 담으로 jsp/servlet 단에서 사요아능
			* 공유범위가 다소 제한적임
			* 
			3. HttpServletRequest(request Scope)
			* 요청 때마다 매번 생성되는 객체
			* 이 영역에 데이터를 담으면 해당 request 객체를 포워딩 받는 응답 jsp 또는 servlet 
			* 공유범위가 작음
			* 
			4. PageContext(page scope)
			* jsp마다 존재하는 객체
			* 해당 페이지에서만 사용가능
			* 공유범위가 가장 작음 
			*
			* 위의 4개의 객체들에 
			* 데이터를 담을때는 .setAttribute("키",담고자하는데이터)
			* 데이터를 꺼낼때는 .getAttribute("키") -> 담겨있는데이터(value)
			* 데이터를 삭제 할 때 .removeAttribute("키")
			* 
			* 
		*/

		// request scope 에 담기
		request.setAttribute("classRoom", "801");
		request.setAttribute("student", "");
		
		
		
		
	
	
	}

}
