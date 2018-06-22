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

 <nav class="navbar navbar-static-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="http://localhost:8080/MVCMidtermProject/index.do#home">DATING 101</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <form action="register.do" method="GET">
			<button type="submit"  class="btn btn-dark">Register</button>
		</form>
		   <form action="login.do" method="GET">
			<button type="submit"  class="btn btn-dark">Login</button>
		</form>
    </div>
  </div>
</nav>

	<div class="container">
		<form:form action="registerUser.do" method="POST" modelAttribute="user">
			<form:label path="username">Username:</form:label>
			<form:input path="username" />
			<form:errors path="username" />
			<br/>
			<form:label path="password">Password:</form:label>
			<form:input path="password" />
			<form:errors path="password" />
			<br/>
			<form:hidden path="access" value="false" />
			<form:hidden path="active" value="true" />
			<form:label path="email">Email:</form:label>
			<form:input path="email" />
			<form:errors path="email" />
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