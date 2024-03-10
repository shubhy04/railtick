<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Edit User Profile - RailTick</title>
 <style>

        .tab {
            background-color: #403d39;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px;
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
            background-color: #ccc5b9; 
            color: #403d39;
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
            background-color: #403d39;
            color: #fffcf2;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
			background-color: #252422;        }
        p {
    margin-top: 0;
    margin-bottom: 0rem;
}
.profile-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

   .footer {
            background-color: #403d39;
      		color: #fffcf2;
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
<%@include file="global/navbar.jsp"%>

<div class="container profile-container">
<!-- Edit User Profile Container -->

    <div class="tab">
        <p>Profile Update</p>
    </div>
    <form action="updateuserprofile" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <th>User Name :</th>
                <td><input type="text" name="username" value="<%= request.getAttribute("username") %>" disabled></td>
            </tr>
            <tr>
                <th>First Name :</th>
                <td><input type="text" name="firstname" id="firstname" value="<%= request.getAttribute("firstname") %>"></td>
                <td><span class="error-message" id="firstname-error"></span></td>
            </tr>
            <tr>
                <th>Last Name :</th>
                <td><input type="text" name="lastname" id="lastname" value="<%= request.getAttribute("lastname") %>"></td>
                <td><span class="error-message" id="lastname-error"></span></td>
            </tr>
            <tr>
                <th>Address :</th>
                <td><input type="text" name="address" id="address" value="<%= request.getAttribute("address") %>"></td>
                <td><span class="error-message" id="address-error"></span></td>
            </tr>
            <tr>
                <th>Phone No:</th>
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