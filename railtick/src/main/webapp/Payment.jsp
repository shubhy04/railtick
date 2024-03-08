<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Payment Details</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- FontAwesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Arial', sans-serif;
	
}

.navbar {
	background-color: #343a40;
	padding: 20px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
	color: #fff;
}

.navbar-logo {
	font-size: 1.8rem;
	color: #fff;
	margin-right: 5px;
}

.navbar-toggler-icon {
	background-color: #fff;
}

.user-dropdown {
	cursor: pointer;
}

.container {
	max-width: 1200px;
	margin-top: 20px;
}

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

.footer {
	background-color: #343a40;
	color: #fff;
	
	text-align: center;
	position: absolute;

	width: 100%;
}

/* Payment Information Styles */
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
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 15px 30px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-weight: bold;
        margin-bottom: 15px;
    }

    #razorpayBtn:hover {
        background-color: #0056b3;
    }
   
    .table td.amount-value {
        font-weight: bold;
    }
</style>
</head>
<body>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<!-- Railway Icon -->
			<span class="navbar-logo">&#128642;</span>
			<!-- Railway Booking Text -->
			<a class="navbar-brand" href="HomePage.jsp">RailTick</a>
			<!-- Navbar Toggler Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Navbar Items -->
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="#featured-trains">Book Trains</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#popular-destinations">Other Features</a></li>
					<li class="nav-item"><a class="nav-link" href="#testimonials">Testimonials</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#services">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
					</li>
					<!-- User Dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle user-dropdown" href="#"
						id="userDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-user"></i>
					</a>
						<div class="dropdown-menu" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="viewuserprofile"><i
								class="fas fa-user-circle"></i> View Profile</a> <a
								class="dropdown-item" href="edituserprofile"><i
								class="fas fa-edit"></i> Update Profile</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="userlogout"><i
								class="fas fa-sign-out-alt"></i> Logout</a>
						</div></li>
					<!-- End User Dropdown -->
				</ul>
			</div>
		</div>
	</nav>

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

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
	        image: 'your_logo_url.png',
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
	        prefill: {
	            name: 'Customer Name',
	            email: 'customer@example.com',
	            contact: '9876543210'
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
