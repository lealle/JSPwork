<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page  import="java.sql.* , java.util.*, oracleDB.*" %>

<!DOCTYPE html>

<jsp:useBean id ="empBean" class="oracleDB.LocationPool"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Bean을 이용한 Oracle 연동</h1>


	<table border="1">
		<tr>
			<th>지역코드</th>
			<th>국가코드</th>
			<th>지역명</th>

		</tr>

<%
	ArrayList<LocationBean> alist = empBean.getLocation();
	for(int i=0; i<alist.size(); i++){
		// ArrayList는 size()
		LocationBean bean = alist.get(i);
%>
	<tr>
		<td>
			<%=bean.getLocal_code() %>	
		</td>
		<td>
			<%=bean.getNational_code() %>
		</td>
		<td>
			<%=bean.getLocal_name() %>
		</td>
	</tr>

<% 		
	}
%>
			
	


	</table>
</body>

</html>