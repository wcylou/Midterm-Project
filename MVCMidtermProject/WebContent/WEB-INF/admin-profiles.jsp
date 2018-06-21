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
	<h2>Profiles</h2>
	<form action="addProfile.do" method="GET">
		<button type="submit" class="btn btn-dark">Add New Profile</button>
	</form>
	<%-- Profile list items --%>
	<ul>
		<c:forEach items="${profileList}" var="profile">
			<li><a href="getProfile.do?id=${profile.id}">${profile.firstName} ${profile.lastName}</a></li>
		</c:forEach>

	</ul>


	<form action="logout.do">
		<input type="submit" value="Log Out">
	</form>
</body>
</html>