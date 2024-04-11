<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RailTick</title>
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
	margin-right: 0rem !important;
}

.navbar-logo {
	color: #fffcf2;
}
.navbar-logo img {
    height: 45px !important; /* Set the desired height */
    width: auto !important; /* Let the width adjust automatically to maintain aspect ratio */
    max-width: none; /* Override max-width property */
    object-fit: contain; /* Maintain aspect ratio */
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
        <!-- Railway Booking Text -->
        <a class="navbar-brand" href="HomePage.jsp">RailTick</a>
            <span class="navbar-logo"><img src="RT_logo.png" alt="RailTick Logo" style="height: 24px; width: 24px;"></span>
        
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
                <li class="nav-item"><a class="nav-link" href="HomePage.jsp">User Home</a></li>
                <li class="nav-item"><a class="nav-link" href="AdminHome.jsp">Admin Home</a></li>
                <li class="nav-item"><a class="nav-link" href="adminviewtrainfwd">View Trains</a></li>
				<li class="nav-item"><a class="nav-link" href="adminsearchtrainfwd">Search Trains</a></li>
				<li class="nav-item"><a class="nav-link" href="addtrainfwd">Add Train</a></li>
				<li class="nav-item"><a class="nav-link" href="Adupdatetrain.jsp">Update Train</a></li>
       
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