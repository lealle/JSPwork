<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = "한철민";
		int num = 3;
		boolean bool = false;
		double douNum = 3.14;
		// 반드시 먼저 선언해주고 나중에 출력해야함
		int age;
		String str;
		// 지역변수라 초기화 안하면 오류 발생
		//전역은 0 null 로 들어감 
		%>
	
	나의 이름은 <%=name %>입니다. <br>
	<%=num %>학년 입니다.<br>
	재학중 입니까? <%=bool %><br>
	원주율은 <%=douNum %>입니다.<br>
	
	<%-- <%=age %><br>
	<%=str %><br>
		지역변수는 초기화 해주고 사용해야하여 오류 발생 
	 --%>
	 
	 <%=application.getRealPath("/") %>
</body>
</html>