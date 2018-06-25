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
<title>Matches</title>
</head>
<body class = "standardLayout viewMatches">
<%@ include file="nav.jsp" %>
	
	<div class = "container">
		<h1>Matches</h1>
	<%-- Event list items --%>
<br><br>
		<form:form action="findevent.do" method="GET">

	<table class="table table-striped table-light table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Match Name</th>
				<th scope="col">Age</th>
				<th scope="col">Gender</th>
				<th scope="col">Sexuality</th>
				<th scope="col">State</th>
				<th scope="col">Interests</th>
			</tr>
		</thead>
		<tbody id = "table" >
		
		<c:forEach items="${matches}" var="match">
				<tr>
					<td><input value = "${match.id}" name = "matchId" type = "radio"/>
					<c:out value="${match.firstName} ${match.lastName}" /></td>
					<td><c:out value="${match.age}" /></td>
					<td><c:out value="${match.gender}" /></td>
					<td><c:out value="${match.sexualOrientation}" /></td>
					<td><c:out value="${match.location.state}" /></td>
					<td><c:out value="${match.interests}" /></td>
				</tr>
				<tr>
					<td colspan="2"><img src="<c:out value="${match.pictureUrl}" />"></td>
					<td colspan="4"><c:out value="${match.aboutMe}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="submit" class="btn btn-light">Submit</button>
			</form:form>
</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>
