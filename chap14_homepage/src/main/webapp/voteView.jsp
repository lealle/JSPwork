<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vote.*"  import = "java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<%
	int num = 0;
	if(!(request.getParameter("num")== null || request.getParameter("num").equals(""))){
		num = 	Integer.parseInt(request.getParameter("num"));
	}
	
	VoteList vlist = vDao.getVote(num);
	ArrayList<VoteItem> alist = vDao.getItemCount(num);
	
	Random r = new Random();
	int sum = vDao.sumCount(num);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
	margin: 0 auto;
	}
	.cen{
	margin: 0 auto;
	
	}
</style>
</head>
<body>
<div>
<table class="table" align="center">
<tr>
	<td colspan='4'>
	<%
	out.print("<b>Q : "+vlist.getQuestion()+"</b>");
	%>
	</td>
</tr>
<tr>
<td colspan='3'>
<%
	out.print("<b>총투표자 : "+vDao.sumCount(num)+"명</b>");
%>
</td>
<td>count</td>
</tr>
<tr>

<th width="10%">번호</th>
<th width="30%">item</th>
<th>그래프</th>
<th width="15%">득표수</th>

</tr>
<%
	for(int i=0; i<alist.size(); i++){
		int rgb = r.nextInt(255*255*255);
		String rgbHex = "#" + Integer.toHexString(rgb);
		int ratio = (int)((alist.get(i).getCount() / (double)sum)*100);	
		out.print("<tr><td>");
		out.print((i+1)+"</td><td>"+alist.get(i).getItem()[0]+"</td>");
		%>
		<td align="left">
			<table width="<%=ratio%>" height="15">
				<tr>
					<td bgcolor="<%=rgbHex%>"></td>
				</tr>
			</table>
		</td>

		<%
		
		out.print("<td>"+alist.get(i).getCount());		
		out.print("</td></tr>");
	}
%>
</table>
<div class="d-grid gap-2 col-6 mx-auto">
<input class="cen" type="button" onclick="window.close()" value="닫기">
</div>
</div>
</body>
</html>