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
<title>Home</title>
</head>
<body id = "home">
  <nav id = "mainNav" class="navbar navbar-light navbar-static-top fixed-top navbar-expand-lg">
  <a class="navbar-brand" href="#home">NAME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#about" data-target=".navbar-collapse.show">Who are we</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link " href="#resume" data-target=".navbar-collapse.show">Testimonials</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link " href="#pricing" data-target=".navbar-collapse.show">Pricing</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#contact" data-target=".navbar-collapse.show">Contact</a>
        </li>
        <form action="register.do" method="GET">
			<button type="submit"  class="btn btn-dark">Register</button>
		</form>
		   <form action="login.do" method="GET">
			<button type="submit"  class="btn btn-dark">Login</button>
		</form>
		
      </ul>
    </div>
</nav>
  
  <section id ="aboutus" class ="banner">
  <div class="container intro-content">
      <div class="row">
        <div class="intro-text mx-auto">
        </div>
      </div>
    </div> 		
  </section>
  
  <section id = "testimonials ">
	<div class = "container lightSection">
  	<div class = "row">
  	<h1>About us</h1>
  	<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque in eleifend sem, vel egestas lorem. Nam vel lectus nunc. Sed tempus, nisi vestibulum consequat tincidunt, velit orci lobortis dui, sit amet gravida ligula dolor a lectus. Etiam quis semper elit, sed dapibus ligula. Ut efficitur neque ante, at auctor massa placerat venenatis. Mauris consectetur blandit quam imperdiet scelerisque. Proin sit amet faucibus tellus. Ut bibendum rutrum laoreet. Suspendisse non felis a felis vulputate finibus. Etiam pellentesque dictum tellus.

  	</p>

  	</div>
  	</div>  
  </section>
  
  
  <section id="stats" class="count-up">
		<div class="row col-lg-12">
				<div class="col-lg-2 ">
						<i class="far fa-heart fa-3x"></i>
						<h3 class="stat-count">300</h3>
						<h5 class="stat-title">Relationships Formed</h5>
				</div>
				<div class="col-lg-2 ">
						<i class="fas fa-music fa-3x"></i>
						<h3 class="stat-count">120 </h3>
						<h5 class="stat-title">Concerts Attended</h5>
				</div>
				<div class="col-lg-2">
						<i class="far fa-clock fa-3x"></i>
						<h3 class="stat-count">500</h3>
						<h5 class="stat-title">'Sorry I'm late' Texts Sent</h5>
				</div> 								
				<div class="col-lg-2">
						<i class="far fa-calendar-alt fa-3x"></i>
						<h3 class="stat-count">2400</h3>
						<h5 class="stat-title">Events Suggested</h5>
				</div>
				<div class="col-lg-2">
						<i class="fas fa-home fa-3x"></i>
						<h3 class="stat-count">24</h3>
						<h5 class="stat-title">Marriages</h5>
				</div> 
				<div class="col-lg-2">
						<i class="far fa-smile-wink fa-3x"></i>
						<h3 class="stat-count">7200</h3>
						<h5 class="stat-title">Winky Faces</h5>
				</div> 
			</div>
	</section>
  
  <section id="pricing">

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Pricing</h1>
      <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It's built with default Bootstrap components and utilities with little customization.</p>
    </div>

    <div class="container">
      <div class="card-deck mb-3 text-center">
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Bronze</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$0 <small class="text-muted">/ mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>10 users included</li>
              <li>2 GB of storage</li>
              <li>Email support</li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-outline-primary">Sign up for free</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Silver</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$15 <small class="text-muted">/ mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>20 users included</li>
              <li>10 GB of storage</li>
              <li>Priority email support</li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary">Get started</button>
          </div>
        </div>
        <div class="card mb-4 box-shadow">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Gold</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">$29 <small class="text-muted">/ mo</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>30 users included</li>
              <li>15 GB of storage</li>
              <li>Phone and email support</li>
              <li>Help center access</li>
            </ul>
            <button type="button" class="btn btn-lg btn-block btn-primary">Contact us</button>
          </div>
        </div>
      </div>
    </div>
    </section>
    
  <section id="contact">
  <div class = "container">
   	<div class="row contact-us">
   		<div class="col-md-4">
   			<div class="icon">
   				<i class="fas fa-map-marker-alt"></i>
   			</div>
   			<h4>Find us</h4>
   			<p>Denver
            <br>
            Colorado
            <br>
            80223</p>
   		</div>
   		<div class="col-md-4">
   			<div class="icon">
   				<i class="far fa-envelope"></i>
   			</div>
   			<h4>Email Us</h4>
   			<p>dating@gmail.com</p>
   		</div>
   		<div class="col-md-4">
   			<div class="icon">
   				<i class="fas fa-phone"></i>
   			</div>
   			<h5>Call Us</h5>
   			<p>Phone: (720) 503 2312</p>
   		</div>
   	</div> 
   	</div>
</section>
    <div id="map"></div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script async defer
 	 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYZTFbiNh3s9QEXLnh-7dmVJJF0-3OBYM&callback=initMap">
</script>	
<script src="js/main.js"></script>
</body>
</html>

