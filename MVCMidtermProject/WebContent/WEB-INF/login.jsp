<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>
<h2>Log In</h2>
<form:form action="login.do" modelAttribute="user">
	Username<form:input path="username"/>
	<form:errors path="username"/><br>
	Password<form:password path="password"/>
	<form:errors path ="password"/>
	<input type="submit" value="Log In" > 
</form:form>
</body>
</html>