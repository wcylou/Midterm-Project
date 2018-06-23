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
<title>Update Profile</title>
</head>
<body class = "updatePlayer">
<div class = "container">
<h1>Update Profile</h1>
 <form:form action="updateProfileDetails.do" method="POST" modelAttribute="profiledto2">
    <span class = "headings">Profile ID: </span><input type= "text" name="profileId" value="${profileUpdate.id}" readonly/><br>
    <span class = "headings">First Name:</span> <input type="text" type="text" name = "firstName" value="${profileUpdate.firstName}"/> <br> 
    <span class = "headings">Last Name: </span> <input type="text" name = "lastName" type="text" value="${profileUpdate.lastName}" /><br> 
    <span class = "headings">Age: </span><input type="text" name="age" value="${profileUpdate.age}"/><br> 
    <span class = "headings">Gender: </span> <input type="text" name="gender" value="${profileUpdate.gender}"/><br> 
    <span class = "headings">Sexual Orientation: </span>  <input type="text" name="sexualOrientation" value="${profileUpdate.sexualOrientation}"/><br> 
    <span class = "headings">About me: </span>  <input type="text" name="aboutMe" value="${profileUpdate.aboutMe}"/><br> 
   	<span class = "headings">Picture URL: </span>  <input type="text" name="pictureUrl" value="${profileUpdate.pictureUrl}"/><br> 
   	<span class = "headings">Min Age: </span>  <input type="text" name="minAge" value="${profileUpdate.minAge}"/><br> 
   	<span class = "headings">Max Age: </span>  <input type="text" name="maxAge" value="${profileUpdate.maxAge}"/><br> 
   	<span class = "headings">State: </span>  <input type="text" name="state" value="${profileUpdate.state}"/><br> 
   	<span class = "headings">City:</span>  <input type="text" name="city" value="${profileUpdate.city}"/><br> 
   	<span class = "headings">Address Line 1: </span>  <input type="text" name="address" value="${profileUpdate.address}"/><br> 
   	<span class = "headings">Address Line 2: </span>  <input type="text" name="address2" value="${profileUpdate.address2}"/><br> 
   	<span class = "headings">Zip Code: </span>  <input type="text" name="zipCode" value="${profileUpdate.zipCode}"/><br> 
	 <span class = "headings">Interests: </span>   
     	 <input type="checkbox" name="interests" value="Food" <c:if test="${interests.contains('Food')}">CHECKED</c:if> /><label for="Food">Food</label><br>
         <input type="checkbox" name="interests" value="Music" <c:if test="${interests.contains('Music')}">CHECKED</c:if> /><label for="Music">Music</label><br>
         <input type="checkbox" name="interests" value="Tattoo" <c:if test="${interests.contains('Tattoo')}">CHECKED</c:if> /><br><label for="Tattoo">Tattoo</label><br>
         <input type="checkbox" name="interests" value="America" <c:if test="${interests.contains('America')}">CHECKED</c:if> /><br><label for="America">America</label><br>
         <input type="checkbox" name="interests" value="Children" <c:if test="${interests.contains('Children')}">CHECKED</c:if> /><br><label for="Children">Children</label><br>
         <input type="checkbox" name="interests" value="Health" <c:if test="${interests.contains('Health')}">CHECKED</c:if> /><br><label for="Health">Health</label><br>
         <input type="checkbox" name="interests" value="America" <c:if test="${interests.contains('Sports')}">CHECKED</c:if> /><br><label for="Sports">Sports</label><br>
         <input type="checkbox" name="interests" value="Comedy" <c:if test="${interests.contains('Comedy')}">CHECKED</c:if> /><br><label for="Comedy">Comedy</label><br>
				<button type="submit" class="btn btn-dark">Update</button>
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