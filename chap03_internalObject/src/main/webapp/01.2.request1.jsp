<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

 String name = request.getParameter("name");
 String studentNum= request.getParameter("studentNum");
 String gender = request.getParameter("gender");
 String major = request.getParameter("major");
 String[] hobby = request.getParameterValues("hobby");
 /* String hobby = request.getParameter("hobby");
  배열이기에 배열로 받음*/
 
 if(gender.equals("M")){
	 gender = "남자";
 }else{
	 gender="여자";
 }

  
  /* 
 request.getParameterNames()
 request.getAttributeName()
 request.getAttribute()
 request.removeAttribute()
*/
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%=name %><p/>
	학번 : <%=studentNum%><p/>
	성별 : <%=gender %><p/>
	학과 : <%=major %><p/>
	취미 : 
	<%
		for(int i=0; i<hobby.length; i++){
			out.print(hobby[i] +" ");
		}
	%> <p/>
</body>
</html>