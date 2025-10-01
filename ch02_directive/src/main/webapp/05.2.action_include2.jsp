<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String siteName = request.getParameter("siteName");
	String siteTel = request.getParameter("siteTel");
// 위치 어디에서 받든지 상관 없음 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Action Include Tag Ex2</h1>
	<jsp:include page="05.3.action_include2.jsp">
		<jsp:param value="naver" name="siteName"/>
		<jsp:param value="031-123-3456" name="siteTel"/>
	
	</jsp:include><p/>
	action include 의 첫번째 페이지<p/>
	<%= siteName %><p/>
	<%= siteTel %><p/>
	
</body>
</html>