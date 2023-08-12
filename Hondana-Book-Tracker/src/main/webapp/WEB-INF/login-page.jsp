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
		<title>Log In | 本棚Hondana</title>
	</head>
	<body class="bg-primary bg-opacity-10 d-flex flex-column min-vh-100">
		<header id="Hondana_Header" class="bg-dark d-flex align-items-center justify-content-between py-2 px-3 mb-3">
    		<a href="/home" class="fs-2 fw-bold text-decoration-none text-white" style="font-family: serif;">本棚Hondana</a>
    		<a href="/register" class="btn btn-light btn-sm px-3 fw-medium">Register</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="LoginPage" class="row d-flex justify-content-center">
        		<!--  -->
        		<div id="UserAuthentication_FlexDiv" class="col-md-8 col-lg-5 col-10 px-3 py-3 mt-md-5 bg-white rounded-2 text-center">
            		<h3 class="fw-bold text-secondary">Login</h3>
            		<form:form action="/login-user" method="post" modelAttribute="loginUser" id="FormContents">
                		<!-- Email/Username Input -->
                		<div id="EmailUsername_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="text" path="loginCredential" autocomplete="off" placeholder="Email/Username" class="form-control" />
	               			</div>
	               		</div>
                		<!-- Password Input -->
                		<div id="Password_Input" class="form-group row mb-3">
	                		<div class="col">
	                			<form:input type="password" path="password" autocomplete="off" placeholder="Password" class="form-control" />
	               			</div>
	               		</div>
	               		<form:errors path="loginCredential" class="d-flex justify-content-center text-danger" />	               		
	               		<form:errors path="password" class="d-flex justify-content-center text-danger" />
                		<!-- Submit -->
                		<div class="d-flex justify-content-end mb-3">
                			<input type="submit" value="Login" class="btn btn-dark btn-sm px-3" />
                		</div>
            		</form:form>
            		<div id="LoginLink" class="d-flex justify-content-between align-items-center pb-2">
						<hr class="flex-grow-1 mx-3"> <!-- Horizontal line above -->
						<p class="m-0">New here? <a href="/register">Sign up!</a></p>
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