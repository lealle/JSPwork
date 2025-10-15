<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" import="java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
    	String keyField = request.getParameter("keyField");
    	String keyWord= request.getParameter("keyWord");
    	
    	Board board = null;
    	Board sessionBoard = (Board)session.getAttribute("bean");
    	
    	if(sessionBoard == null || sessionBoard.getNum() != num){
	    	bDao.upCount(num);
	    	session.setAttribute("bean",board);
	    	board = bDao.getBoard(num);    		
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
<h3>글 읽 기</h3>
	<table class="table table-striped-columns">
		<tr>
			<td width="15%">이름 </td>
			<td width="35%"><%=board.getName() %></td>
			<td width="15%">등록날짜</td>
			<td width="35%"><%=board.getRegdate() %></td>
		</tr>
		
		<tr>
			<td>제목 </td>
			<td class="left" colspan="3"><%=board.getSubject()%> </td>
		</tr>
	
	
	</table>
	
	<div class="content">
		본문내용 : </p>
		<%=board.getContent() %>
	
	</div>
	
	<p class="right"><br><br><%=board.getIp() %>로 부터 글을 남기셨습니다/ 조회수 <%=board.getCount() %></p>
</div>
	<hr>
	<p class="cen">[
	<a href="list.jsp`">리스트 </a> |
	<a href="update.jsp?num=<%=num%>&nowPage=<%=nowPage%>">수 정 </a> |
	<a href="">답 변 </a> |
	<a href="delete.jsp?num=<%=num%>&nowPage=<%=nowPage%>">삭 제</a>
	<!-- 띄어쓰기하면 안됨 (퍼센트 안쪽은 가능) -->
	]
	</p>
	

</body>
</html>