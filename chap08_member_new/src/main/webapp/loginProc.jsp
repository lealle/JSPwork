<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mDao" class="member.MemberDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String msg = request.getParameter("msg");
	
		if(mDao.loginMember(id, pwd)){
			session.setAttribute("idKey",id);
			msg = "로그인에 성공하셨습니다.";
		}
	%>
	
	<script>
		alert("<%=msg%>");
		location.href="login.jsp";
	
	</script>
	
	
	
	
</body>
</html>