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

<body class = "standardLayout">
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>

<%-- Output user details --%>
<div class = "container">
	<table class="table table-striped table-light table-hover">
		<thead class="thead-dark">
			<tr>
				<th colspan="2">Account Details</th>
			</tr>
		</thead>
		<c:out value="${matchHistory}"/>
		<tbody id = "table" >
				<tr>
					<td><span class = "headings">User ID: </span></td>
					<td><c:out value="${user.id}" /></td>
				</tr>
				<tr>
					<td><span class = "headings">Username: </span></td>
					<td><c:out value="${user.username}" /></td>
				</tr>
				<tr>
					<td><span class = "headings">Email: </span></td>
					<td><c:out value="${user.email}" /></td>
				</tr>
				<tr>
					<td><span class = "headings">Membership: </span></td>
					<td><c:out value="${user.membership}" /></td>
				</tr>
				<tr>
					<td><span class = "headings">Active: </span></td>
					<td><c:out value="${user.active}" /></td>
				</tr>
		</tbody>
	</table>

  <form action="updateUser.do" method="GET">
		<button type="submit" class="btn btn-light">Update</button>
	</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>