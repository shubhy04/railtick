<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RT-FareDetails</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            color: #495057;
        }
        .container, .tab {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            padding-bottom: 0px;
            background-color: #b5b5b5;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow-x: auto; /* Enable horizontal scrolling on small screens */
        }

        .menu {
            font-size: 30px;
            font-weight: bold;
            color: #2f4f4f;  
            text-align: center;
        }
        .blue {
            color: #2f4f4f;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            color: white;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
   <%@include file="global/navbar_home.jsp"%>
    <div class="container">
        <div class='menu'>Fare Details</div>
        <table>
            <!-- Table content-->
        </table>
        <div class="error-message">
            <!-- Error message content -->
        </div>
    </div>
</body>
</html>
