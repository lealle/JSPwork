<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = "Korea web JSP";
	


%>

</head>
<body>
	<h1>Action Include Tag Ex1</h1>
	<jsp:include page="04.3.action_include1.jsp"></jsp:include><br>
	action includeTag의 첫번째 페이지<p/>
	<%= name %>
	
</body>
</html>