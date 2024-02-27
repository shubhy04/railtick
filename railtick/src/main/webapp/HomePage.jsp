<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RailTick - Railway Ticket Booking</title>
<%@include file="global/global_css.jsp"%>

<style type="text/css">
body {
    background-color: #f0f0f0; /* Light gray */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

header {
    text-align: center;
    margin-top: 30px;
}

h1 {
    color: #27374D; /* Dark blue*/
}

nav {
    margin-bottom: 20px;
}

nav a {
    color: #27374D; /* Dark blue */
    font-weight: bold;
    text-decoration: none; 
}

nav a:hover {
    color: #ffc107; /* Yellow color*/
}

.section, .booking-section {
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
    margin: 20px;
    padding: 15px;
    text-align: center;
    background-color: #ffc107; /* Yellow */
    color: #27374D;
}

.section:hover, .booking-section:hover {
    background-color: #ffd454; 
}

i {
    margin-right: 10px;
}

.booking-section h2 {
    margin-bottom: 15px;
}

.booking-button, .section a {
    background-color: #27374D; /* Dark blue  */
    color: #ffffff;
    padding: 10px 20px;
    font-size: 18px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-decoration: none; 
    display: inline-block;
    margin-top: 10px; 
}

.booking-button:hover, .section a:hover {
    background-color: #ba8b00; /* Yellow  */
}
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">RailTick</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link"
					href="userlogout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <header>
        <h1>Welcome to RailTick - Railway Ticket Booking</h1>

        <!-- Booking Section 
        <div class="booking-section">
            <h2>Book Your Ticket Now!</h2>
            <p>Explore our trains and secure your journey with RailTick.</p>
            <button class="booking-button"
                onclick="location.href='usersearchtrain'">Start Booking</button>
        </div>
-->
        <!-- Other Sections -->
        <div class="section">
            <h2>Search Trains</h2>
            <p>Find the train that suits your schedule and destination.</p>
            <a href="usersearchtrain" class="booking-button">Start Searching</a>
        </div>
        <div class="section">
            <h2>View Trains</h2>
            <p>Discover information about available trains and their routes.</p>
            <a href="userviewtrainfwd" class="booking-button">View Trains</a>
        </div>
        <div class="section">
            <h2>Trains Between Stations</h2>
            <p>Check the list of trains between your preferred stations.</p>
            <a href="trainbwstnfwd" class="booking-button">Explore Routes</a>
        </div>
        <div class="section">
            <h2>Booking History</h2>
            <p>Review your past ticket bookings and travel history.</p>
            <a href="bookingdetails" class="booking-button">View History</a>
        </div>
        <div class="section">
            <h2>Fare Enquiry</h2>
            <p>Get information about the fare for your desired journey.</p>
            <a href="fareenqfwd" class="booking-button">Check Fare</a>
        </div>
        
        <div class="section">
            <h2>Seat Availability</h2>
            <p>Ensure the availability of seats for your chosen train.</p>
            <a href="useravailfwd" class="booking-button">Check Availability</a>
        </div>
         
        <div class="section">
            <h2>User Profile</h2>
            <p>Manage your account details and preferences.</p>
            <a href="userprofile" class="booking-button">View Profile</a>
        </div>
    </header>
</body>
</html>
