<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Home</title>
</head>
<body id = "home">
  <nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-md">
  <a class="navbar-brand" href="#home">NAME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" 
  aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	<i class="fas fa-bars"></i>
  </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#aboutUs" data-toggle="collapse" data-target=".navbar-collapse.show">Who are we</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link " href="#pricing" data-toggle="collapse" data-target=".navbar-collapse.show">Pricing</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#contact" data-toggle="collapse" data-target=".navbar-collapse.show">Contact</a>
        </li>
        <form action="register.do" method="GET">
			<button type="submit" class="btn btn-light">Register</button>
		</form>
		&nbsp&nbsp&nbsp
        <form action="login.do" method="GET">
			<button type="submit" class="btn btn-light">Login</button>
		</form>
      </ul>
    </div>
</nav>
  
  <section class ="banner">
  <div class="container intro-content">
      <div class="row">
        <div class="intro-text mx-auto">
        </div>
      </div>
    </div> 		
  </section>
  
  <section id = "aboutUs">
	<div class = "container lightSection">
  	<h1>Who are we</h1><br>
	<p>Blindr was made for people who want more out of their dating site than just random singles in their area.  
	Deep, meaningful connections are built on common interests and shared experience. </p> 
	<p>A great first date can set the stage for a lasting relationship, or just leave a lasting memory of that one special night.  
	Our mission is to connect people and events to create that spark.  </p>
	<h4>Where you take things is completely up to you!</h4>
  

  	</div>  
  </section>
  
  
  <section id="stats" class="count-up">
		<div class="row col-lg-12">
				<div class="col-lg-2 col-6">
						<i class="far fa-heart fa-3x"></i>
						<h3 class="stat-count">300</h3>
						<h5 class="stat-title">Relationships Formed</h5>
				</div>
				<div class="col-lg-2 col-6">
						<i class="fas fa-music fa-3x"></i>
						<h3 class="stat-count">120 </h3>
						<h5 class="stat-title">Concerts Attended</h5>
				</div>
				<div class="col-lg-2 col-6">
						<i class="far fa-clock fa-3x"></i>
						<h3 class="stat-count">500</h3>
						<h5 class="stat-title">'Sorry I'm late' Texts Sent</h5>
				</div> 								
				<div class="col-lg-2 col-6">
						<i class="far fa-calendar-alt fa-3x"></i>
						<h3 class="stat-count">2400</h3>
						<h5 class="stat-title">Events Suggested</h5>
				</div>
				<div class="col-lg-2 col-6">
						<i class="fas fa-home fa-3x"></i>
						<h3 class="stat-count">24</h3>
						<h5 class="stat-title">Marriages</h5>
				</div> 
				<div class="col-lg-2 col-6">
						<i class="far fa-smile-wink fa-3x"></i>
						<h3 class="stat-count">7200</h3>
						<h5 class="stat-title">Winky Faces</h5>
				</div> 
			</div>
	</section>
	
	<section id ="instagramFeed">
	<div class = "container instagram2">
<iframe src="https://snapwidget.com/embed/563517" class="snapwidget-widget" allowTransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden; width:780px; height:770px"></iframe>
   </div>
   	</section>
   	
  <section id="pricing">
    <div class="container lightSection">
      	<h1>Membership Plans</h1><br>
      <div class="card-deck mb-3 text-center">
        <div class="card mb-4 box-shadow">
          <div class="card-header bronze">
            <h4 class="my-0 font-weight-normal">Bronze</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$0 <small class="text-muted">/ yr</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>5 matches per week</li>
              <li>No Messaging</li>
              <li>24/7 customer support</li>
              <br>
            </ul>
            <form action="register.do" method="GET">
            <button type="button" class="btn btn-lg btn-block btn-outline-danger">Sign up for free</button>
			</form>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header silver">
            <h4 class="my-0 font-weight-normal">Silver</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$4.99 <small class="text-muted">/ yr</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>25 matches per week</li>
              <li>No Messaging</li>
              <li>Invite to exclusive events</li>
              <li>24/7 customer support</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-danger">Get started</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header gold">
            <h4 class="my-0 font-weight-normal">Gold</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$9.99 <small class="text-muted">/ yr</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>Unlimited matches</li>
              <li>Can message other users</li>
              <li>Invite to exclusive events</li>
              <li>24/7 customer support</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-outline-danger">Contact us</button>
          </div>
        </div>
      </div>
    </div>
    </section>
    
  <section id="contact" class = "darkSection">
  <div class = "container">
  <br><br>
   	<div class="row contact-us">
   		<div class="col-sm-4">
   			<div class="icon">
   				<i class="fas fa-map-marker-alt fa-2x"></i>
   			</div><br>
   			<h4>Where are we</h4>
   			<p> 7400 E Orchard Rd <br>
            Greenwood Village <br>
            CO, 80111</p>
   		</div>
   		<div class="col-sm-4">
   			<div class="icon">
   				<i class="far fa-envelope fa-2x"></i>
   			</div><br>
   			<h4>Email Us</h4>
   			<p>dating@gmail.com</p>
   		</div>
   		<div class="col-sm-4">
   			<div class="icon">
   				<i class="fas fa-phone fa-2x"></i>
   			</div><br>
   			<h4>Call Us</h4>
   			<p>Phone: (720) 503 2312</p>
   		</div>
   	</div> 
   	</div>
</section>
    <div id="map"></div>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="js/main.js"></script>
	<script async defer
 	 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu3z8H8wEptTmzLK1unAnBejz0QmTc_h8&callback=initMap">
	</script>	

</body>
</html>

