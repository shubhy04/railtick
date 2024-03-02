<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.BookingDetails" %>
<%@ page import="com.railtick.beans.HistoryBean" %>
<html>
<head>
    <title>Booking Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
        }

        p {
            margin-bottom: 10px;
        }

        .error-message {
            color: #ff0000;
            font-weight: bold;
        }
   		.print-button {
            display: block;
            margin-top: 20px;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function printPage() {
            window.print();
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Booking Details</h1>

    <%
        HistoryBean transaction = (HistoryBean) request.getAttribute("transaction");
        if (transaction != null) {
    %>
        <p><strong>Transaction ID:</strong> <%= transaction.getTransId() %></p>
        <p><strong>From Station:</strong> <%= transaction.getFrom_stn() %></p>
        <p><strong>To Station:</strong> <%= transaction.getTo_stn() %></p>
        <p><strong>Date:</strong> <%= transaction.getDate() %></p>
        <p><strong>Mail ID:</strong> <%= transaction.getMailId() %></p>
        <p><strong>Seats:</strong> <%= transaction.getSeats() %></p>
        <p><strong>Amount:</strong> <%= transaction.getAmount() %></p>
        <p><strong>Train Number:</strong> <%= transaction.getTr_no() %></p>
        <p><strong>Razorpay_payment_id:</strong> <%= transaction.getRazorpay_payment_id() %></p>
        <p><strong>Razorpay_signature:</strong> <%= transaction.getRazorpay_signature() %></p>
        <p><strong>Razorpay_order_id:</strong> <%= transaction.getRazorpayOrderId() %></p>

    <%
        } else {
    %>
        <p class="error-message">No booking details found for the provided Transaction ID.</p>
    <%
        }
    %>
		<button class="print-button" onclick="printPage()">Print Details</button>
</div>

</body>
</html>
