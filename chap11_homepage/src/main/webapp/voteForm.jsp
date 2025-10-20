<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "vote.*"  import = "java.util.ArrayList" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<%
	int num = 0;
	if(!(request.getParameter("num")== null || request.getParameter("num").equals(""))){
		num = 	Integer.parseInt(request.getParameter("num"));
	}
	
	VoteList vlist = vDao.getVote(num);
	ArrayList<String> alist = vDao.getItem(num);
	
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	body {
	    width: 1000px;
	    margin: 0 auto;
	}
	
	.voteForm{
	    width: 400px;
	    margin: 0 auto;
		
	}
	
		
	th, h2, h5{
		text-align : center;
	}
	table {
		margin: 0 auto;
	}
	
	.cen {
		margin: 0 auto;
		text-align: center;
	}
	
</style>
</head>
<body>
	<div class="voteForm">

		<form action="voteFormProc.jsp" method="post">
			<table>
				<tr>
					<td class="cen" colspan="2" size="30"></td>
				</tr>				
				<%
					out.print("<tr><td colspan='2' size='50'>Q : "+vlist.getQuestion()+"<tr><td>");
				// vlist.getQuestion() 변수로 지정한 뒤 <%= 문법을 사용하여 해도됨
					String msg = "";

					if(vlist.getType() == 1){
						msg = "checkbox";
					}else{
						msg = "radio";
					}
					
					for(int i=0; i<alist.size(); i++){
							out.print("<tr><td style='padding-left: 30'> <input name='itemnum' type='"+msg+"' value='"+i+"'>"+ alist.get(i) +"</td></tr>");					
							
					}	
			%>				
				<tr>
					<td class="cen"><input type="submit" value="투표">&emsp;
					<input type="button" value="결과" 
						onclick="window.open('voteView.jsp?num=<%=num %>','voteView','width=500, height=350')"
						></td>
				</tr>
			
			</table>
			<input type="hidden" name="num" value="<%=num %>">
		
		</form>
		
	
	</div>
</body>
</html>