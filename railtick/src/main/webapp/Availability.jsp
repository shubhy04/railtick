<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <title>RailTick - Seat Availability</title>
  <style>
  
    .search-box {
      margin-top: 50px;
    }

    .form-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      position: relative;
    }

    .form-group i {
      position: absolute;
      top: 72%;
      right: 15px;
      transform: translateY(-50%);
      color: #ccc;
    }

    .btn-search {
      background-color: #007bff;
      border-color: #007bff;
    }

    .btn-search:hover {
      background-color: #0056b3;
      border-color: #0056b3;
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
<%@include file="global/navbar.jsp"%>

  <!-- Search Trains Form -->
  <div class="container search-box">
    <div class="row justify-content-center">
      <div class="col-md-6 form-container">
        <h2 class="text-center mb-4">Seats Available</h2>
        <form action="useravail" method="post">
          <div class="form-group">
            <label for="trainNumber">Enter Train Number:</label>
            <input type="text" name="trainnumber" class="form-control" id="trainNumber" placeholder="Train Number" required>
            <i class="fas fa-train"></i>
          </div>
          <button type="submit" class="btn btn-primary btn-search">Check Seats</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
  </footer>
  <!-- SweetAlert script for displaying alerts -->
<!-- SweetAlert script for displaying alerts -->
<script>
    <%-- Function to display a success message with larger font size for seats --%>
    function showSuccessMessage(message) {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            html: '<span style="font-size: 20px;">' + message + '</span>',
            showConfirmButton: true,
            confirmButtonText: 'Close',
            timer: 5000,  // Adjust the timer as needed
            timerProgressBar: true
        });
    }

    <%-- Function to display an error message --%>
    function showErrorMessage(message) {
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: message,
            showConfirmButton: true,
            confirmButtonText: 'Close',
            timer: 5000,  // Adjust the timer as needed
            timerProgressBar: true
        });
    }

    <%-- Check if the 'successMessage' attribute exists and display a success message --%>
    <% if (request.getAttribute("successMessage") != null) { %>
        showSuccessMessage('<%= request.getAttribute("successMessage") %>');
    <% } %>

    <%-- Check if the 'errorMessage' attribute exists and display an error message --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
        showErrorMessage('<%= request.getAttribute("errorMessage") %>');
    <% } %>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>
