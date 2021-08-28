<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal" var="principal"/>
    </sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label for="id">아이디</label>
	<input type="text" id="id">
	
	<label for="password">패스워드</label>
	<input type="password" id="password">

</body>
</html>