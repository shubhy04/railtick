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
            background: url('your-background-image.jpg') fixed;
            background-size: cover;
            opacity: 0.9;
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

        .card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
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
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #dc3545;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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

        // Basic validations, you may enhance as needed
        if (
            username.trim() === "" ||
            password.trim() === "" ||
            firstname.trim() === "" ||
            lastname.trim() === "" ||
            address.trim() === "" ||
            phone.trim() === "" ||
            !termsCheck
        ) {
            alert("Please fill in all required fields and accept the terms and conditions.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
