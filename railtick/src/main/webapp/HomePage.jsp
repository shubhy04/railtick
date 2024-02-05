<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-Home Page</title>
<%@include file="global/global_css.jsp"%>
<style type="text/css">
a {
	color: #27374D;
}

a:hover {
	color: #526D82;
}
</style>
</head>
<body>

	<nav class="navbar navbar-light" style="background-color: #27374D;">
		<a class="navbar-brand navbar-light" href="index.jsp"> <img
			src="images/RT_Logo.png" width="50" height="50"
			class="d-inline-block align-top" alt=""> RailTick
		</a>
		<form class="form-inline">

			<a href="UserlogoutServlet" class="btn btn-outline-secondary ml-1"
				type="button">Logout</a> <a <%=session.getAttribute("Fname")%>></a>
		</form>
	</nav>

	<div class="container-fluid">
		<h2 class="text-center">Welcome to RailTick</h2>
	</div>
	<div class="container text-center">
		<div class="card card-body">
			<div class="col">
				<a href="UserViewTrainfwd">View Trains</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="TrainBwStnfwd">Trains Between Stations</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="BookingDetails">Ticket Booking History</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="FareEnqfwd">Fare Enquiry</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="UserAvailFwd">Seat Availability</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="UserSearchTrain">Search By TrainNo</a>
			</div>
		</div>
		<div class="card card-body mt-3">
			<div class="col">
				<a href="UserProfileServlet">Profile</a>
			</div>
		</div>
	</div>
</body>
</html>