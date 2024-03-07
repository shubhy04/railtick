<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Edit User Profile - RailTick</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
 <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
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

        .container {
            max-width: 800px;
            margin: 20px auto;
        }

        .tab {
            background-color: #343a40;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #dee2e6;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #6c757d; /* Lightened color */
            color: #fff;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        p {
    margin-top: 0;
    margin-bottom: 0rem;
}

        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }

        .error-message {
            color: red;
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
                <li class="nav-item"><a class="nav-link" href="featured-trains">Book Trains</a></li>
                <!-- Search Train Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="searchTrainDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Search Train
                    </a>
                    <div class="dropdown-menu" aria-labelledby="searchTrainDropdown">
                        <a class="dropdown-item" href="search-by-number"><i class="fas fa-search"></i> Search by Number</a>
                        <a class="dropdown-item" href="search-by-name"><i class="fas fa-search"></i> Search by Name</a>
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
                        <a class="dropdown-item" href="fare-enquiry"><i class="fas fa-dollar-sign"></i> Fare Enquiry</a>
                        <a class="dropdown-item" href="seat-availability"><i class="fas fa-chair"></i> Seat Availability</a>
                        <a class="dropdown-item" href="booking-history"><i class="fas fa-history"></i> Booking History</a>
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

<!-- Edit User Profile Container -->
<div class="container">
    <div class="tab">
        <p>Profile Update</p>
    </div>
    <form action="updateuserprofile" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>User Name :</td>
                <td><input type="text" name="username" value="<%= request.getAttribute("username") %>" disabled></td>
            </tr>
            <tr>
                <td>First Name :</td>
                <td><input type="text" name="firstname" id="firstname" value="<%= request.getAttribute("firstname") %>"></td>
                <td><span class="error-message" id="firstname-error"></span></td>
            </tr>
            <tr>
                <td>Last Name :</td>
                <td><input type="text" name="lastname" id="lastname" value="<%= request.getAttribute("lastname") %>"></td>
                <td><span class="error-message" id="lastname-error"></span></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td><input type="text" name="address" id="address" value="<%= request.getAttribute("address") %>"></td>
                <td><span class="error-message" id="address-error"></span></td>
            </tr>
            <tr>
                <td>Phone No:</td>
                <td><input type="text" name="phone" id="phone" value="<%= request.getAttribute("phone") %>"></td>
                <td><span class="error-message" id="phone-error"></span></td>
            </tr>
            <tr>
   				 
    			<td><input type="hidden" name="mail" id="email" value="<%= request.getAttribute("username") %>"></td>
    			
</tr>
        </table>
        <input type="submit" name="update" value="Update Profile">
    </form>
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



<script>
    function validateForm() {
        var firstname = document.getElementById("firstname").value.trim();
        var lastname = document.getElementById("lastname").value.trim();
        var address = document.getElementById("address").value.trim();
        var phone = document.getElementById("phone").value.trim();

        // Reset error messages
        document.getElementById("firstname-error").innerHTML = "";
        document.getElementById("lastname-error").innerHTML = "";
        document.getElementById("address-error").innerHTML = "";
        document.getElementById("phone-error").innerHTML = "";

        var isValid = true;

        // Validate First Name
        if (firstname === "") {
            document.getElementById("firstname-error").innerHTML = "First Name is required.";
            isValid = false;
        }

        // Validate Last Name
        if (lastname === "") {
            document.getElementById("lastname-error").innerHTML = "Last Name is required.";
            isValid = false;
        }

        // Validate Address
        if (address === "") {
            document.getElementById("address-error").innerHTML = "Address is required.";
            isValid = false;
        }

        // Validate Phone Number
        if (phone === "") {
            document.getElementById("phone-error").innerHTML = "Phone Number is required.";
            isValid = false;
        }

        return isValid;
    }
    
</script>
</body>
</html>