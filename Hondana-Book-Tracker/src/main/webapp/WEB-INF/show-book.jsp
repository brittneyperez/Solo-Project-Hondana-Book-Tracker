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
		<title>Book Details | 本棚Hondana</title>
	</head>
	<body class="bg-primary bg-opacity-10 d-flex flex-column min-vh-100">
		<header id="Hondana_Header" class="bg-dark d-flex align-items-center justify-content-between py-2 px-3 mb-3">
    		<a href="/home" class="fs-2 fw-bold text-decoration-none text-white" style="font-family: serif;">本棚Hondana</a>
    		<a href="/logout" class="btn btn-light btn-sm px-3 fw-medium">Logout</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="EditBook_FlexDiv" class="row d-flex justify-content-center">
        		<!--  -->
        		<div id="User_Dashboard" class="col-11 col-lg-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="d-flex align-items-center justify-content-between">            		
	            		<h3 class="fw-semibold mb-0">Book Details</h3>
	            		<div id="User-Navigation-Controls" class="d-flex justify-content-between gap-2">
	            			<!-- <a href="#" class="mb-0">Search</a> -->
	            			<a href="/book/add" class="mb-0 text-secondary fw-medium text-decoration-none">+ Book</a>
	            			<a href="/home" class="mb-0 text-secondary fw-medium text-decoration-none">Home</a>
	            			<a href="/u/profile" class="mb-0 text-secondary fw-medium text-decoration-none">Profile</a>
	            		</div>
            		</div>
            		<hr />
            		<!--  -->          		
	            	<div id="FlexDiv_Left" class="mt-2 col-lg-8 col-12 text-start">
						<!-- Title -->
						<h3 id="Book_Title" class="fs-2 fw-bold mt-2 mb-1" style="font-family: serif;"><c:out value="${book.title}" /></h3>
						<c:choose>
							<c:when test="${currentUser.id == book.writer.id}">
								<a href="/u/profile" class="text-decoration-none fs-4 fw-medium text-info-emphasis" style="font-family: serif;"><c:out value="${book.writer.firstName}" /> <c:out value="${book.writer.lastName}" /></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="text-decoration-none fs-4 fw-medium text-info-emphasis" style="font-family: serif;">@<c:out value="${book.writer.username}" /></a>
							</c:otherwise>
						</c:choose>
						<p class="mt-3"><c:out value="${book.bookDetails}" /></p>
						<div id="Extra_Book_Details" class="d-flex justify-content-between align-items-center gap-2">
							<div id="BookTimestamps">
								<p class="text-secondary fw-light" style="font-size: 14px;">
									<span>Published: <fmt:formatDate value="${book.createdAt}" pattern="MMM d, yyyy • hh:mma" /></span> <br />
									<c:choose>
										<c:when test="${not empty book.updatedAt }">
											<span>Last Edited: <fmt:formatDate value="${book.updatedAt}" pattern="MMM d, yyyy • hh:mma" /></span>
										</c:when>
										<c:otherwise>
											<span class="invisible">None</span>
										</c:otherwise>
									</c:choose>
								</p>
							</div>
							<div id="PublisherOnly_ActionBtns" class="d-grid d-sm-flex justify-content-between gap-1">
								<c:choose>
									<c:when test="${currentUser.id == book.writer.id}">
										<a href="/book/show/${book.id}/edit" class="btn btn-dark bt-sm fw-medium w-auto px-4 text-decoration-none">Edit</a>
										<a href="/book/${book.id}/delete" class="btn btn-danger bt-sm fw-medium w-auto px-4 text-decoration-none">Delete</a>
									</c:when>
									<c:otherwise>
										<span class="invisible">...</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
            		</div>
            		<!--  -->
        		</div>
		    </div>
		</div>
		<!-- End ~ FlexDiv_AddBook_Page -->
		<footer id="Hondana_Footer" class="bg-dark text-light d-flex justify-content-center mt-4 p-2">
    		<p>Made with ❤︎ in Coding Dojo © 2023 本棚Hondana</p>
		</footer>
	</body>
</html>