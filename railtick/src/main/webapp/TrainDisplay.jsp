<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.TrainBean" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>RailTick - Train Details</title>
<style>
    body {
      background-color: #FFF7F1;
      color: #403d39;
    }

    .table-container {
      margin-top: 20px;
    }

    .table-container table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .table-container th,
    .table-container td {
      padding: 12px;
      border: 1px solid #dee2e6;
      text-align: left;
    }

    .table-container th {
      background-color: #403d39;
      color: #fff;
      cursor: pointer;
    }

    .table-container tbody tr {
      background-color: #ccc5b9;
    }
  	.btn-see-fare,
    .btn-book-train {
      display: block !important;
      background-color: #403d39 !important;
      color: #fffcf2 !important;
      border: 1px solid #403d39 !important;
      margin-top: 5px !important;
      transition: background-color 0.3s !important;
      text-decoration: none !important;
    }

    .btn-see-fare:hover,
    .btn-book-train:hover,
    .btn-see-fare:active,
    .btn-book-train:active,
    .btn-see-fare:focus,
    .btn-book-train:focus {
      background-color: #252422 !important;
      border: 1px solid #252422 !important;
      color: #fffcf2!important; 
    }
    .footer {
      background-color: #403d39;
      color: #fffcf2;
      padding: 20px 0;
      text-align: center;
      position: absolute;
      width: 100%;
      bottom:0;   
    }
    .error-message {
      background-color: #ffdddd;
      color: #dc3545;
      padding: 10px;
      margin-top: 20px;
      border-radius: 5px;
    }

    .err {
      font-weight: bold;
    }
 </style>
</head>
<body>
<%@include file="global/navbar.jsp"%>

  <!-- Train Details Table -->
  <div class="container table-container">
    <h2 class="text-center mb-4">Train Details</h2>
    <table class="table">
      <thead>
        <tr>
          <th>Train Name</th>
          <th>Train Number</th>
          <th>From Station</th>
          <th>To Station</th>
          <th>Time</th>
          <th>Seats</th>
          <th>Fare </th>
        </tr>
      </thead>
      <tbody>
           
        <% 
            TrainBean trainData = (TrainBean) request.getAttribute("trainData");
        String time = (String) request.getAttribute("time");
            if (trainData != null) {
        %>
            <tr>
                <td><%= trainData.getTr_name() %></td>
                <td><%= trainData.getTr_no() %></td>
                <td><%= trainData.getFrom_stn() %></td>
                <td><%= trainData.getTo_stn() %></td>
				<td><%= generateRandomTime() %></td>
                <td><%= trainData.getSeats() %></td>
                <td><a class="btn btn-primary btn-see-fare" href='fare?trainnumber=<%= trainData.getTr_no() %>&fromStn=<%= trainData.getFrom_stn() %>&toStn=<%= trainData.getTo_stn() %>'>See fare</a></td>
            </tr>
        <% 
            } else {
        %>
            <!-- Handle the case when trainData is null -->
            <tr>
                <td colspan="7">No train data available</td>
            </tr>
        <% 
            } 
        %>
        <%!
  // Function to generate random time
  String generateRandomTime() {
    int hr = (int) (Math.random() * 24);
    int min = (int) (Math.random() * 60);
    return (hr < 10 ? ("0" + hr) : hr) + ":" + ((min < 10) ? "0" + min : min);
  }
%>
      </tbody>
    </table>
  </div>
  

  <!-- Book Train Button -->
  <div class="container">
   <a class="btn btn-success btn-book-train" href='booktrainbyref?trainNo=<%= trainData.getTr_no() %>&fromStn=<%= trainData.getFrom_stn() %>&toStn=<%= trainData.getTo_stn() %>'>Book Now</a>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
  </footer>

  
</body>
</html>
