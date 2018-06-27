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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Add Event</title>
</head>
<body class="standardLayout">
<%@ include file="nav.jsp" %>
	<div class="container formInput">
		<h1>ADD EVENT</h1>
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
			<form:label path="state">State:</form:label>
			<form:input path="state" />
			<form:errors path="state" />
			<br/>
			<br/>
			<form:label path="city">City:</form:label>
			<form:input path="city" />
			<form:errors path="city" />
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
			Interests<br>
			Food &nbsp&nbsp<input type="checkbox" id="Food" name="interests" value="Food" />
		    Music&nbsp&nbsp<input type="checkbox" id="Music" name="interests" value="Music" />
		    Tattoo&nbsp&nbsp<input type="checkbox" id="Tattoo" name="interests" value="Tattoo" /> 
		    America&nbsp&nbsp<input type="checkbox" id="America" name="interests" value="America" /> <br>
		    Children&nbsp&nbsp<input type="checkbox" id="Children" name="interests" value="Children" /> 
		    Health&nbsp&nbsp<input type="checkbox" id="Health" name="interests" value="Health" />
		    Sports&nbsp&nbsp<input type="checkbox" id="Sports" name="interests" value="Sports" />
		    Comedy&nbsp&nbsp<input type="checkbox" id="Comedy" name="interests" value="Comedy" />
			<button type="submit" class="btn btn-light">Add</button>
			</form:form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>