<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "vote.*"  import = "java.util.ArrayList" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>


<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
    width: 1000px;
    margin: 0 auto;
}
	* {
		padding 0;
	}
	.ts{
    text-align : right;
    }
    
	th, h2, h5, p{
		text-align : center;
	}
	
	a {
		text-decoration: none;
    	color : black;
	}	
	
</style>
</head>
<body>
<div>
<h2>투표프로그램</h2>
<hr>
<h5>설문폼</h5>
<jsp:include page="voteForm.jsp"/>



<hr>
<h5>설문리스트</h5>
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col" colspan="2">시작일~종료일</th>
    </tr>
  </thead>
  <tbody>

<%
	ArrayList<VoteList> alist = vDao.getList();
	for(int i=0; i<alist.size(); i++){
		VoteList vlist = alist.get(i);
		int num = vlist.getNum();
		String question = vlist.getQuestion();
		String sdate = vlist.getSdate();
		String edate = vlist.getEdate();
		out.print("<tr>");
		out.print("<td>"+(alist.size()-i)+"</td>");
		out.print("<td><a href='voteList.jsp?num="+num+"'>"+question+"</a></td>");
		out.print("<td>"+sdate+" ~ "+edate +"</td>");
		out.print("</tr>");		
	}
%>
  </tbody>
  <tr>
  
  <td class="ts" colspan="3"><a href="voteInsert.jsp">설문작성하기</a></td>
  
  </tr>
</table>
</div>

</body>
</html>