<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1부터 10까지의 합계 : 
	<%-- <%
	int sum=0;
	String msg;
	for(int i=1; i<=10;i++){
		sum += i;
		if(i==10){
			out.print(i+"="+sum);
			break;
		}
		out.print(i+"+ ");
	}
	%> --%>
	<%
	int sum=0;
	String msg;
	for(int i=1; i<=10;i++){
		sum += i;
		if(i==10){
	%>
	<%= i+"=" %>
	<% 
			break;
		}
	%>
 	<%=i +"+" %>
 
 	<%
	}
	%>
	
	<%=sum %>
	<br>
	<%
		int[] intArr = new int[10];
		for(int i=0; i<intArr.length;i++){
			intArr[i] = i+1;
		
			%>
			<%=intArr[i] +" " %>
			<%
			/* out.print(intArr[i] +" "); */
		}
	%>
	
	
	
</body>
</html>