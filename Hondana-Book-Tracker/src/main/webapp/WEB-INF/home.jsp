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
		<title>Home | 本棚Hondana</title>
	</head>
	<body class="bg-primary bg-opacity-10 d-flex flex-column min-vh-100">
		<header id="Hondana_Header" class="bg-dark d-flex align-items-center justify-content-between py-2 px-3 mb-3">
    		<a href="/home" class="fs-2 fw-bold text-decoration-none text-white" style="font-family: serif;">本棚Hondana</a>
    		<a href="#" class="btn btn-light btn-sm px-3 fw-medium">Logout</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="HomePage_FlexDiv" class="row d-flex justify-content-center">
        		<!--  -->
        		<div id="User_Home_Dashboard" class="col-11 col-md-10 col-lg-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="">            		
	            		<h3 class="fw-semibold">Welcome, User</h3>
            		</div>
            		<hr />
            		<!--  -->
            		<div id="FlexDiv_Books_and_Followers" class="d-flex justify-content-between">            		
	            		<div id="FlexDiv_Left">            		
		            		<h4>All Books</h4>
		            		<h4>My Books</h4>
	            		</div>
	            		<!--  -->
	            		<div id="FlexDiv_Right">
		            		<h4>Followers</h4>
	            		</div>
            		</div>
            		<!--  -->
            		<p>Testing...</p>
        		</div>
		    </div>
		</div>
		<!--  -->
		<footer id="Hondana_Footer" class="bg-dark text-light d-flex justify-content-center p-2">
    		<p>Made with ❤︎ in Coding Dojo © 2023 本棚Hondana</p>
		</footer>
	</body>
</html>