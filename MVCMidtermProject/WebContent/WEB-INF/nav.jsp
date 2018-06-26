<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Register</title>
</head>
<body class="register">

	<c:if test="${!loggedIn}">
	 <nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">BLINDR</a>
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
		<c:if test="${adminLoggedIn}">
			<nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">BLINDR</a>
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
			          <a class="nav-link " href="getProfiles.do" data-target=".navbar-collapse.show">Get Profiles</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="getEvents.do" data-target=".navbar-collapse.show">Get Events</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="findmatches.do" data-target=".navbar-collapse.show">See Matches</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="matchhistory.do" data-target=".navbar-collapse.show">Match History</a>
			        </li>
			         <li class="nav-item ml-auto">
			          <a class="nav-link " href="inbox.do" data-target=".navbar-collapse.show">Inbox</a>
			        </li>
					 <li class="nav-item ml-auto">
			          <a class="nav-link " href="logout.do" data-target=".navbar-collapse.show">Logout</a>
			        </li>
			      </ul>
			    </div>
			</nav>
			</c:if>
	</c:if>

	<c:if test="${loggedIn}">
	<c:if test="${!adminLoggedIn}">
	<c:if test= "${profileCreated}">
		<nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">BLINDR</a>
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
			          <a class="nav-link " href="findmatches.do" data-target=".navbar-collapse.show">See Matches</a>
			        </li>
			        <li class="nav-item ml-auto">
			          <a class="nav-link " href="matchhistory.do" data-target=".navbar-collapse.show">Match History</a>
			        </li>
			         <li class="nav-item ml-auto">
			          <a class="nav-link " href="inbox.do" data-target=".navbar-collapse.show">Inbox</a>
			        </li>
					<li class="nav-item ml-auto">
			          <a class="nav-link " href="logout.do" data-target=".navbar-collapse.show">Logout</a>
			        </li>
			      </ul>
			    </div>
			</nav>
	  </c:if>
	  </c:if>
	</c:if>
	
	<c:if test="${loggedIn}">
	<c:if test="${!adminLoggedIn}">
		<c:if test = "${!profileCreated}">
			<nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
			  <a class="navbar-brand" href="index.do">BLINDR</a>
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
					 <li class="nav-item ml-auto">
			          <a class="nav-link " href="logout.do" data-target=".navbar-collapse.show">Logout</a>
			        </li>
			      </ul>
			    </div>
			</nav>
		</c:if>
		</c:if>
	</c:if>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>