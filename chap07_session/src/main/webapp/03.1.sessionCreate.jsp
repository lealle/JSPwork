<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("idKey", "tjoeun");
	session.setAttribute("pwKey", "1234");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션이 생성됨<p/>
세션 정보는 <a href="03.2.testeSession.jsp">클릭하세요</a>
</body>
</html>