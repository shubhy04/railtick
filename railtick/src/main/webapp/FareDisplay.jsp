<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fare Details</title>
    <style>
        .fare-details-container {
            margin-top: 20px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table td, .table th {
            border: 1px solid #dee2e6;
            padding: 15px;
            text-align: center;
        }

        .btn-back {
            margin-top: 20px;
        }
        .blue-text {
    color: blue;
}
        

        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="global/navbar.jsp"%>

<!-- Fare Details Container -->
<div class="container fare-details-container">
<h2 class="text-center mb-4">Train No: <span class="blue-text"><%= request.getAttribute("trainnumber") %></span> Fare Details</h2>
    
    <%
        com.railtick.beans.TrainBean train = (com.railtick.beans.TrainBean) request.getAttribute("train");
        if (train != null) {
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Fare</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Sleeper</td>
                    <td><%= train.getSleeper() %></td>
                </tr>
                <tr>
                    <td>General</td>
                    <td><%= train.getGeneral() %></td>
                </tr>
                <tr>
                    <td>AC Tier</td>
                    <td><%= train.getAc_tier() %></td>
                </tr>
                <tr>
                    <td>AC 2 Tier</td>
                    <td><%= train.getAc_2_tier() %></td>
                </tr>
                
            </tbody>
        </table>
    <%
        } else {
    %>
        <div class="error-message">
            <p class="err">Train No. <%= request.getParameter("trainnumber") %> is Not Available!</p>
        </div>
    <%
        }
    %>

    <button class="btn btn-secondary btn-back" onclick="goBack()"><i class="fas fa-arrow-left"></i> Go Back</button>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
