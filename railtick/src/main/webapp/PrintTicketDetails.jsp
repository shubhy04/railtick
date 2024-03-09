<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.HistoryBean" %>
<html lang="en">
<head>
    <title>Booking Details</title>   
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

        .table-container th, .table-container td {
            padding: 12px;
            border: 1px solid #dee2e6;
            text-align: left;
        }

        .table-container th {
            background-color: #403d39;
            color: #fff;
            cursor: pointer;
        }

        .table-container th:hover {
            background-color: #252422;
        }
        .form-class{
       	margin-right:0; 
       	padding-right:0;
        }

        .btn-see-fare,
        .btn-book-train,
        .btn-home,
        .btn-go-back {
            display: inline-block;
            margin-right: 10px;
        }

        .footer {
            background-color: #403d39;
            color: #fffcf2;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        .error-message {
            background-color: #ffdddd;
            color: #dc3545;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .history-details {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .history-details p {
            margin: 10px 0;
        }

        .action-buttons {
            margin-top: 20px;
        }

        .action-buttons button {
            margin-right: 10px;
        }

        .footer {
            background-color: #403d39;
            color: #fffcf2;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            width: 100%;
            bottom: auto;
        }

        @media print {
            .action-buttons {
                display: none !important;
            }
        }
    </style>
</head>
<body>
<%@include file="global/navbar.jsp"%>

    <div class="container mt-4">
        <div class="history-details">
            <h2 class="text-center mb-4"><i class="fas fa-receipt"></i> Booking Details</h2>
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

                <!-- Action Buttons -->
                <div class="action-buttons  row justify-content-center">
                    <!-- Home Button -->
                    <div class="col-md-2 ">
                        <a href="HomePage.jsp" class="btn btn-primary btn-block"><i class="fas fa-home"></i> Home</a>
                    </div>
                    <!-- Go Back Button -->
                    <div class="col-md-2 ">
                        <button class="btn btn-secondary btn-block" onclick="goBack()"><i class="fas fa-arrow-left"></i> Go Back</button>
                    </div>
                    <!-- Print Details Button -->
                    <div class="col-md-2 ">
                        <button class="btn btn-info btn-block" onclick="printPage()"><i class="fas fa-print"></i> Print Details</button>
                    </div>
                    <!-- Cancel Ticket Button -->
                    <div class="col-md-2">
                        <form id="cancelForm" action="cancelBooking" method="post" onsubmit="return confirmCancel()">
                            <input type="hidden" name="transId" value="<%= transaction.getTransId() %>">
                            <button class="btn btn-danger btn-block" type="submit"><i class="fas fa-times"></i> Cancel Ticket</button>
                        </form>
                    </div>
                </div>

            <%
                } else {
            %>
                <!-- Error message for no booking details -->
                <p class="error-message">No booking details found for the provided Transaction ID.</p>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 RailTick. All rights reserved.</p>
        </div>
    </footer>

    <script>
        function printPage() {
            window.print();
        }
        function goBack() {
            window.history.back();
        }

        function confirmCancel() {
            // Use SweetAlert for confirmation dialog
            Swal.fire({
                title: 'Are you sure?',
                text: 'You won\'t be able to revert this!',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, cancel it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // If user clicks "Yes," submit the form
                    document.forms['cancelForm'].submit();
                }
            });

            // Prevent the default form submission
            return false;
        }
    </script>
</body>
</html>
