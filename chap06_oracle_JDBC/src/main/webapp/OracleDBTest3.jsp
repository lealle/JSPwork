<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JDBC를 이용한 ORACLE 연동</h1>

<%
	try {
			Class.forName("oracle.jdbc.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free","tjoeun","1234");
			System.out.println("Success");
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from department");

%>
	<table border="1">
		<tr>
			<th>DEPT_ID</th>
			<th>DEPT_TITLE</th>
			<th>LOCATION_ID</th>
		</tr>
<%
			while(rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString(2);
				String location = rs.getString(3);
%>
		<tr>
			<td>
				<%=id %>
			</td>
			<td>
				<%=title %>
			</td>
			<td>
				<%=location %>
			</td>
		</tr>
	
<% 
		}
%>		

	</table>
<% 
		
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.out.println("jdbc 드라이버 없음");
	}		catch (SQLException e) {
		e.printStackTrace();
		System.out.println("db버전 혹은 사용자명, 비밀번호가 안 맞음");
	}
%>
</body>
</html>