<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Signika" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Register</title>
</head>
<body class="addprofile">
	<div class="container">
		<form:form action="addEvent.do" method="POST" modelAttribute="dto">
			<form:label path="name">Name</form:label>
			<form:input path="name" />
			<form:errors path="name" />
			<br/>
			<form:label path="description">Description:</form:label>
			<form:input path="description" />
			<form:errors path="description" />
			<br/>
			<form:label path="address">Address:</form:label>
			<form:input path="address" />
			<form:errors path="address" />
			<br/>
			<br/>
			<form:label path="address2">Address2:</form:label>
			<form:input path="address2" />
			<form:errors path="address2" />
			<br/>
			<br/>
			<form:label path="city">City:</form:label>
			<form:input path="city" />
			<form:errors path="city" />
			<br/>
			<br/>
			<form:label path="state">State:</form:label>
			<form:input path="state" />
			<form:errors path="state" />
			<br/>
			<br/>
			<form:label path="zipCode">Zip Code:</form:label>
			<form:input path="zipCode" />
			<form:errors path="zipCode" />
			<br/>
			<form:label path="date">Date:</form:label>
			<form:input type="date" path="date" />
			<form:errors path="date" />
			<br/>
			<%-- This will eventually need to be checkboxes
			<form:label path="interests">Interests:</form:label>
			<form:input path="interests[0].name"/>
			<form:errors path="interests" />
			<br> --%>
			
			<button type="submit" class="btn btn-dark">Add</button>
			</form:form>
			<form action="index.do" method="GET">
				<button type="submit" class="btn btn-dark">Back</button>
			</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>