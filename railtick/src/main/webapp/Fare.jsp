<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>RailTick - Search Trains</title>
  <style>
       body {
      background-color: #FFF7F1;
      color: #403d39;
    }

    .search-box {
     text-align:center;
      margin-top: 50px;
    }

    .form-container {
       background-color: #ccc5b9;
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
    background-color: #403d39 !important;
    border-color: #403d39 !important;
    color: #fffcf2 !important;
    transition: background-color 0.3s;
  }

  .btn-search:hover {
    background-color: #252422 !important;
    border-color: #252422 !important;
  }


    .footer {
      background-color: #403d39;
      color: #fffcf2;
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
        <h2 class="text-center mb-4">Fare Enquiry</h2>
        <form action="fare" method="post">
          <div class="form-group">
            <label for="trainNumber">Enter Train Number:</label>
            <input type="text" name="trainnumber" class="form-control" id="trainNumber" placeholder="Train Number" required>
            <i class="fas fa-train"></i>
          </div>
          <button type="submit" class="btn btn-primary btn-search">See Fare</button>
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

</body>
</html>
