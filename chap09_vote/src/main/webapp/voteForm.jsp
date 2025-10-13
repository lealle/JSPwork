<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "vote.*"  import = "java.util.ArrayList" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	    width: 1000px;
	    margin: 0 auto;
	}
		
	th, h2, h5{
		text-align : center;
	}
	
</style>
</head>
<body>
	<div>

<h5>설문폼</h5>
	<!-- 이중체크 o -> checkbox, x -> radio  -->
		<form action="voteFormProc.jsp" method="post">
			<table>
				<tr>
					<td colspan="2" size="30"></td>
				</tr>				
				<%
					VoteList vlist = vDao.getVote(0);
					ArrayList<String> alist = vDao.getItem(0);
					out.print("<tr><td colspan='2'>"+vlist.getQuestion()+"<tr><td>");
					String msg = "";

					if(vlist.getType() == 1){
						msg = "checkbox";
					}else{
						msg = "radio";
					}
					
					for(int i=0; i<alist.size(); i++){
							out.print("<tr><td colspan='2'> <input name='itemval' type='"+msg+"' value='"+alist.get(i)+"'>"+ alist.get(i) +"</td></td>");					
							
					}	
			%>				
				<tr>
					<td><button>투표</button></td>
					<td><button>결과</button></td>
				</tr>
			
			</table>
		
		
		</form>
		
	
	</div>
</body>
</html>