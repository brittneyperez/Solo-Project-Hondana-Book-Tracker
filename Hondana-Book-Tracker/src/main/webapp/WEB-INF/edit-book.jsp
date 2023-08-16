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
		<title>Edit Book | 本棚Hondana</title>
	</head>
	<body class="bg-primary bg-opacity-10 d-flex flex-column min-vh-100">
		<header id="Hondana_Header" class="bg-dark d-flex align-items-center justify-content-between py-2 px-3 mb-3">
    		<a href="/home" class="fs-2 fw-bold text-decoration-none text-white" style="font-family: serif;">本棚Hondana</a>
    		<a href="/logout" class="btn btn-light btn-sm px-3 fw-medium">Logout</a>
		</header>
		<!--  -->
		<div class="container-fluid flex-grow-1">
    		<div id="AddBook_FlexDiv" class="row d-flex justify-content-center">
        		<!--  -->
        		<div id="User_Dashboard" class="col-11 col-lg-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="d-flex align-items-center justify-content-between">            		
	            		<h3 class="fw-semibold mb-0">Edit Book</h3>
	            		<div id="User-Navigation-Controls" class="d-flex justify-content-between gap-2">
	            			<!-- <a href="#" class="mb-0">Search</a> -->
	            			<a href="/book/add" class="mb-0 text-primary-emphasis fw-semibold text-decoration-none">+ Book</a>
	            			<a href="/home" class="mb-0 text-secondary fw-medium text-decoration-none">Home</a>
	            			<a href="/u/profile" class="mb-0 text-secondary fw-medium text-decoration-none">Profile</a>
	            		</div>
            		</div>
            		<hr />
            		<!--  -->          		
	            	<div id="FlexDiv_Left" class="mt-2 col-lg-10 col-12 text-start">
						<form:form action="/book/${bookToEdit.id}/update" method="post" modelAttribute="bookToEdit">
							<input type="hidden" name="_method" value="put" />
							<!-- Title Input -->
							<div class="form-group row mx-5 mb-3">
								<form:label path="title" class="col-md-3 col-form-label"><strong>Title:</strong></form:label>
								<div class="col-md-9">
									<form:input type="text" path="title" class="form-control" style="border-color: gainsboro; border-width: 2px;" />
									<form:errors path="title" class="d-flex justify-content-center text-danger" />
								</div>
							</div>
							<!-- Book Details Input -->
							<div class="form-group row mx-5 mb-3">
								<form:label path="bookDetails" class="col-md-3 col-form-label"><strong>Details:</strong></form:label>
								<div class="col-md-9">
									<form:textarea path="bookDetails" rows="8" cols="40" class="form-control" style="border-color: gainsboro; border-width: 2px;"></form:textarea>
									<form:errors path="bookDetails" class="d-flex justify-content-center text-danger" />
								</div>
							</div>
							<!-- Submit Button -->
							<div class="d-flex justify-content-end  gap-2 mb-3 me-5">
								<a href="/home" class="btn btn-secondary bt-sm px-4 text-decoration-none">Cancel</a>
								<input type="submit" value="Save Changes" class="btn btn-dark btn-sm" />
							</div>
						</form:form>
						<div id="BookTimestamps">
								<p class="text-secondary fw-light" style="font-size: 14px;">
									<span>Published: <fmt:formatDate value="${bookToEdit.createdAt}" pattern="MMM d, yyyy • hh:mma" /></span> <br />
									<c:choose>
										<c:when test="${not empty bookToEdit.updatedAt }">
											<span>Last Edited: <fmt:formatDate value="${bookToEdit.updatedAt}" pattern="MMM d, yyyy • hh:mma" /></span>
										</c:when>
										<c:otherwise>
											<span class="invisible">None</span>
										</c:otherwise>
									</c:choose>
								</p>
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