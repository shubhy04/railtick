<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.TrainBean" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <title>RailTick - Train Details</title>
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

    .container {
      max-width: 1200px;
      margin-top: 20px;
    }

    .table-container {
      margin-top: 20px;
    }

    .table-container table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .table-container th, .table-container td {
      padding: 12px;
      border: 1px solid #dee2e6;
      text-align: left;
    }

    .table-container th {
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
    }

    .table-container th:hover {
      background-color: #0056b3;
    }

    .btn-see-fare {
      display: block;
      
    }

    .btn-book-train {
      display: block;
      margin-top: 20px;
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
              <a class="dropdown-item" href="viewuserprofile">View Profile</a>
              <a class="dropdown-item" href="edituserprofile">Update Profile</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="userlogout">Logout</a>
            </div>
          </li>
          <!-- End User Dropdown -->
        </ul>
      </div>
    </div>
  </nav>

  <!-- Train Details Table -->
  <div class="container table-container">
    <h2 class="text-center mb-4">Train Details</h2>
    <table class="table">
      <thead>
        <tr>
          <th>Train Name</th>
          <th>Train Number</th>
          <th>From Station</th>
          <th>To Station</th>
          <th>Seats</th>
          <th>Fare </th>
        </tr>
      </thead>
      <tbody>
           
        <% 
            TrainBean trainData = (TrainBean) request.getAttribute("trainData");
            if (trainData != null) {
        %>
            <tr>
                <td><%= trainData.getTr_name() %></td>
                <td><%= trainData.getTr_no() %></td>
                <td><%= trainData.getFrom_stn() %></td>
                <td><%= trainData.getTo_stn() %></td>
                <td><%= trainData.getSeats() %></td>
                <td><a class="btn btn-primary btn-see-fare" href='fare?trainNo=<%= trainData.getTr_no() %>&fromStn=<%= trainData.getFrom_stn() %>&toStn=<%= trainData.getTo_stn() %>'>See fare</a></td>
            </tr>
        <% 
            } else {
        %>
            <!-- Handle the case when trainData is null -->
            <tr>
                <td colspan="7">No train data available</td>
            </tr>
        <% 
            } 
        %>
      </tbody>
    </table>
  </div>
  

  <!-- Book Train Button -->
  <div class="container">
   <a class="btn btn-success btn-book-train" href='booktrainbyref?trainNo=<%= trainData.getTr_no() %>&fromStn=<%= trainData.getFrom_stn() %>&toStn=<%= trainData.getTo_stn() %>'>Book Now</a>
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
</body>
</html>
