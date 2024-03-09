<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User Profile - RailTick</title>
    <style>
       

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

        .profile-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .profile-heading {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }

        .profile-subheading {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #007bff;
        }

        .profile-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .profile-table, .profile-table th, .profile-table td {
            border: 1px solid #dee2e6;
        }

        .profile-table th, .profile-table td {
            padding: 15px;
            text-align: left;
        }

        .profile-table th {
            background-color: #6c757d; /* Lightened color */
            color: #fff;
        }

        .update-profile-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .update-profile-btn:hover {
            background-color: #0056b3;
        }

        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<%@include file="global/navbar.jsp"%>


<!-- User Profile Container -->
<div class="container profile-container">
    <h2 class="profile-heading">Hello <%= request.getAttribute("userName") %>! Welcome to RailTick</h2>
    <p class="profile-subheading">User Profile View</p>
    <table class="profile-table">
        <tr>
            <th>User Name</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getMailId() %></td>
        </tr>
        <tr>
            <th>First Name</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getFName() %></td>
        </tr>
        <tr>
            <th>Last Name</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getLName() %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getAddr() %></td>
        </tr>
        <tr>
            <th>Phone No</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getPhNo() %></td>
        </tr>
        <tr>
            <th>Mail Id</th>
            <td><%= ((com.railtick.beans.UserBean)request.getAttribute("userProfile")).getMailId() %></td>
        </tr>
    </table>
    <a href="edituserprofile" class="update-profile-btn"><i class="fas fa-edit"></i> Update Profile</a>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
