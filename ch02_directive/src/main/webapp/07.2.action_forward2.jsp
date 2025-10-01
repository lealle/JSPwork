<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Forward 의 포워딩 되기전의 페이지<p/>
	<jsp:forward page='<%=bloodType + ".jsp"%>'>
		<jsp:param name="name" value='<%= request.getParameter("name") %>'/>
		<jsp:param name="bloodType" value='<%= request.getParameter("bloodType") %>'/>
	</jsp:forward><p/>

</body>
</html>