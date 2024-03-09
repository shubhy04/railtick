<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Details</title>
    <style>
        .booking-details-container {
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

        .btn-pay-book {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-pay-book:hover {
            background-color: #0056b3;
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

<!-- Booking Details Container -->
<div class="container booking-details-container">
    <div>
        <h2 class="text-center mb-4">Your Ticket Booking Information</h2>
        <form action='payment' method='post'>
            <table class="table table-bordered">
                <tr>
                    <th><i class="fas fa-id-card"></i> USER ID</th>
                    <td>${emailId}</td>
                    <th><i class="fas fa-train"></i> Train NO</th>
                    <td>${trainNo}</td>
                </tr>
                <tr>
                    <th><i class="fas fa-map-marker-alt"></i> From Station</th>
                    <td>${fromStn}</td>
                    <th><i class="fas fa-map-marker-alt"></i> To Station</th>
                    <td>${toStn}</td>
                </tr>
                <tr>
                    <th><i class="far fa-calendar-alt"></i> Journey Date</th>
                    <td>
                        <input type='hidden' name='trainnumber' value='${trainNo}'>
                        <input type='date' name='journeydate' value='${today}' min='${today}' class="form-control">
                    </td>
                    <th><i class="fas fa-chair"></i> No of Seats</th>
                    <td><input type='number' name='seats' value='${seat}' class="form-control"></td>
                </tr>
                <tr>
                    <th><i class="fas fa-ticket-alt"></i> Select Class</th>
                    <td>
                        <select name='class' required class="form-control">
                            <option value='Sleeper(SL)'>Sleeper(SL)</option>
                            <option value='Second Sitting(2S)'>Second Sitting(2S)</option>
                            <option value='AC First Class(1A)'>AC First Class(1A)</option>
                            <option value='AC 2 Tier(2A)'>AC 2 Tier(2A)</option>
                        </select>
                    </td>
                    <th><i class="fas fa-bed"></i> Berth Preference</th>
                    <td>
                        <select name='berth' class="form-control">
                            <option value='NO'>No Preference</option>
                            <option value='LB'>Lower Berth(LB)</option>
                            <option value='UB'>Upper Berth(UB)</option>
                            <option value='C'>Cabin</option>
                        </select>
                    </td>
                </tr>
            </table>

            <p class="text-center"><button type='submit' class="btn btn-primary btn-pay-book"><i class="fas fa-money-check-alt"></i> Pay And Book</button></p>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
