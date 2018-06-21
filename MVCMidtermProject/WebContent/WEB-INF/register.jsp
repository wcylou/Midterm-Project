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
<body class="register">
	<div class="container">
	<br>
	<form:form action="addProfile.do" method="POST" modelAttribute="profile">
			<form:label path="firstName">First Name</form:label>
			<form:input path="firstName" />
			<form:errors path="firstName" />
			<br/>
			<form:label path="lastName">Last Name:</form:label>
			<form:input path="lastName" />
			<form:errors path="lastName" />
			<br/>
			<form:label path="age">Age:</form:label>
			<form:input path="age" />
			<form:errors path="age" />
			<br/>
			<form:label path="gender">Gender:</form:label>
			<form:input path="gender" />
			<form:errors path="gender" />
			<br/>
			<form:label path="sexualOrientation">Sexual Orientation:</form:label>
			<form:select path="sexualOrientation"/>
			<form:errors path="sexualOrientation" />
			<br>
			<form:label path="aboutMe">About Me:</form:label>
			<form:input path="aboutMe" />
			<form:errors path="aboutMe" />
			<br/>
			<form:label path="pictureUrl">Picture URL:</form:label>
			<form:input path="pictureUrl" />
			<form:errors path="pictureUrl" />
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