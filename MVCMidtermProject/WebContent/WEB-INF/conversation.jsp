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
<title>User Details</title>
</head>
<body class = "standardLayout">
<%@ include file="nav.jsp" %>

	<div class = "container formInput">
		<form action="replyMessage.do" method="POST" >
		<h3>Message</h3><input type="text" name="messageText" placeholder="Send a message" style="width:470px; height:100px;">
		<c:if test="${threadMessages[0].sender.id == profile.id }">
		<input type="hidden" name="matchProfile" value="${threadMessages[0].recipient.id}"/>
		</c:if>
		<c:if test="${threadMessages[0].recipient.id == profile.id }">
		<input type="hidden" name="matchProfile" value="${threadMessages[0].sender.id}"/>
		</c:if>
		<input type="hidden" name="threadId" value="${threadMessages[0].threadId}"/>
		<button type="submit" class="btn btn-light">Send</button>
		</form>
		</div>

	<div class="container messageContent">
				<c:forEach items="${threadMessages}" var="m">
				<div class="container senderMessage2">
						<br>
							<c:if test="${m.sender.id == profile.id }">
<!-- 							<div id="outer" style="width:200px; height:20px; border:1px solid red;"> -->
 							<span class="senderMessage">
							<span class = "dateSent"><c:out value="${m.dateSent}"/></span><br>
							<c:out value="${m.messageText}"/>
   										<!--  <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
   										 Integer mollis dui felis, vel vehicula tortor cursus nec</div> -->
							</span>
 						</c:if>
 				</div>
 				<div class="container recipientMessage2">
 						<br>
						<c:if test="${m.sender.id != profile.id }">
						<span class="recipientMessage">
							<span class = "dateSent"><c:out value="${m.dateSent}"/></span><br>
							 <c:out value= "${m.messageText}"/>
						</span>
						</c:if>
						<br>
				</div>
				</c:forEach>
				<br><br>
		</div>
	
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
	<script>
	$(document).ready(function () {
	    resize_to_fit();
	});

	function resize_to_fit(){
	    var fontsize = $('div#outer div').css('font-size');
	    $('div#outer div').css('fontSize', parseFloat(fontsize) - 1);

	    if($('div#outer div').height() >= $('div#outer').height()){
	        resize_to_fit();
	    }
	}
	</script>
</body>
</html>
