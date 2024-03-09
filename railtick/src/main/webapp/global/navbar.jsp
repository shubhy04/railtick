<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar_Home</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
  }

  .navbar-logo {
  font-size: 1.5rem;
   
      margin-right: 5px;
    color: #fffcf2;
  }

  .navbar-toggler-icon {
    background-color: #fffcf2;
  }

  .user-dropdown {
    cursor: pointer;
  }
    .container {
      max-width: 1200px;
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
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar Items -->
        <div class="collapse navbar-collapse justify-content-end"
             id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="HomePage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="userviewtrainfwd">Book Trains</a></li>
				<!-- Search Train Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="searchTrainDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Search Train
                    </a>
                    <div class="dropdown-menu" aria-labelledby="searchTrainDropdown">
                        <a class="dropdown-item" href="usersearchtrain"><i class="fas fa-search"></i> Search by Number</a>
                        <a class="dropdown-item" href="trainbwstnfwd"><i class="fas fa-search"></i> Search by Name</a>
                    </div>
                </li>
                <!-- End Search Train Dropdown -->
                <!-- Other Features Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="otherFeaturesDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Other Features
                    </a>
                    <div class="dropdown-menu" aria-labelledby="otherFeaturesDropdown">
                        <a class="dropdown-item" href="fareenqfwd"><i class="fas fa-dollar-sign"></i> Fare Enquiry</a>
                        <a class="dropdown-item" href="useravailfwd"><i class="fas fa-chair"></i> Seat Availability</a>
                        <a class="dropdown-item" href="bookingdetails"><i class="fas fa-history"></i> Booking History</a>
                    </div>
                </li>
                <!-- End Other Features Dropdown -->
               
                <!-- User Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle user-dropdown" href="#"
                       id="userDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="viewuserprofile"><i
                                class="fas fa-user-circle"></i> View Profile</a>
                        <a class="dropdown-item" href="edituserprofile"><i
                                class="fas fa-edit"></i> Update Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="userlogout"><i
                                class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
                <!-- End User Dropdown -->
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>