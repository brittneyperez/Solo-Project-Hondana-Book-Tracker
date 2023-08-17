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
        		<div id="User_Home_Dashboard" class="col-11 col-xl-10 px-5 py-3 mt-3 bg-white rounded-2">
            		<div id="UserControls_Header" class="d-flex align-items-center justify-content-between">            		
	            		<h3 class="fw-semibold mb-0">Welcome, <c:out value="${currentUser.firstName}" />.</h3>
	            		<div id="User-Navigation-Controls" class="d-flex justify-content-between gap-2">
	            			<!-- <a href="#" class="mb-0">Search</a> -->
	            			<a href="/book/add" class="mb-0 text-secondary fw-medium text-decoration-none">+ Book</a>
	            			<a href="/home" class="mb-0 text-primary-emphasis fw-semibold text-decoration-none">Home</a>
	            			<a href="/u/profile" class="mb-0 text-secondary fw-medium text-decoration-none">Profile</a>
	            		</div>
            		</div>
            		<hr />
            		<!--  -->
            		<div id="FlexDiv_Books_and_Followers" class="d-flex justify-content-between gap-2">            		
	            		<div id="FlexDiv_Left" class="col-12 col-lg-8">
	            			<div id="All_Books_Div">
			            		<h4 class="border-bottom border-3 pb-2 fw-semibold">All Books</h4>
			            		<c:choose>
									<c:when test="${empty otherUsersBooks}">
										<p class="text-center text-md-start">There are currently no books published by other users at this time.</p>
									</c:when>
									<c:otherwise>
										<c:forEach var="book" items="${otherUsersBooks}">
											<c:set var="isFavorite" value="false" />
											<c:forEach var="favoriteBook" items="${currentUser.favoriteBooks}">
												<c:if test="${favoriteBook.id eq book.id}">
													<c:set var="isFavorite" value="true" />
												</c:if>
											</c:forEach>
											<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
												<div id="FlexDivLeft_BookDetails">
													<h5><c:out value="${book.title}" /></h5>
													<h6>by @<c:out value="${book.writer.username}" /></h6>
													<p class="text-secondary">
														Published by: <a href="#" class="text-decoration-none text-secondary fw-medium">@<c:out value="${book.writer.username}" /></a>
													</p>
												</div>
												<div id="Button-Config" class="d-grid d-md-flex justify-content-md-end">
													<c:choose>
														<c:when test="${isFavorite}">
															<a href="/book/${book.id}/unfavorite" class="btn btn-outline-dark bt-sm fw-medium px-3 w-100 mb-3">Unfavorite</a>
														</c:when>
														<c:otherwise>
															<a href="/book/${book.id}/favorite" class="btn btn-dark bt-sm fw-medium px-3 w-100 mb-3">Add Favorite</a>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
	            			</div>
		            		<!--  -->
		            		<div id="My_Books_Div">
			            		<h4 class="border-bottom border-3 pb-2 fw-semibold">My Books</h4>
			            		<c:choose>
			            			<c:when test="${empty myBooks}">
			            				<p class="text-center text-md-start">You haven't published any books yet.</p>
			            			</c:when>
			            			<c:otherwise>
			            				<c:forEach var="book" items="${myBooks}">			            				
				            				<div id="Individual_Book_Item" class="border-bottom mb-3 d-sm-flex align-items-center justify-content-between">
		            							<div id="FlexDivLeft_BookDetails">
					            					<h5><c:out value="${book.title}" /></h5>
			            							<h6>by <c:out value="${book.writer.firstName}" /> <c:out value="${book.writer.lastName}" /></h6>
			            							<p class="text-secondary">Published: <fmt:formatDate value="${book.createdAt}" pattern="MMM d, yyyy • hh:mma" /></p>
		            							</div>
		            							<div id="Button-Config" class="d-sm-grid d-flex justify-content-between gap-1">
													<a href="/book/show/${book.id}/edit" class="btn btn-dark bt-sm fw-medium w-100 px-4 text-decoration-none">Edit</a>
													<a href="/book/${book.id}/delete" class="btn btn-danger bt-sm fw-medium w-100 px-4 text-decoration-none">Delete</a>
												</div>
		            						</div>
			            				</c:forEach>
			            			</c:otherwise>
			            		</c:choose>
		            		</div>
	            		</div>
	            		<!--  -->
	            		<div id="FlexDiv_Right" class="d-none d-lg-block col-lg-3">
		            		<h4 class="border-bottom border-3 pb-2">Fellow Readers</h4>
		            		<p class="mx-auto text-secondary">Follow feature coming soon!</p>
		            		<!-- SAMPLE -->
		            		<div id="User__Card" class="border-bottom py-2">
			            		<div id="FlexDiv_PFP_UserName" class="d-flex align-items-center justify-content-start">
									<span class="me-3">
										<img src="/images/abstract-user-flat-4.svg" alt="user-icon" style="height: 55px;" class="image-with-border">
									</span>
									<div id="Username_ActualName">
										<p class="fw-bold mb-0" style="font-size: 14px;">@username123 <br />
				            				<span class="fw-normal" style="font-size: 14px;">John Doe</span>
				            			</p>
									</div>
								</div>
		            		</div>
		            		<div id="User__Card" class="border-bottom py-2">
			            		<div id="FlexDiv_PFP_UserName" class="d-flex align-items-center justify-content-start">
									<span class="me-3">
										<img src="/images/abstract-user-flat-4.svg" alt="user-icon" style="height: 55px;" class="image-with-border">
									</span>
									<div id="Username_ActualName">
										<p class="fw-bold mb-0" style="font-size: 14px;">@username123 <br />
				            				<span class="fw-normal" style="font-size: 14px;">John Doe</span>
				            			</p>
									</div>
								</div>
		            		</div>
							<!--  -->
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