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
		<form:form action="addProfileDetails.do" method="POST" modelAttribute="profile">
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
			Gender
			<input id="man" value = "Man" name = "gender" type = "radio"/><label for = "man">Man</label>
			<input id="woman" value = "Woman" name = "gender" type = "radio"/><label for = "woman">Woman</label>
			<br>
			Sexuality
			<input id="heterosexual" value = "Heterosexual" name = "sexualOrientation" type = "radio"/><label for = "heterosexual">Heterosexual</label>
			<input id="homosexual" value = "Homosexual" name = "sexualOrientation" type = "radio"/><label for = "homosexual">Homosexual</label>
			<input id="bisexual" value = "Bisexual" name = "sexualOrientation" type = "radio"/><label for = "bisexual">Bisexual</label>
			<br>
			<form:label path="aboutMe">About Me:</form:label>
			<form:input path="aboutMe" />
			<form:errors path="aboutMe" />
			<br>
			<form:label path="pictureUrl">Picture URL:</form:label>
			<form:input path="pictureUrl" />
			<form:errors path="pictureUrl" />
			<br>
			<form:label path="minAge">Min Age:</form:label>
			<form:input path="minAge" />
			<form:errors path="minAge" />
			<br>
			<form:label path="maxAge">Max Age:</form:label>
			<form:input path="maxAge" />
			<form:errors path="maxAge" />
			<br>
			<form:label path="address">Address Line 1: </form:label>
			<form:input path="address" />
			<form:errors path="address" />
			<br>
			<form:label path="address2">Address Line 2: </form:label>
			<form:input path="address2" />
			<form:errors path="address2" />
			<br>
			<form:label path="state">State: </form:label>
			<form:input path="state" />
			<form:errors path="state" />
			<br>
			<form:label path="city">City: </form:label>
			<form:input path="city" />
			<form:errors path="city" />
			<br>
			<form:label path="zipCode">Zip Code: </form:label>
			<form:input path="zipCode" />
			<form:errors path="zipCode" />
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