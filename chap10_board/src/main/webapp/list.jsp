<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>

<!DOCTYPE html>
<%
	ArrayList<Board> board = bDao.getBoard();
	
%>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>조회수</th>			
		</tr>
	
	<%
		for(int i=0; i<board.size(); i++){
			out.print("<tr><td>");
			out.print(board.get(i).getNum()+"</td><td>"
					+board.get(i).getContent()+"</td><td>"
					+board.get(i).getName()+"</td><td>"
					+board.get(i).getRegdate()+"</td><td>"
					+board.get(i).getCount());
			out.print("</td></tr>");
		}
	
	%>
	
	</table>
</body>
</html>