<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <jsp:useBean id="member" class="beans.RegisterBean"/>
	<jsp:setProperty name="member" property="*"/>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
        	    <tr>
                <td>아이디 :</td>
                <td><jsp:getProperty property="id" name="member"/></td>
            </tr>
            <tr>
                <td>패스워드 :</td>
                <td><jsp:getProperty name="member" property="pw"/></td>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><jsp:getProperty name="member" property="name"/></td>
            </tr>
            <tr>
                <td>생년월일 :</td>
                <td><jsp:getProperty name="member" property="birth"/></td>
            </tr>
            <tr>
                <td>이메일 :</td>
                <td><jsp:getProperty name="member" property="email"/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" value="확인완료" >
                    &emsp;
                    <input type="button" value="다시쓰기" onclick="history.back();">
                </td>
            </tr>
        </table>	



</body>
</html>