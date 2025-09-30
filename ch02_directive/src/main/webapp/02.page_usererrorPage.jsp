<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int one = 1, zero = 0; %>
	<p>one과 zero이 사직연산</p>
	one + zero = <%=one+zero %><br>
	one - zero = <%=one-zero %><br>
	one * zero = <%=one*zero %><br>
	one / zero = <%=one/zero %><br><!-- 에러  -->
	
	
	
	
	
	java.lang.ArithmeticException: / by zero
</body>
</html>