<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Signika" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Update Event</title>
</head>
<body class = "updateUser">
<div class = "container">
<h1>Update Event</h1>

      <form action="updateEvent.do" method="POST">
     	 <span class = "headings">Event ID</span> <input type="text" type="text" name = "eventId" value="${event.id}" readonly/> <br> 
        <span class = "headings">Name: </span> <input type="text" name = "name" type="text" value="${event.name}" /><br> 
       <span class = "headings">Description: </span><input type="text" name="description" value="${event.description}"/><br> 
       <span class = "headings">Address: </span><input type="text" name="address" value="${event.location.address}"/><br> 
       <span class = "headings">Address2: </span><input type="text" name="address2" value="${event.location.address2}"/><br> 
       <span class = "headings">City: </span><input type="text" name="city" value="${event.location.city}"/><br> 
       <span class = "headings">State: </span><input type="text" name="state" value="${event.location.state}"/><br> 
       <span class = "headings">Zip Code: </span><input type="text" name="zipCode" value="${event.location.zipCode}"/><br> 
       	<span class = "headings">Date: </span>  <input type="text" name="date" value="${event.date}"/><br> 
       	<span class = "headings">Interest 1: </span>  <input type="text" name="interest" value="${event.interests[0].name}"/><br> 
				<button type="submit" class="btn btn-dark">Update</button>
			</form>
		<form action="account.do" method="GET">
			<button type="submit" class="btn btn-dark">Back</button>
		</form>
    
    </div>
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>