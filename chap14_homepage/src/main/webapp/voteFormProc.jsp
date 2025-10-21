<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vote.*"  import = "java.util.ArrayList" %>
    
<jsp:useBean id="vDao" class="vote.VoteDao"/>

<%
	int listnum = 0;// 안넘어올 경우 쓰는 변수
	// 변수 없을때 널 들어와서 그걸 인트형으로 바꿀려하기에 오류 발생 
	if(!(request.getParameter("num")== null || request.getParameter("num").equals(""))){
		listnum = 	Integer.parseInt(request.getParameter("num"));
	}
	String[] itemnum = request.getParameterValues("itemnum"); // 여러개면 Values
	
	boolean result = vDao.updateCount(listnum, itemnum);
	String msg = "투표가 등록되지 않았습니다";
	if(result){
		msg = "투표가 정상적으로 등록 되었습니다";
	}
	

	
%>

<script>
	alert("<%=msg%>");
	location.href="voteList.jsp?num=<%=listnum%>";

</script>



    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>