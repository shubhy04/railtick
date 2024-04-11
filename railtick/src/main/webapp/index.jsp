<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!-- SweetAlert CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

<title>RailTick - Index Page</title>
<style>
body {
	background-color: #FFF7F1;
	color: #403d39;
}

.navbar {
	background-color: #252422;
	padding: 20px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
	color: #fffcf2;
	font-size: 1.5rem;
	font-weight: bold;
	margin-right: 0rem !important;
}

.navbar-logo {
	color: #fffcf2;
}

.navbar-logo img {
	height: 45px !important; /* Set the desired height */
	width: auto !important;
	/* Let the width adjust automatically to maintain aspect ratio */
	max-width: none; /* Override max-width property */
	object-fit: contain; /* Maintain aspect ratio */
}

.navbar-toggler-icon {
	background-color: #fffcf2;
}

.user-dropdown {
	cursor: pointer;
}

.user-dropdown .dropdown-menu a.dropdown-item {
	color: #252422 !important;
	/* Change this color to your desired color */
}

.user-dropdown .dropdown-menu a.dropdown-item:hover {
	background-color: #e8ddd4 !important;
	/* Change this color to your desired hover color */
	color: #252422 !important;
	/* Change this color to your desired hover text color */
}

.jumbotron {
	background-color: #f6eee9;
	background-image: url('train.jpg');
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	color: #403d39;
	font-weight: bold; /* Added font-weight property */
	text-align: center;
	padding: 150px 0;
	margin-bottom: 0;
}

.search-box {
	margin-top: 50px;
}

.card {
	margin: 20px 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
}

.card:hover {
	transform: scale(1.02);
}

.card-img-top {
	height: 200px;
	object-fit: cover;
}

.destination-section {
	padding: 50px 0;
	background-color: #FFF7F1;
}

.testimonial-section {
	padding: 50px 0;
}

.testimonial-card {
	border: 1px solid #e9ecef;
	border-radius: 10px;
	padding: 20px;
	margin: 20px 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.testimonial-card p {
	margin-bottom: 0;
}

.cta-section {
	background-color: #403d39;
	color: #fffcf2;
	padding: 50px 0;
	text-align: center;
}

.cta-icon {
	font-size: 2rem;
	margin-bottom: 20px;
	color: #fffcf2;
}

.services-section {
	padding: 50px 0;
}

.services-icon {
	font-size: 4rem;
	color: #403d39;
	margin-bottom: 20px;
}

.contact-section {
	background-color: #e8ddd4;
	color: #fffcf2;
	padding: 50px 0;
	text-align: center;
}

.btn-primary {
	background-color: #403d39 !important;
	color: #fffcf2 !important;
	border: 1px solid #403d39;
}

.btn-primary:hover {
	background-color: #252422 !important;
	border: 1px solid #252422;
}

.footer {
	background-color: #403d39;
	color: #fffcf2;
	padding: 20px 0;
	text-align: center;
}
</style>

</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<!-- Railway Icon -->
			<!-- Railway Booking Text -->
			<a class="navbar-brand" href="#">RailTick</a> <span
				class="navbar-logo"><img src="RT_logo.png"
				alt="RailTick Logo" style="height: 24px; width: 24px;"></span>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Navbar Items -->
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="#featured-trains">Book Trains</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#popular-destinations">Other Features</a></li>
					<li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#services">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
					<!-- User Dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle user-dropdown" href="#"
						id="userDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-user"></i>
					</a>
						<div class="dropdown-menu" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="Login.jsp"><i
								class="fas fa-user-circle mr-1"></i> User Login</a> <a
								class="dropdown-item" href="AdminLogin.jsp"><i
								class="fas fa-user-lock"></i> Admin Login</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="Register.jsp"><i
								class="fas fa-user-plus"></i> Register</a>
						</div></li>
					<!-- End User Dropdown -->
				</ul>
			</div>
		</div>
	</nav>

	<!-- Jumbotron -->
	<div class="jumbotron">
		<h1 class="display-4">Railway Ticket Booking</h1>
		<p class="lead">Book your train tickets hassle-free</p>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 search-box">
					<form action="searchtrainservlet" method="post">
						<div class="input-group mb-3">
							<input type="text" name="trainnumber" class="form-control"
								placeholder="Enter Train Number" aria-label="Enter Train Number"
								aria-describedby="basic-addon2" required>
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Featured Trains -->
	<div id="featured-trains" class="container">
		<h2 class="text-center">Book Trains</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<img src="booktrain.jpg" class="card-img-top" alt="Train 1">
					<div class="card-body">
						<h5 class="card-title">View Trains</h5>
						<p class="card-text">Discover information about available
							trains and their routes.</p>
						<a href="userviewtrainfwd" class="btn btn-primary">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img
						src="https://img.freepik.com/free-vector/train-station-scene-with-steam-locomotive_1308-94853.jpg?t=st=1710009177~exp=1710012777~hmac=86e09be60f704af0bf268fde30b403b1a2bfbd556ee3bc3fbf2202c71a572fb5&w=1060"
						class="card-img-top" alt="Train 2">
					<div class="card-body">
						<h5 class="card-title">Search Trains</h5>
						<p class="card-text">Check the list of trains between your
							preferred stations.</p>
						<a href="TrainBwStn.jsp" class="btn btn-primary">Search</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="trainno.jpg" class="card-img-top" alt="Train 3">
					<div class="card-body">
						<h5 class="card-title">Search by Train No</h5>
						<p class="card-text">Search the desired trains between your
							preferred stations by train number .</p>
						<a href="usersearchtrain" class="btn btn-primary">Search</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Popular Destinations -->
	<div id="popular-destinations" class="destination-section ">
		<div class="container">
			<h2 class="text-center">Other Features</h2>
			<div class="row">
				<div class="col-md-4 destination-card">
					<div class="card">
						<img
							src="https://img.freepik.com/free-vector/flat-design-train-ticket-template_52683-115394.jpg?w=900&t=st=1710006983~exp=1710007583~hmac=c488078c7658aa9d2c78129013c94342f39ca822f372169250b220263f527416"
							class="card-img-top" alt="Destination 1">
						<div class="card-body">
							<h5 class="card-title">Fare Enquiry</h5>
							<p class="card-text">Check the fare prices of all the coaches
								of desired train.</p>
							<a href="Fare.jsp" class="btn btn-primary">Check</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 destination-card">
					<div class="card">
						<img
							src="https://img.freepik.com/free-vector/train-wagon-interior-with-empty-seats-luggage-shelf-3d-isometric-vector-illustration_1284-81207.jpg?t=st=1710010041~exp=1710013641~hmac=a772d1997d8e5120eb279a8de60a15dcc60e9277aed49bf433d2c3998be3325e&w=740"
							class="card-img-top" alt="Destination 2">
						<div class="card-body">
							<h5 class="card-title">Seat Availability</h5>
							<p class="card-text">Ensure the availability of seats for
								your chosen train.</p>
							<a href="Availability.jsp" class="btn btn-primary">Check</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 destination-card">
					<div class="card">
						<img
							src="https://img.freepik.com/free-vector/hand-drawn-train-ticket-template_23-2150447626.jpg?t=st=1710009999~exp=1710013599~hmac=d839eb8b5535eda3451ffdb8c5cff2ac33fbce26ec3512dd9b81eb89e843b166&w=1060"
							class="card-img-top" alt="Destination 3">
						<div class="card-body">
							<h5 class="card-title">Ticket Booking History</h5>
							<p class="card-text">Review your past ticket bookings and
								travel history.</p>
							<a href="bookingdetails" class="btn btn-primary">Check</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Testimonials -->
	<div id="testimonials" class="testimonial-section">
		<div class="container">
			<h2 class="text-center mb-4">What Our Customers Say</h2>
			<div class="row">
				<div class="col-md-6 mx-auto">
					<div class="testimonial-card">
						<p class="mb-0">"Great service! Booking my train tickets was
							quick and easy. The trains were comfortable, and I had a pleasant
							journey."</p>
						<p class="text-muted">- John Doe</p>
					</div>
					<div class="testimonial-card">
						<p class="mb-0">"I highly recommend this railway booking
							platform. The user interface is intuitive, and the customer
							support is excellent."</p>
						<p class="text-muted">- Jane Smith</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Services -->
	<div id="services" class="services-section">
		<div class="container">
			<h2 class="text-center mb-4">Our Services</h2>
			<div class="row">
				<div class="col-md-4 text-center">
					<i class="fas fa-train services-icon"></i>
					<h4>Express Booking</h4>
					<p>Book your tickets quickly and easily with our express
						booking system.</p>
				</div>
				<div class="col-md-4 text-center">
					<i class="fas fa-map-marked-alt services-icon"></i>
					<h4>Popular Destinations</h4>
					<p>Explore a variety of popular destinations and plan your
						journey with us.</p>
				</div>
				<div class="col-md-4 text-center">
					<i class="fas fa-ticket-alt services-icon"></i>
					<h4>Flexible Tickets</h4>
					<p>Choose from a range of flexible ticket options to suit your
						travel needs.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact -->
	<div id="contact" class="contact-section">
		<div class="container">
			<h2 class="text-center mb-4">Contact Us</h2>
			<p class="text-center">Have questions or need assistance? Contact
				our support team.</p>
			<p class="text-center">
				<i class="fas fa-envelope"></i> info@railtick0@gmail.com
			</p>
			<p class="text-center">
				<i class="fas fa-phone"></i> +91 9594698507
			</p>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<p>&copy; 2024 RailTick. All rights reserved.</p>
		</div>
	</footer>

	<!-- Bootstrap JS and Popper.js -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!-- Smooth Scroll -->
	<script>
		$('a[href*="#"]:not([href="#"])').on(
				'click',
				function() {
					if (location.pathname.replace(/^\//, '') === this.pathname
							.replace(/^\//, '')
							&& location.hostname === this.hostname) {
						var target = $(this.hash);
						target = target.length ? target : $('[name='
								+ this.hash.slice(1) + ']');
						if (target.length) {
							$('html, body').animate({
								scrollTop : target.offset().top
							}, 1000);
							return false;
						}
					}
				});
	</script>
</body>
</html>
