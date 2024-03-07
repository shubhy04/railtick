<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <!-- SweetAlert CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
 
  <title>RailTick - Home Page</title>
  <style>
    body {
      background-color: #f8f9fa;
    }

    .navbar {
      background-color: #343a40;
      padding: 20px 0;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .navbar-brand {
      font-size: 1.5rem;
      font-weight: bold;
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

    .jumbotron {
      background-image: url('https://img.freepik.com/free-photo/urban-landscape-tokyo-city-subway-station_23-2149347212.jpg?t=st=1709562465~exp=1709566065~hmac=c6b9dd47e6283dda1766c84af96cfa9e276a95317499b75881890fef57027df1&w=996');
      background-size: cover;
      color: #fff;
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
    }

    .testimonial-section {
      background-color: #fff;
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
      background-color: #343a40;
      color: #fff;
      padding: 50px 0;
      text-align: center;
    }

    .cta-icon {
      font-size: 2rem;
      margin-bottom: 20px;
    }

    .services-section {
      background-color: #fff;
      padding: 50px 0;
    }

    .services-icon {
      font-size: 4rem;
      color: #343a40;
      margin-bottom: 20px;
    }

    .contact-section {
      background-color: #343a40;
      color: #fff;
      padding: 50px 0;
      text-align: center;
    }

    .footer {
      background-color: #343a40;
      color: #fff;
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

<!-- Jumbotron -->
<div class="jumbotron">
  <h1 class="display-4">Railway Ticket Booking</h1>
  <p class="lead">Book your train tickets hassle-free</p>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 search-box">
        <form action="searchtrainservlet" method="post">
          <div class="input-group mb-3">
            <input type="text" name="trainnumber" class="form-control" placeholder="Enter Train Number" aria-label="Enter Train Number" aria-describedby="basic-addon2">
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
    <h2 class="text-center mb-4">Book Trains</h2>
    <div class="row">
      <div class="col-md-4">
        <div class="card">
          <img src="train1.jpg" class="card-img-top" alt="Train 1">
          <div class="card-body">
            <h5 class="card-title">View Trains </h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="userviewtrainfwd" class="btn btn-primary">Book Now</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card">
          <img src="train2.jpg" class="card-img-top" alt="Train 2">
          <div class="card-body">
            <h5 class="card-title">Search Trains </h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="trainbwstnfwd" class="btn btn-primary">Search</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card">
          <img src="train3.jpg" class="card-img-top" alt="Train 3">
          <div class="card-body">
            <h5 class="card-title">Search by TrainNo </h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <a href="usersearchtrain" class="btn btn-primary">Search</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Popular Destinations -->
  <div id="popular-destinations" class="destination-section">
    <div class="container">
      <h2 class="text-center mb-4">Other Features</h2>
      <div class="row">
        <div class="col-md-4 destination-card">
          <div class="card">
            <img src="destination1.jpg" class="card-img-top" alt="Destination 1">
            <div class="card-body">
              <h5 class="card-title">Fare Enquiry</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <a href="fareenqfwd" class="btn btn-primary">Check</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 destination-card">
          <div class="card">
            <img src="destination2.jpg" class="card-img-top" alt="Destination 2">
            <div class="card-body">
              <h5 class="card-title">Seat Availability</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <a href="useravailfwd" class="btn btn-primary">Check</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 destination-card">
          <div class="card">
            <img src="destination3.jpg" class="card-img-top" alt="Destination 3">
            <div class="card-body">
              <h5 class="card-title">Ticket Booking History</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
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
            <p class="mb-0">"Great service! Booking my train tickets was quick and easy. The trains were comfortable, and I had a pleasant journey."</p>
            <p class="text-muted">- John Doe</p>
          </div>
          <div class="testimonial-card">
            <p class="mb-0">"I highly recommend this railway booking platform. The user interface is intuitive, and the customer support is excellent."</p>
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
          <p>Book your tickets quickly and easily with our express booking system.</p>
        </div>
        <div class="col-md-4 text-center">
          <i class="fas fa-map-marked-alt services-icon"></i>
          <h4>Popular Destinations</h4>
          <p>Explore a variety of popular destinations and plan your journey with us.</p>
        </div>
        <div class="col-md-4 text-center">
          <i class="fas fa-ticket-alt services-icon"></i>
          <h4>Flexible Tickets</h4>
          <p>Choose from a range of flexible ticket options to suit your travel needs.</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Contact -->
  <div id="contact" class="contact-section">
    <div class="container">
      <h2 class="text-center mb-4">Contact Us</h2>
      <p class="text-center">Have questions or need assistance? Contact our support team.</p>
      <p class="text-center"><i class="fas fa-envelope"></i> info@railtick0@gmail.com</p>
      <p class="text-center"><i class="fas fa-phone"></i> +1 (555) 123-4567</p>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script>
        $(document).ready(function() {
            <% String updateMessage = (String) request.getAttribute("updateMessage"); %>
            <% if (updateMessage != null) { %>
                <% if ("SUCCESS".equalsIgnoreCase(updateMessage)) { %>
                    Swal.fire('Success', 'Your Profile has Been Successfully Updated', 'success');
                <% } else { %>
                    Swal.fire('Error', 'Please Enter the valid Information', 'error');
                <% } %>
            <% } %>
        });
    </script>
  <!-- Smooth Scroll -->
  <script>
    $('a[href*="#"]:not([href="#"])').on('click', function () {
      if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') && location.hostname === this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  </script>
</body>
</html>
