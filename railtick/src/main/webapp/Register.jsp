<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
         body {
            background:url('https://img.freepik.com/free-photo/old-city-view_1417-1737.jpg?t=st=1710060682~exp=1710064282~hmac=efb7f3a109df4dd107540f78b4d28c27e760072b3565b8b72c3e2af374eef09e&w=900') fixed; /* Replace 'your-background-image.jpg' with the path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-color: rgba(255, 255, 255, 0.7); /* Adjust the opacity here */
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
    color: #fffcf2;
  }

  .navbar-toggler-icon {
    background-color: #fffcf2;
  }

        .card {
        
            border: 0px !important;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #403d39;
            color: #fff;
            text-align: center;
            padding: 15px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #403d39;
            border: none;
        }

        .btn-primary:hover {
            background-color: #252422;
        }

        .forgot-password {
            text-align: center;
            margin-top: 15px;
        }

        .error-message{
            color: #dc3545;
            text-align: center;
            margin-top: 15px;
            
        }
        .success-message{
            color: #28a745;
            text-align: center;
            margin-top: 15px;
            
        }

        /* Show/hide password */
        .input-group-append {
            cursor: pointer;
        }
        .eye-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 1; /* Adjusted z-index to keep it above the input field */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">RailTick</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Login
                    </a>
                    <div class="dropdown-menu" aria-labelledby="loginDropdown">
                        <a class="dropdown-item" href="Login.jsp">User Login</a>
                        <a class="dropdown-item" href="AdminLogin.jsp">Admin Login</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Register.jsp">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>User Registration</h3>
                </div>
                <div class="card-body">
                    <form action="userreg" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="username">EmailID:</label>
                            <input type="email" class="form-control" id="username" name="mailid" placeholder="Enter your emailId" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="pword" placeholder="Enter your password" required>
                        </div>
                        <div class="form-group">
                            <label for="firstname">First Name:</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter your First Name" required>
                        </div>
                        <div class="form-group">
                            <label for="lastname">Last Name:</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter your Last Name" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Address:</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="Enter your Address" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Contact:</label>
                            <input type="text" class="form-control" id="phone" name="phoneno" placeholder="Enter your Contact Number" required>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheck" required>
                            <label class="form-check-label" for="termsCheck">I accept the terms and conditions</label>
                        </div>
                        <!-- Add more registration fields and validations as needed -->
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                        <div class="error-message">
                            <!-- Display registration errors here -->
                            <% 
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null && !errorMessage.isEmpty()) {
                                    out.println(errorMessage);
                                }
                            %>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var firstname = document.getElementById("firstname").value;
        var lastname = document.getElementById("lastname").value;
        var address = document.getElementById("address").value;
        var phone = document.getElementById("phone").value;
        var termsCheck = document.getElementById("termsCheck").checked;

        // Email validation
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(username)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Password validation (at least 8 characters with a mix of letters and numbers)
        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (!passwordRegex.test(password)) {
            alert("Password must be at least 8 characters long and contain both letters and numbers.");
            return false;
        }

        // Name validation (only letters and spaces allowed)
        var nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(firstname) || !nameRegex.test(lastname)) {
            alert("Please enter valid first and last names (only letters and spaces are allowed).");
            return false;
        }

        // Address validation (alphanumeric with spaces)
        var addressRegex = /^[a-zA-Z0-9\s]+$/;
        if (!addressRegex.test(address)) {
            alert("Please enter a valid address (only letters, numbers, and spaces are allowed).");
            return false;
        }

        // Phone number validation (exactly 10 digits)
        var phoneRegex = /^\d{10}$/;
        if (!phoneRegex.test(phone)) {
            alert("Please enter a valid 10-digit phone number.");
            return false;
        }

        // Terms and conditions check
        if (!termsCheck) {
            alert("Please accept the terms and conditions.");
            return false;
        }

        return true;
    }
</script>


</body>
</html>
