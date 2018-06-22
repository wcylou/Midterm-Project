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
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Register</title>
</head>
<body class="register">

<nav>
	<c:if test="${loggedIn}">
	<nav class="navbar navbar-static-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="http://localhost:8080/MVCMidtermProject/index.do#home">DATING 101</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="navbar-nav ml-auto" href="account.do">My Account</a>
      <a class="navbar-nav ml-auto" href="updateUser.do">Update User</a>
      <a class="navbar-nav ml-auto" href="addProfile2.do">Create Profile</a>
      <a class="navbar-nav ml-auto" href="updateProfile.do">Update Profile</a>
      <a class="navbar-nav ml-auto" href="updateUser.do">See Past Matches</a>
      <a class="navbar-nav ml-auto" href="getEvent.do">See Events</a>
      <a class="navbar-nav ml-auto" href="logout.do">Logout</a>
    </div>
  </div>
</nav>
	</c:if>
	<c:if test="${!loggedIn}">
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
	</c:if>
	
</nav>
</body>
</html>