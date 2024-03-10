<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.railtick.beans.TrainBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
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


<%
    List<TrainBean> trains = (List<TrainBean>) request.getAttribute("trains");
	
%>
<%
    if (trains != null && !trains.isEmpty()) {
%>
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
          <th>Action </th>
        </tr>
      </thead>
      <tbody>
       <% for (TrainBean train : trains) { %>
            <tr>
                <td><%= train.getTr_name() %></td>
                <td><%= train.getTr_no() %></td>
                <td><%= train.getFrom_stn() %></td>
                <td><%= train.getTo_stn() %></td>
                <td><%= generateRandomTime() %></td>
                <td><%= train.getSeats() %></td>
                <td><a class="btn btn-primary btn-see-fare" href='fare?trainnumber=<%= train.getTr_no() %>&fromStn=<%= train.getFrom_stn() %>&toStn=<%= train.getTo_stn() %>'>See fare</a></td>
                <td><a class="btn btn-success btn-book-train" href='booktrainbyref?trainNo=<%= train.getTr_no() %>&fromStn=<%= train.getFrom_stn() %>&toStn=<%= train.getTo_stn() %>'>Book Now</a> </td>
               
            </tr>
            <% } %>
        <% 
            } else {
        %>
           
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

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
  </footer>

</body>
</html>
