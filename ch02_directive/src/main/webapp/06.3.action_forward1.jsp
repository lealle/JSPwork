<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id= request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Action Forward Ex1</h1>
	당신의 id는 <b><%=id %></b>이고, 
	당신의 pw는 <b><%=pw %></b><p/>
	
</body>
</html>