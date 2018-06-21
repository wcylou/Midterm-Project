<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
	<h2>Admin Options</h2>

	<%-- Admin detail buttons --%>
	<form action="getEvents.do" method="GET">
		<button type="submit" class="btn btn-dark">See All Events</button>
	</form>
	<form action="getProfiles.do" method="GET">
		<button type="submit" class="btn btn-dark">See All Profiles</button>
	</form>


	<form action="logout.do">
		<input type="submit" value="Log Out">
	</form>
</body>
</html>