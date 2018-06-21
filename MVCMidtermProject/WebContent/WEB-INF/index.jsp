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
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Home</title>
</head>
<body>
  <nav class="navbar navbar-expand-md fixed-top" id="mainNav">
    <a href="#page-top">Dating</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars"></i>
      </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active ml-auto">
          <a class="nav-link" href="#aboutus" data-toggle="collapse" data-target=".navbar-collapse.show">About Us</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link " href="#testimonials" data-toggle="collapse" data-target=".navbar-collapse.show">Testimonials</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link " href="#pricing" data-toggle="collapse" data-target=".navbar-collapse.show">Pricing</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#footer" data-toggle="collapse" data-target=".navbar-collapse.show">Contact us</a>
        </li>
        <li class="nav-item ml-auto">
          <a class="nav-link" href="#" data-toggle="collapse" data-target=".navbar-collapse.show">Login</a>
        </li>
      </ul>
    </div>
  </nav>
  
  <section id ="#aboutus">
  	<div class = "container">
  	<div class = "row">
  	
  	</div>
  	</div>
  
  </section>
  
  <section id = "#testimonials">
	<div class = "container">
  	<div class = "row">
  	
  	</div>
  	</div>  
  </section>
  
  <section id = "pricing">

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
    
   	<div class="row contact-info">
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

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/main.js"></script>
</body>
</html>
