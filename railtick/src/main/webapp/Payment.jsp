<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Payment Details</title>
<style>
   body {
            background-color: #FFF7F1;
            color: #403d39;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .booking-details-container {
            margin-top: 20px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .booking-details-container th {
            background-color: #ccc5b9;
            cursor: pointer;
        }

        .table td, .table th {
            border: 1px solid #dee2e6;
            padding: 15px;
            text-align: center;
        }
        .amount-value {
   			 background-color: #ccc5b9; 
  		}
  		.footer {
            background-color: #403d39;
            color: #fffcf2;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

    .payment-info {
        text-align: center;
        margin-top: 20px;
        
    }

    .payment-info h1 {
        color: #007bff;
    }

    .payment-info p {
        color: #343a40;
    }

    #razorpayBtn {
       background-color: #403d39 ;
       color: #fffcf2 ;
        margin-bottom: 20px;      
        border: none;
        padding: 15px 30px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-weight: bold;
        margin-bottom: 15px;
    }

    #razorpayBtn:hover {
        background-color: #252422;
    }
   
    .table td.amount-value {
        font-weight: bold;
    }
</style>
</head>
<body>
<%@include file="global/navbar.jsp"%>

	<!-- Display the content -->
	<div class="container booking-details-container">
		<div>
			<h2 class="text-center">Your Ticket Booking Information</h2>
			<table class="table table-bordered">
				<%
				String content = (String) session.getAttribute("content");
				if (content != null) {
				%>
				<%=content%>
				<%
				}
				%>
			</table>


		</div>
	</div>

	<div class="payment-info">
		 <button id="razorpayBtn" onclick="initiateRazorpayPayment()">
            <span class="loading-spinner" id="loadingSpinner"></span>
            Proceed to Payment
        </button>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<p>&copy; 2024 RailTick. All rights reserved.</p>
		</div>
	</footer>

	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
	function initiateRazorpayPayment() {
	    var razorpayBtn = $('#razorpayBtn');

	    // Fetch data from server-side
	    var totalAmount = <%= (Long) session.getAttribute("totalAmount") * 100 %>;
	    var razorpayOrderId = '<%= session.getAttribute("razorpayOrderId") %>';

	    var form = $('<form method="post" action="booktrains" id="razorpayForm"></form>');
	    form.append('<input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id" value="">');
	    form.append('<input type="hidden" name="razorpay_signature" id="razorpay_signature" value="">');
	    form.append('<input type="hidden" name="razorpay_order_id" id="razorpay_order_id" value="">');
	    $('body').append(form);

	    var options = {
	        key: 'rzp_test_LSfhbrTgIOlWn2',
	        amount: totalAmount,
	        currency: 'INR',
	        name: 'RailTick',
	        description: 'Train Booking',
	        image: 'Logo.jpg',
	        order_id: razorpayOrderId,
	        handler: function (response) {
	            console.log('Payment successful!', response);

	            // Extracting payment details
	            var paymentId = response.razorpay_payment_id;
	            var signature = response.razorpay_signature;
	            var orderId = response.razorpay_order_id;

	            // Set values to hidden fields
	            $('#razorpay_payment_id').val(paymentId);
	            $('#razorpay_signature').val(signature);
	            $('#razorpay_order_id').val(orderId);

	            // Submit the form
	            document.getElementById("razorpayForm").submit();
	        },
	        customer: {
	            name: 'Customer Name',
	            contact: '9876543210',
	            email: 'customer@example.com'
	        },
	        theme: {
	            color: '#007bff'
	        }
	    };

	    var rzp = new Razorpay(options);

	    rzp.on('payment.failed', function (response) {
	        console.log('Payment failed!', response.error.description);
	        Swal.fire({
	            title: 'Payment Failed',
	            text: response.error.description,
	            icon: 'error',
	        });
	    });

	    rzp.open();
	}
    </script>
</body>
</html>
