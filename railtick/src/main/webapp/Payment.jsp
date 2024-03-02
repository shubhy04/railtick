<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RailTick - Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: #333;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            transition: box-shadow 0.3s;
            overflow: hidden;
        }

        .container:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #3498db;
            margin-bottom: 20px;
            font-size: 24px;
        }

        p {
            color: #555;
            font-size: 16px;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        button {
            background-color: #27ae60;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-weight: bold;
        }

        button:hover {
            background-color: #218e54;
        }

        #loadingSpinner {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            z-index: 9999;
        }

        #loadingSpinner img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .details {
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: left;
            transition: box-shadow 0.3s;
        }

        .details:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .details table, .details th, .details td {
            border: 1px solid #ddd;
        }

        .details th, .details td {
            padding: 12px;
            text-align: left;
        }

        .details th {
            background-color: #3498db;
            color: white;
        }

        .details p {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <!-- Display the content -->
    <div class="details">
        <% 
            String content = (String) session.getAttribute("content");
            if (content != null) { %>
                <%= content %>
        <% } %>
    </div>

    <div class="container">
        <h1>RailTick - Payment</h1>
        <p>Click the button below to proceed with the payment for your train ticket.</p>
        <button id="razorpayBtn" onclick="initiateRazorpayPayment()">Proceed to Payment</button>
        <div id="loadingSpinner" class="overlay">
            <img src="loading.gif" alt="Loading Spinner">
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
    function initiateRazorpayPayment() {
        var razorpayBtn = $('#razorpayBtn');
        

        // Fetch data from server-side
        var totalAmount = <%= (Long)session.getAttribute("totalAmount") * 100 %>;
        var razorpayOrderId = '<%= session.getAttribute("razorpayOrderId") %>';

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

                // Displaying payment details
                Swal.fire({
                    title: 'Congrats!',
                    text: 'Payment Successful\nPayment ID: ' + paymentId + '\nSignature: ' + signature,
                    icon: 'success',
                }).then((result) => {
                    // Add the payment details to the form data if needed
                    var form = $('<form method="post" action="booktrains"></form>');
                    form.append('<input type="hidden" name="razorpay_payment_id" value="' + paymentId + '">');
                    form.append('<input type="hidden" name="razorpay_signature" value="' + signature + '">');
                    $('body').append(form);
                    form.submit();
                });
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
