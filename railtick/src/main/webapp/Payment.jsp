<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Razorpay Payment</title>
    <!-- Include the Razorpay Checkout script -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <!-- Include SweetAlert CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Add your custom styles here */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            color: #3399cc;
        }
        button {
            background-color: #3399cc;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
 <!-- Display the content -->
    <% String content = (String) session.getAttribute("content");
       if (content != null) { %>
           <%= content %>
    <% } %>
    
    <div class="container">
        <h1>Razorpay Payment</h1>
        <p>Click the button below to proceed with the payment.</p>
        <button onclick="initiateRazorpayPayment()">Proceed to Payment</button>
    </div>
    
    
    

    <script>
        function initiateRazorpayPayment() {
            var options = {
                key: 'rzp_test_LSfhbrTgIOlWn2', // Replace with your Razorpay key
                amount: <%= (Long)session.getAttribute("totalAmount") * 100 %>, // Retrieve totalAmount from the session
                currency: 'INR',
                name: 'RailTick',
                description: 'Train Booking',
                image: 'your_logo_url.png', // URL of your company logo
                order_id: '<%= session.getAttribute("razorpayOrderId") %>', // Retrieve the stored Razorpay order ID
                handler: function (response) {
                    // Handle the payment success callback
                    console.log('Payment successful!', response);
                    
                    Swal.fire('Congrats!', 'Payment Successful', 'success')
                        .then((result) => {
                            // Dynamically create a form
                            var form = document.createElement('form');
                            form.method = 'post';
                            form.action = 'booktrains'; // Replace with the correct URL

                            // Submit the form
                            document.body.appendChild(form);
                            form.submit();
                        });
                },
                prefill: {
                    name: 'Customer Name',
                    email: 'customer@example.com',
                    contact: '9876543210'
                },
                theme: {
                    color: '#3399cc'
                }
            };

            var rzp = new Razorpay(options);

            // Handle the payment failure callback
            rzp.on('payment.failed', function (response) {
                console.log('Payment failed!', response.error.description);
                Swal.fire('Payment Failed', response.error.description, 'error');
            });

            rzp.open();
        }
    </script>
</body>
</html>
