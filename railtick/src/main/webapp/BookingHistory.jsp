<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-BookingHistory</title>
<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .ticket {
            width: 80%;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
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
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Print Styles */
        @media print {
            body {
                background-color: white;
                padding: 0;
            }

            .ticket {
                width: 100%;
                margin: 0;
                box-shadow: none;
                padding: 10px;
            }

            table, th, td {
                border: 1px solid #000;
            }

            th {
                background-color: #f2f2f2;
            }

            button {
                display: none;
            }
        }

        /* Additional styles for better print layout */
        @media print {
            table {
                page-break-inside: auto;
            }

            th, td {
                page-break-inside: avoid;
            }
        }
    </style>
</head>
<body>

</body>
</html>