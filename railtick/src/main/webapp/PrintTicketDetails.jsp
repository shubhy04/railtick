<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railtick.beans.HistoryBean" %>
<html>
<head>
    <title>Booking Details</title>
    
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
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

    .action-buttons {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .print-button,
    .cancel-button {
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .print-button {
        background-color: #4caf50;
        color: #fff;
    }

    .cancel-button {
        background-color: #dc3545;
        color: #fff;
    }

    @media print {
        .action-buttons {
            display: none;
        }
    }
</style>


    <script>
        function printPage() {
            window.print();
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
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <button class="print-button" onclick="printPage()">Print Details</button>
                
                <!-- Ticket Cancel Form -->
                <form id="cancelForm" action="cancelBooking" method="post" onsubmit="return confirmCancel()">
                    <input type="hidden" name="transId" value="<%= transaction.getTransId() %>">
                    <button class="cancel-button" type="submit">Cancel Ticket</button>
                </form>
            </div>

        <%
            } else {
        %>
            <p class="error-message">No booking details found for the provided Transaction ID.</p>
        <%
            }
        %>
    </div>

</body>
</html>
