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
        		<div id="User_Home_Dashboard" class="col-11 col-lg-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="d-flex align-items-center justify-content-between">            		
	            		<h3 class="fw-semibold">Welcome, User</h3>
	            		<div id="User-Navigation-Controls" class="d-flex justify-content-between gap-2">
	            			<!-- <a href="#" class="mb-0">Search</a> -->
	            			<a href="/home" class="mb-0 text-secondary fw-medium text-decoration-none">Home</a>
	            			<a href="/u/profile" class="mb-0 text-primary-emphasis fw-semibold text-decoration-none">Profile</a>
	            		</div>
            		</div>
            		<hr />
            		<!--  -->
            		<div id="FlexDiv_Books_and_Profile" class="d-lg-flex justify-content-between">            		
						<div id="UserProfile_and_Name_Div" class="order-lg-2 order-1 pb-2 col-lg-4">
							<div id="UserName_UserStats" class="border-bottom border-3">
								<div id="FlexDiv_PFP_UserName" class="d-flex align-items-center justify-content-center justify-content-lg-start">
									<span class="me-3">
										<img src="/images/abstract-user-flat-4.svg" alt="user-icon" style="height: 55px;" class="image-with-border">
									</span>
									<div id="Username_ActualName">
										<h5>@jdoe</h5>
				            			<h5>Jane Doe</h5>
									</div>
								</div>
			           			<div id="User_Stats" class="pt-2 text-secondary d-flex justify-content-center gap-1" style="font-size: 14px;">
			            			<p>16 Books</p>
			            			<span>|</span>
			            			<div id="Follower_Count">	
				           				<p class="d-flex gap-1">
				           					<span>0</span>
				           					Followers
				           				</p>
			            			</div>
			            			<span>|</span>
			            			<div id="Following_Count">	
				           				<p class="d-flex gap-1">
				           					<span>0</span>	
				           					Following
				           				</p>
			            			</div>
			            		</div>
	           				</div>
		            		<div id="User_AboutMe">
		            			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eros in cursus turpis massa tincidunt dui. Tristique et egestas quis ipsum suspendisse ultrices. Amet aliquam id diam maecenas ultricies mi eget.</p>
		            		</div>
						</div>
						<div id="My_Books_Div" class="order-lg-1 order-2 mt-lg-0 mt-3 col-lg-7">
							<h4 class="border-bottom border-3 pb-2 fw-semibold">My Books</h4>
	            			<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
	            				<div id="FlexDivLeft_BookDetails">
		            				<h5>Where the Red Fern Grows</h5>
		            				<h6>by Wilson Rawls</h6>
		           					<p class="text-secondary">added by @username123</p>
	            				</div>
	           					<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
									<button class="btn btn-dark bt-sm fw-medium px-3 w-100 mb-3">Add Favorite</button>
								</div>
	           				</div>
	            			<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
	            				<div id="FlexDivLeft_BookDetails">
		            				<h5>Where the Red Fern Grows</h5>
		            				<h6>by Wilson Rawls</h6>
		           					<p class="text-secondary">added by @username123</p>
	            				</div>
	           					<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
									<button class="btn btn-outline-dark bt-sm fw-medium px-4 mb-3">Unfavorite</button>
								</div>
	           				</div>
	            			<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
	            				<div id="FlexDivLeft_BookDetails">
		            				<h5>Where the Red Fern Grows</h5>
		            				<h6>by Wilson Rawls</h6>
		           					<p class="text-secondary">added by @username123</p>
	            				</div>
	           					<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
									<button class="btn btn-outline-dark bt-sm fw-medium px-4 mb-3">Unfavorite</button>
								</div>
	           				</div>
						</div>
            		</div>
            		<!--  -->
        		</div>
		    </div>
		</div>
		<!-- End ~ FlexDiv_Books_and_Followers -->
		<footer id="Hondana_Footer" class="bg-dark text-light d-flex justify-content-center mt-4 p-2">
    		<p>Made with ❤︎ in Coding Dojo © 2023 本棚Hondana</p>
		</footer>
	</body>
</html>