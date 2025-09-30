<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int one;
		int two = 1;
		// 메소드는 선언문에서만 선언 가능
		public int plusMethod(int one, int two){
			return one + two;	
		}
		String msg;
	%>
	one 과 two 의 합은? <%=plusMethod(3,5) %><br>
	one의 값 ? <%=one %><br>
	two의 값 ? <%=two %><br>
	one 과 two 의 합은? <%=plusMethod(one,two) %><br>
	msg의 값? <%= msg %><br>
	
	
	
	
	
</body>
</html>