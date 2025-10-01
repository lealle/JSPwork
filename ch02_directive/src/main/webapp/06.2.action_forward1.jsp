<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Forward 의 포워딩 되기전의 페이지<p/>
	<jsp:forward page="06.3.action_forward1.jsp">
		<jsp:param name="id" value='<%= request.getParameter("id") %>' />
	    <jsp:param name="pw" value='<%= request.getParameter("pw") %>' />
	</jsp:forward><p/>

</body>
</html>