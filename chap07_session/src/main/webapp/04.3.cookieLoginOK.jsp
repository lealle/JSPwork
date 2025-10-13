<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie Login Page</h2>
<%
	String id = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idKey"))
			id = cookies[i].getValue();
	}
%>
	<%=id %>님이 로그인 하였습니다<p/>
	<a href="04.4.cookieLogout.jsp">로그아웃</a>
</body>
</html>