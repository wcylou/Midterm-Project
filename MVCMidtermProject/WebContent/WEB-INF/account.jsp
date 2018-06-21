<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>
<h2>Your Details</h2>

<%-- Output user details --%>
<c:out value="${user.username}"></c:out><br>
<c:out value="${user.access}"></c:out><br>

<form action="logout.do">
	<input type="submit" value="Log Out" > 
</form>
</body>
</html>