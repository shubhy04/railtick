<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin-bottom: 70px; /* Adjusted margin to accommodate the footer */
        }

        .navbar {
            background-color: #343a40;
            padding: 20px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
        }
 
        .navbar-logo {
            font-size: 1.8rem;
            color: #fff;
            margin-right: 5px;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        .user-dropdown {
            cursor: pointer;
        }

        .container {
            max-width: 1200px;
            margin-top: 20px;
        }

        .booking-details-container {
            margin-top: 20px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table td, .table th {
            border: 1px solid #dee2e6;
            padding: 15px;
            text-align: center;
        }

        .btn-pay-book {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-pay-book:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }     
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <!-- Railway Icon -->
        <span class="navbar-logo">&#128642;</span>
        <!-- Railway Booking Text -->
        <a class="navbar-brand" href="HomePage.jsp">RailTick</a>
        <!-- Navbar Toggler Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar Items -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#featured-trains">Book Trains</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#popular-destinations">Other Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#testimonials">Testimonials</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#services">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact</a>
                </li>
                <!-- User Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle user-dropdown" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="viewuserprofile"><i class="fas fa-user-circle"></i> View Profile</a>
                        <a class="dropdown-item" href="edituserprofile"><i class="fas fa-edit"></i> Update Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="userlogout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
                <!-- End User Dropdown -->
            </ul>
        </div>
    </div>
</nav>

<!-- Booking Details Container -->
<div class="container booking-details-container">
    <div>
        <h2 class="text-center mb-4">Your Ticket Booking Information</h2>
        <form action='payment' method='post'>
            <table class="table table-bordered">
                <tr>
                    <th><i class="fas fa-id-card"></i> USER ID</th>
                    <td>${emailId}</td>
                    <th><i class="fas fa-train"></i> Train NO</th>
                    <td>${trainNo}</td>
                </tr>
                <tr>
                    <th><i class="fas fa-map-marker-alt"></i> From Station</th>
                    <td>${fromStn}</td>
                    <th><i class="fas fa-map-marker-alt"></i> To Station</th>
                    <td>${toStn}</td>
                </tr>
                <tr>
                    <th><i class="far fa-calendar-alt"></i> Journey Date</th>
                    <td>
                        <input type='hidden' name='trainnumber' value='${trainNo}'>
                        <input type='date' name='journeydate' value='${today}' min='${today}' class="form-control">
                    </td>
                    <th><i class="fas fa-chair"></i> No of Seats</th>
                    <td><input type='number' name='seats' value='${seat}' class="form-control"></td>
                </tr>
                <tr>
                    <th><i class="fas fa-ticket-alt"></i> Select Class</th>
                    <td>
                        <select name='class' required class="form-control">
                            <option value='Sleeper(SL)'>Sleeper(SL)</option>
                            <option value='Second Sitting(2S)'>Second Sitting(2S)</option>
                            <option value='AC First Class(1A)'>AC First Class(1A)</option>
                            <option value='AC 2 Tier(2A)'>AC 2 Tier(2A)</option>
                        </select>
                    </td>
                    <th><i class="fas fa-bed"></i> Berth Preference</th>
                    <td>
                        <select name='berth' class="form-control">
                            <option value='NO'>No Preference</option>
                            <option value='LB'>Lower Berth(LB)</option>
                            <option value='UB'>Upper Berth(UB)</option>
                            <option value='C'>Cabin</option>
                        </select>
                    </td>
                </tr>
            </table>

            <p class="text-center"><button type='submit' class="btn btn-primary btn-pay-book"><i class="fas fa-money-check-alt"></i> Pay And Book</button></p>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p class="para">&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
