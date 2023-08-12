<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
		<title>本棚Hondana</title>
	</head>
	<body class="bg-primary bg-opacity-10 d-flex flex-column min-vh-100">
		<header id="Hondana_Header" class="bg-dark d-flex align-items-center justify-content-between py-2 px-3 mb-3">
    		<a href="/home" class="fs-2 fw-bold text-decoration-none text-white" style="font-family: serif;">本棚Hondana</a>
    		<a href="/login" class="btn btn-light btn-sm px-3 fw-medium">Login</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="IndexPage" class="row d-flex justify-content-around">
        		<div id="SiteDescription_FlexDiv" class="col-11 col-md-4 col-lg-5 px-3 mb-3 mt-md-5">
            		<h2 class="fw-bold text-center text-sm-start">Your Personalized Book Tracking and Reader</h2>
            		<p>Discover, Connect and Engage with 本棚Hondana — Your one-stop app for tracking, sharing, and connecting with like-minded readers!</p>
        		</div>
        		<!--  -->
        		<div id="UserAuthentication_FlexDiv" class="col-11 col-md-6 col-lg-5 px-3 py-3 mt-md-5 bg-white rounded-2 text-center">
            		<h3 class="fw-bold text-secondary">Sign Up Today!</h3>
            		<form:form action="/register-user" method="post" modelAttribute="newUser" id="FormContents">
                		<!-- Name Input -->
                		<div id="NameInput_FlexDiv" class="d-sm-flex justify-content-between gap-1">                		
	                		<div id="FirstName_Input" class="form-group row my-3">
	                			<div class="col">
	                				<form:input type="text" path="firstName" autocomplete="off" placeholder="First Name" class="form-control" />
	                				<form:errors path="firstName" class="d-flex justify-content-center text-danger" />
	                			</div>
	                		</div>
	                		<!--  -->
	                		<div id="LastName_Input" class="form-group row my-sm-3 mb-3">
	                			<div class="col">
	                				<form:input type="text" path="lastName" autocomplete="off" placeholder="Last Name" class="form-control" />
	                				<form:errors path="lastName" class="d-flex justify-content-center text-danger" />
	                			</div>
	                		</div>
                		</div>
                		<!-- Email Input -->
                		<div id="Email_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="text" path="email" autocomplete="off" placeholder="Email" class="form-control" />
	               				<form:errors path="email" class="d-flex justify-content-center text-danger" />
	               			</div>
	               		</div>
                		<!-- Username Input -->
                		<div id="Username_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="text" path="username" autocomplete="off" placeholder="Username" class="form-control" />
	               				<form:errors path="username" class="d-flex justify-content-center text-danger" />
	               			</div>
	               		</div>
                		<!-- Password Input -->
                		<div id="Password_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="password" path="password" autocomplete="off" placeholder="Password" class="form-control" />
	               				<form:errors path="password" class="d-flex justify-content-center text-danger" />
	               			</div>
	               		</div>
	               		<div id="ConfirmPassword_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="password" path="confirmPassword" autocomplete="off" placeholder="Confirm Password" class="form-control" />
	               				<form:errors path="confirmPassword" class="d-flex justify-content-center text-danger" />
	               			</div>
	               		</div>
                		<!-- DOB Input -->
                		<div id="DateOfBirth_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="date" path="dateOfBirth" class="form-control" />
	               				<form:errors path="dateOfBirth" class="d-flex justify-content-center text-danger" />
	               			</div>
	               		</div>
                		<!-- Submit -->
                		<div class="d-flex justify-content-end mb-3">
                			<input type="submit" value="Register" class="btn btn-dark btn-sm px-3" />
                		</div>
            		</form:form>
            		<div id="LoginLink" class="d-flex justify-content-between align-items-center">
						<hr class="flex-grow-1 mx-3"> <!-- Horizontal line above -->
						<p class="m-0">Already a Member? <a href="/login">Log in</a></p>
						<hr class="flex-grow-1 mx-3"> <!-- Horizontal line below -->
					</div>
        		</div>
		    </div>
		</div>
		<!--  -->
		<footer id="Hondana_Footer" class="bg-dark text-light d-flex justify-content-center p-2">
    		<p>Made with ❤︎ in Coding Dojo © 2023 本棚Hondana</p>
		</footer>
	</body>
</html>