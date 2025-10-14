<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>
<!DOCTYPE html>
<%
	ArrayList<Board> board = new ArrayList<>();
	String keyWord ="";
	String keyField ="";
	if(request.getParameter("keyWord") !=null){
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	board = bDao.getBoard(keyField, keyWord);
	
	
%>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<link href="style.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list">
		<h2 class="m30">JSPBoard</h2>
		<table class="table m30">
		<tr>
			<td colspan=5 class="right-align">Total : </td>
		</tr>
		<tr>
			<th width="12%">번호</th>
			<th width="36%">제목</th>
			<th width="15%">이름</th>
			<th width="25%">날짜</th>
			<th width="12%">조회수</th>		
		</tr>
	
	<%
		for(int i=0; i<board.size(); i++){
			out.print("<tr><td>");
			out.print(board.get(i).getNum()+"</td><td>"
					+board.get(i).getContent()+"</td><td>"
					+board.get(i).getName()+"</td><td>"
					+board.get(i).getRegdate()+"</td><td>"
					+board.get(i).getCount()  );
			out.print("</td></tr>");
		}
	
	%>
	<tr>
				<td colspan=5><br/><br/></td>
			</tr>
			<tr>
				<td colspan=3 class="cen">[1]</td>
				<td colspan=2 class="right-align">
					<a href = "">[글쓰기]</a>&emsp;
					<a href = "">[처음으로]</a>&emsp;
				</td>
			</tr>
	</table>
	
	<form action="list.jsp" name="searchFrm" >
		<select name="keyField">
			<option value="name">이름</option>
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input name="keyWord" required>
		<input type="submit" value="찾기">
	
	</form>
	</div>
	
	
</body>
</html>