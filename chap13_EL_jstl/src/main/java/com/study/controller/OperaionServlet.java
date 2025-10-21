package com.study.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.study.dto.Person;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/operation.do")
public class OperaionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("sOne", "");
		request.setAttribute("sTwo", "");
		request.setAttribute("sThree", "안녕");
	
		request.setAttribute("pOne", new Person("",20,""));
		request.setAttribute("pTwo", null);

		ArrayList<String> list1 = new ArrayList<>();
		request.setAttribute("aOne", list1);

		ArrayList<String> list2 = new ArrayList<>();
		list2.add("더조은컴퓨터아카데미");
		request.setAttribute("aTwo", list2);
		
		
		
		
		// 응답페이지를 지정하여 거기에 포워딩 되도록 설정 
		request.getRequestDispatcher("views/1_EL/02.operation.jsp").forward(request, response);
	
	}

}
