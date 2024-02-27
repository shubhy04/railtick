<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Payments</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        .inlineimage {
            max-width: 470px;
            margin-right: 8px;
            margin-left: 10px;
        }

        .images {
            display: inline-block;
            max-width: 98%;
            height: auto;
            width: 22%;
            margin: 1%;
            left: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="hd">
    <h1>Card Payment Gateway</h1>
</div>
<!-- Credit Card Payment Form - START -->
<div class="container-fluid" style="position: fixed;">
    <div class="row">
        <div class="col-xs-12 col-md-5 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="inlineimage">
                            <img class="img-responsive images"
                                 src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Mastercard-Curved.png">
                            <img class="img-responsive images"
                                 src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Discover-Curved.png">
                            <img class="img-responsive images"
                                 src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Paypal-Curved.png">
                            <img class="img-responsive images"
                                 src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/American-Express-Curved.png">
                        </div>
                    </div>
                </div>
                
                <header>
                
                </header>
                
                <form role="form" id="paymentForm" action="booktrains"
                      method="post">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>CARD NUMBER</label>
                                    <div class="input-group">
                                        <input type="tel" id="cardNumber" class="form-control"
                                               placeholder="Valid Card Number" required /> <span
                                                class="input-group-addon"><span
                                                class="fa fa-credit-card"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label><span class="hidden-xs">EXPIRATION</span><span
                                                class="visible-xs-inline">EXP</span> DATE</label> <input type="text"
                                                                                                              id="expirationDate" class="form-control"
                                                                                                              placeholder="MM / YY" required />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label>CV CODE</label> <input type="tel" id="cvCode"
                                                                   class="form-control" placeholder="CVC" required />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label>CARD OWNER</label> <input type="text" id="cardOwner"
                                                                       class="form-control" placeholder="Card Owner Name" required />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-xs-12">
                                <input type="submit" value="Confirm Payment"
                                       class="btn btn-success btn-lg btn-block" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- jQuery library -->
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CardValidator library script -->
<script src="https://cdn.jsdelivr.net/card-validator/7.2.1/card-validator.min.js"></script>

<script>
    $(document).ready(function() {
        $("#paymentForm").submit(function(event) {
            if (!validateForm()) {
                // Prevent the form submission if validation fails
                event.preventDefault();
            }
        });

        function validateForm() {
            var isValid = true;

            // Validate card number
            var cardNumber = $("#cardNumber").val().replace(/\s/g, ''); // Remove spaces
            if (!isValidCreditCard(cardNumber)) {
                isValid = false;
                alert("Invalid credit card number");
            }

            // Validate expiration date
            var expirationDate = $("#expirationDate").val();
            if (!isValidExpirationDate(expirationDate)) {
                isValid = false;
                alert("Invalid expiration date");
            }

            // Validate CV code
            var cvCode = $("#cvCode").val();
            if (!isValidCVCode(cvCode)) {
                isValid = false;
                alert("Invalid CV code");
            }

            // Validate card owner name
            var cardOwner = $("#cardOwner").val();
            if (!isValidCardOwner(cardOwner)) {
                isValid = false;
                alert("Invalid card owner name");
            }

            return isValid;
        }

        function isValidCreditCard(cardNumber) {
            
            return cardValidator.number(cardNumber).isValid;
        }

        function isValidExpirationDate(expirationDate) {
            
            return /^\d{2}\/\d{2}$/.test(expirationDate); // (MM / YY format)
        }

        function isValidCVCode(cvCode) {
            
            return /^\d{3}$/.test(cvCode); // (3-digit numeric code)
        }

        function isValidCardOwner(cardOwner) {
            
            return cardOwner.trim() !== ""; // (non-empty name)
        }
    });
</script>

</body>
</html>
