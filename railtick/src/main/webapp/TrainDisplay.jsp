<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.TrainBean" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>RailTick - Train Details</title>
  <style>
    

    .table-container {
      margin-top: 20px;
    }

    .table-container table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .table-container th, .table-container td {
      padding: 12px;
      border: 1px solid #dee2e6;
      text-align: left;
    }

    .table-container th {
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
    }

    .table-container th:hover {
      background-color: #0056b3;
    }

    .btn-see-fare {
      display: block;
      
    }

    .btn-book-train {
      display: block;
      margin-top: 20px;
    }

    .footer {
      background-color: #343a40;
      color: #fff;
      bottom: 0;
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
                <td><a class="btn btn-primary btn-see-fare" href='fare?trainNo=<%= trainData.getTr_no() %>&fromStn=<%= trainData.getFrom_stn() %>&toStn=<%= trainData.getTo_stn() %>'>See fare</a></td>
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
