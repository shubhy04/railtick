<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
   
    <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/old-city-view_1417-1737.jpg?t=st=1710060682~exp=1710064282~hmac=efb7f3a109df4dd107540f78b4d28c27e760072b3565b8b72c3e2af374eef09e&w=900'); /* Replace 'your-background-image.jpg' with the path to your image */
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
        <a class="navbar-brand" href="index.jsp">RailTick</a>
            <span class="navbar-logo"><img src="RT_logo.png" alt="RailTick Logo" style="height: 24px; width: 24px;"></span>
        
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

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>User Login</h3>
                </div>
                <div class="card-body">
                    <form action="userlogin" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="email" class="form-control" id="username" name="uname" placeholder="Enter Your Email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="pword" placeholder="Enter Your Password" required>
                                <i id="eye-icon" class="fa fa-eye eye-icon"></i>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                        <div class="forgot-password">
                            <a href="forgotPassword.jsp">Forgot Password?</a>
                        </div>
                        <div class="error-message">
                            <!-- Display login errors here -->
                            <% 
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null && !errorMessage.isEmpty()) {
                                    out.println(errorMessage);
                                }
                            %>
                        </div>
                        <div class="success-message">
                            <!-- Display success message here -->
                            <% 
                                String successMessage = (String) request.getAttribute("successMessage");
                                if (successMessage != null && !successMessage.isEmpty()) {
                                    out.println(successMessage);
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

        if (username.trim() === "" || password.trim() === "") {
            alert("Username and Password are required.");
            return false;
        }

        return true;
    }
    
    $(document).ready(function () {
        $("#eye-icon").click(function () {
            var passwordField = $("#password");
            var passwordFieldType = passwordField.attr('type');
            if (passwordFieldType === 'password') {
                passwordField.attr('type', 'text');
            } else {
                passwordField.attr('type', 'password');
            }
        });
    });

</script>

</body>
</html>
