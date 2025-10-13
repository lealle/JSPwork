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
		String id = (String)session.getAttribute("idKey");
		if(id!=null){
		%>
	<b><%=id %>님 환영합니다.</b><p/>
	즐거운 쇼핑되세요<p/>
	<a href="logout.jsp">로그아웃</a>
	

		<%
		}else{
			
	%>
<form action ="loginProc.jsp" method="post">

	<table align="center">
	
		<tr>
			<th colspan="2">로그인</th>
		</tr>
		<tr>
			<td>ID</td>
			<td><input name="id"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input name="pwd" type="password"></td>
		</tr>
		<tr>
			<th><input type="submit" value="로그인"></th>
		</tr>
	
	</table>

</form>


	<%
		}
	%>


</body>
</html>