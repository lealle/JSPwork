<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    	
    	Board board = null;
    	Board sessionBoard = (Board)session.getAttribute("bean");
    	
    	if(sessionBoard == null || sessionBoard.getNum() != num){
	    	bDao.upCount(num);
	    	board = bDao.getBoard(num);    		
	    	session.setAttribute("bean",board);
    	} else{
	    	board = bDao.getBoard(num);    		
    		
    	}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main{
	margin: 0 auto;
	width: 800px;
}
table{
	text-align:center;
}

h3{
	text-align:center;
	background-color: cyan;
	color: white;
}
.content{
}
.cen{
	text-align:center;

}
.right{
	text-align:right;

}
.left{
	text-align:left;
}
a{
	text-decoration: none;
	color: black;
}
</style>

</head>
<body>
<div class="main">
<form method="post" action="boardUpdate">
<h3>수정하기</h3>
	<table>
		<tr>
			<td width="15%">성명</td>
			<td class="left"><input name="name" value="<%=board.getName()%>"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td class="left"><input name="subject" value="<%=board.getSubject()%>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td class="left"><textarea name="content" rows="10" cols="50"><%=board.getContent() %></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td class="left"><input name="pass"> 수정시에는 비밀번호가 필요합니다.</td>
		</tr>
	</table>
	<hr>
	<p class="left">
		<input type="submit" value="수정완료">&emsp;
		<input type="reset" value="다시수정">&emsp;
		<input type="button" value="뒤로" onClick="history.go(-1)">
	</p>
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>
</div>
</body>
</html>