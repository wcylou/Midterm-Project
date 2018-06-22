
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Signika"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Event Details</title>
</head>
<body class="profileBody">
	<div class="container">
		<span class="headings">Event ID:</span>
		<c:out value="${event.id}" />
		<br> <span class="headings">Name: </span>
		<c:out value="${event.name}" />
		<br> <span class="headings">Description: </span>
		<c:out value="${event.description}" />
		<br> <span class="headings">Date: </span>
		<c:out value="${event.date}" />
		<br> <span class="headings">Location: </span>
		<c:out value="${event.location.address}" />
		<c:out value="${event.location.address2}" />
		<c:out value="${event.location.city}" />
		<c:out value="${event.location.state}" />
		<br> <span class="headings">Interests: </span>
		<ul>
			<c:forEach var="interest" items="${event.interests}">
				<li>${interest.name}</li>
			</c:forEach>
		</ul>
		<br>

		<form action="updateEvent.do" method="GET">
			<input type="hidden" name="eventId" value="${event.id}" />
			<button type="submit" class="btn btn-dark">Update</button>
		</form>
		<form action="index.do" method="GET">
			<button type="submit" class="btn btn-dark">Back</button>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>
