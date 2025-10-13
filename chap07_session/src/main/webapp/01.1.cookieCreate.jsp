<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키의 값은 띄어쓰기 안됨.
	Cookie cookie = new Cookie("myCookie", "Apple");
	cookie.setValue("Banana");
	cookie.setMaxAge(60);
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>Cookie를 사용하여 연결 유지</h2>
	쿠키를 만듭니다<p/>
	쿠키 내용은 <a href="01.2.testeCookie.jsp">클릭하세요</a>
</body>
</html>