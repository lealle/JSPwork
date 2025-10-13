<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idKey"))
			id = cookies[i].getValue();
	}
	if(!id.equals("")) {
%>
	<script>
		alert("로그인 되었습니다");
		location.href="04.3.cookieLoginOK.jsp";
	</script>
<%
	} else {
%>
	<h1>Cookie 로그인</h1>
	<form action="04.2.cookieLoginProc.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<th>ID</th>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="login">
					<input type="reset" value="reset">
				</td>
			</tr>
		</table>
	</form>
<%} %>
</body>
</html>