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

	<c:if test="${!loggedIn}">
	 <nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">DATING 101</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ml-auto">
			        <li class="nav-item ml-auto">
			          <a class="nav-link" href="register.do" data-target=".navbar-collapse.show">Register</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="login.do" data-target=".navbar-collapse.show">Login</a>
			        </li>
			      </ul>
			    </div>
			</nav>
	</c:if>

	<c:if test="${loggedIn}">
	<c:if test= "${profileCreated}">
		<nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">DATING 101</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ml-auto">
			        <li class="nav-item ml-auto">
			          <a class="nav-link" href="account.do" data-target=".navbar-collapse.show">My Account</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="updateProfile.do" data-target=".navbar-collapse.show">Update Profile</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="#pricing" data-target=".navbar-collapse.show">See Past Matches</a>
			        </li>
					   <form action="logout.do" method="GET">
						<button type="submit"  class="btn btn-dark">Logout</button>
					</form>
			      </ul>
			    </div>
			</nav>
	  </c:if>
	</c:if>
	
	<c:if test="${loggedIn}">
		<c:if test = "${!profileCreated}">
			<nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">DATING 101</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ml-auto">
			        <li class="nav-item ml-auto">
			          <a class="nav-link" href="account.do" data-target=".navbar-collapse.show">My Account</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="addProfile2.do" data-target=".navbar-collapse.show">Create Profile</a>
			        </li>
					   <form action="logout.do" method="GET">
						<button type="submit"  class="btn btn-dark">Logout</button>
					</form>
			      </ul>
			    </div>
			</nav>
		</c:if>
	</c:if>

	
logged in ${loggedIn}
profile ${profileCreated}
</body>
</html>