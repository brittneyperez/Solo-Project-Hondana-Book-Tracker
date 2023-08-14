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
    		<a href="/logout" class="btn btn-light btn-sm px-3 fw-medium">Logout</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="HomePage_FlexDiv" class="row d-flex justify-content-center">
        		<!--  -->
        		<div id="User_Home_Dashboard" class="col-11 col-lg-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="d-flex align-items-center justify-content-between">            		
	            		<h3 class="fw-semibold">Welcome, <c:out value="${currentUser.firstName}" />.</h3>
	            		<div id="User-Navigation-Controls" class="d-flex justify-content-between gap-2">
	            			<!-- <a href="#" class="mb-0">Search</a> -->
	            			<a href="/book/add" class="mb-0 text-secondary fw-medium text-decoration-none">+ Book</a>
	            			<a href="/home" class="mb-0 text-primary-emphasis fw-semibold text-decoration-none">Home</a>
	            			<a href="/u/profile" class="mb-0 text-secondary fw-medium text-decoration-none">Profile</a>
	            		</div>
            		</div>
            		<hr />
            		<!--  -->
            		<div id="FlexDiv_Books_and_Followers" class="d-flex justify-content-between">            		
	            		<div id="FlexDiv_Left" class="col-12 col-lg-7">
	            			<div id="All_Books_Div">
			            		<h4 class="border-bottom border-3 pb-2 fw-semibold">All Books</h4>
	            				<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
	            					<div id="FlexDivLeft_BookDetails">
		            					<h5>Where the Red Fern Grows</h5>
		            					<h6>by Wilson Rawls</h6>
		            					<p class="text-secondary">added by <a href="/u/show" class="text-decoration-none text-secondary fw-medium">@username123</a></p>
	            					</div>
	            					<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
										<button class="btn btn-dark bt-sm fw-medium px-3 w-100 mb-3">Add Favorite</button>
									</div>
	            				</div>
	            				<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
	            					<div id="FlexDivLeft_BookDetails">
		            					<h5>Where the Red Fern Grows</h5>
		            					<h6>by Wilson Rawls</h6>
		            					<p class="text-secondary">added by <a href="/u/show" class="text-decoration-none text-secondary fw-medium">@username123</a></p>
	            					</div>
	            					<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
										<button class="btn btn-outline-dark bt-sm fw-medium px-4 mb-3">Unfavorite</button>
									</div>
	            				</div>
	            			</div>
		            		<!-- <hr style="width: 500px;" /> -->
		            		<div id="My_Books_Div">
			            		<h4 class="border-bottom border-3 pb-2 fw-semibold">My Books</h4>
			            		<c:choose>
			            			<c:when test="${empty myBooks}">
			            				<p>You haven't registered any books yet.</p>
			            			</c:when>
			            			<c:otherwise>
			            				<c:forEach var="book" items="${myBooks}">			            				
				            				<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
		            							<div id="FlexDivLeft_BookDetails">
					            					<h5><c:out value="${book.title}" /></h5>
			            							<h6>by <c:out value="${book.author}" /></h6>
			            							<p class="text-secondary">added <fmt:formatDate value="${book.createdAt}" pattern="MMM d, yyyy • hh:mma" /></p>
		            							</div>
		            							<div id="Button-Config" class="d-sm-grid d-flex justify-content-between gap-1">
													<button class="btn btn-dark bt-sm fw-medium w-100 mb-3">Edit</button>
													<button class="btn btn-danger bt-sm fw-medium w-100 px-4 mb-3">Delete</button>
												</div>
		            						</div>
			            				</c:forEach>
			            			</c:otherwise>
			            		</c:choose>
		            		</div>
	            		</div>
	            		<!--  -->
	            		<div id="FlexDiv_Right" class="d-none d-lg-block col-lg-4">
		            		<h4 class="border-bottom border-3 pb-2">Followers</h4>
		            		<p class="mx-auto text-secondary">Feature Coming Soon!</p>
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