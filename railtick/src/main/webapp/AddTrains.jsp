<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RT-AddTrains</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .main {
            text-align: center;
            background-color: #333;
            color: #fff;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }
        .menu {
            margin: 0;
            font-size: 24px;
        }
        .tab {
            max-width: 400px;
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }
        input[type="text"] {
            width: calc(100% - 16px);
            padding: 12px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .home-button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            margin-top: 20px;
            align-self: flex-end;
            box-sizing: border-box;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
        
    </style>
</head>
<body>

    <div class='main'>
        <p class='menu'> Add Trains </p>
    </div>
    <form class="tab" action="adminaddtrain" method="post">
        <label>Train Number:</label>
        <input type="text" id="trainno" name="trainno" required>

        <label>Train Name:</label>
        <input type="text" id="trainname" name="trainname" required>

        <label>From Station:</label>
        <input type="text" id="fromstation" name="fromstation" required>

        <label>To Station:</label>
        <input type="text" id="tostation" name="tostation" required>

        <label>Available:</label>
        <input type="text" id="available" name="available" required>

        <label>Fare (INR):</label>
        <input type="text" id="fare" name="fare" required>

        <input type="submit" value="ADD TRAIN">
        <a href="AdminHome.jsp" class="home-button">HOME</a>
    </form>

    
</body>
</html>
