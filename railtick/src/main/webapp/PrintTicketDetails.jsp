<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .main {
            text-align: center;
            margin-top: 20px;
        }

        .tab {
            width: 60%;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        button {
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Print Styles */
        @media print {
            body {
                background-color: white;
            }

            .tab {
                width: 100%;
                margin: 0;
                box-shadow: none;
            }

            table, th, td {
                border: 1px solid #000;
            }

            button {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="main">
        <h1>Ticket Details</h1>
    </div>

    <div class="tab">
        <table>
            <tr>
                <th>Transaction ID</th>
                <td>${param.transId}</td> <!-- Retrieve the parameter from the URL -->
            </tr>
            <tr>
                <th>Train Name</th>
                <td>${requestScope.tr_no}</td>
            </tr>
            <tr>
                <th>From Station</th>
                <td>${requestScope.fr_stn}</td>
            </tr>
            <tr>
                <th>To Station</th>
                <td>${requestScope.to_stn}</td>
            </tr>
            <tr>
                <th>Journey Date</th>
                <td>${requestScope.date}</td>
            </tr>
            <tr>
                <th>Seat</th>
                <td>${requestScope.seats}</td>
            </tr>
            <tr>
                <th>Amount Paid</th>
                <td>${requestScope.amount}</td>
            </tr>
            <!-- Add more details as needed -->
        </table>
    </div>

    <div class="main">
        <button onclick="window.print()">Print Ticket</button>
    </div>
</body>
</html>
