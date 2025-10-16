<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	if(request.getParameter("pass") !=null){
		Board board = (Board)session.getAttribute("bean");		
		if(board.getPass().equals(request.getParameter("pass"))){
			if(bDao.deleteBoard(num) == 1){
				response.sendRedirect("list.jsp?nowPage="+nowPage);
			}else{
				%>
				<script type="text/javascript">
					alert("삭제가 되지 않았습니다.")
					history.go(-2);
				</script>				
				<%
			}
		}else{
			%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.")
				history.go(-1);
			</script>				
			<%
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="delete.jsp" method="post">
		<table>
			<tr>
				<th height='30'>사용자의 비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<th ><input type="password" name="pass" required></th>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="삭제완료">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1)">
				</th>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>

</body>
</html>