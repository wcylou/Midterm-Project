<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Signika" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css"></head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>
<h2>Your Details</h2>

<%-- Output user details --%>
<div class = "container">
Username: <c:out value="${user.username}"></c:out><br>
Password: <c:out value="${user.password}"></c:out><br>
Email: <c:out value="${user.email}"></c:out><br>
Membership: <c:out value="${user.membership}"></c:out><br>
Active: <c:out value="${user.active}"></c:out><br>

  <form action="updateUser.do" method="GET">
		<button type="submit" class="btn btn-dark">Update</button>
	</form>
	<form action="logout.do" method="GET">
		<button type="submit" class="btn btn-dark">Logout</button>
	</form>
	<form action="login.do" method="GET">
		<button type="submit" class="btn btn-dark">Back</button>
	</form>
	</div>
</body>
</html>