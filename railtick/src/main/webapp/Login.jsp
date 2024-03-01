<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RT-Login</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <%@include file="global/navbar.jsp"%>
    <section class="login-section">
        <h2>User Login</h2>
        <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <p class="error-message"><%=errorMessage%></p>
        <%
        }
        %>
        <form action="userlogin" method="post">
            <label for="uname">UserName:</label>
            <input type="text" id="uname" name="uname" placeholder="Enter Your Email" required>
            <label for="pword">Password:</label>
            <input type="password" id="pword" name="pword" placeholder="*****" required>
            <input type="submit" value="LOGIN">
        </form>
        
        <!-- Add "Forgot Password" link -->
        <p>Forgot your password? <a href="forgotPassword.jsp">Reset it here</a>.</p>
    </section>
</body>
</html>
