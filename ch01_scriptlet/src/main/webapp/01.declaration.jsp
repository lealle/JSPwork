<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!--  먼저 사용해도 상관없음 선언문 밑이든 위든 상관없음-->
	학원 이름은<%=name %><br>
	강의실은 <%=num %>층 입니다.<br>
	
	<%!
		String name = "더조은";
		int num = 8;
	%>
	<!-- html 주석  -->
	<%-- JSP 주석 <% %>
		html 과 jsp 구문 합쳐있을 때 주로 사용
	
	 --%>
	<%-- name2 :  <%=name2 %><br> 
	<% 는 선언전에 쓰면 오류 발생 <%!만 가능
	<%! 는 맨 처음에 올라감 그래서 위에서 사용해도 가능
	--%>
	<% 
	// 프로그래밍 주석 
	/*
		여러줄 주석 
	*/
		String name2 = team + "학원"; 
	%>
	name2 :  <%=name2 %><br>
	
	<%! 
		String team = "java 풀스택";
	%>
	
</body>
</html>