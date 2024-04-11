<!DOCTYPE html>
<%@include file="global/navbar.jsp"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>RailTick - Train Details</title>
<style>

body {
    background-color: #FFF7F1;
    color: #403d39;
}

.footer {
    background-color: #403d39;
    color: #fffcf2;
    padding: 20px 0;
    text-align: center;
    width: 100%;
    position: absolute;
    bottom:0px;
}


.button-container {
    margin-top: 200px;
    margin-left: 700px;
}
.go-back-button {
    background-color: #403d39; 
    color: #fffcf2; 
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin
}

.go-back-button:hover {
    background-color: #595756; 
}

</style>
</head>
<body>
    
 <%
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null) {
%>
<script>
    alert("<%= errorMessage %>");
</script>
<%
}
%>

    <!-- Go Back button -->
    <div class="button-container">
        <button class="go-back-button" onclick="goBack()">Go Back</button>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 RailTick. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
