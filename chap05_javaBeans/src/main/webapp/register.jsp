<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>

</head>
<body>
	<form method="post" action="registerProc.jsp" name="memForm">
		<table id="memtable">
		<tr>
		<th colspan="2">회원가입</th>
		</tr>
		
		
        	    <tr>
                <td>아이디 :</td>
                <td><input name="id" size="25"></td>
            </tr>
            <tr>
                <td>패스워드 :</td>
                <td><input type="password" name="pw" size="25"></td>
            </tr>
            <tr>
                <td>패스워드 확인 :</td>
                <td><input type="password" name="pwCheck" size="25"></td>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><input name="name" size="25"></td>
            </tr>
            <tr>
                <td>생년월일 :</td>
                <td><input name="birth" size="25"></td>
            </tr>
            <tr>
                <td>이메일 :</td>
                <td><input type="email" name="email" size="25"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" value="회원가입" onClick="inputCheck()">
                    &emsp;
                    <input type="reset" value="다시쓰기">
                </td>
            </tr>
        </table>	
	
	</form>
	
	<!--  <input type="submit" value="회원가입"> &emsp; <input type="reset" value="다시쓰기">-->
	<!-- <input type="button" value="회원가입" onClick="inputCheck()"> &emsp; <input type="reset" value="다시쓰기">
	 -->
	

</body>
</html>