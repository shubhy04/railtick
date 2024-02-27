<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div class="tab">
		<p class="menu">Fare Enquiry for Trains Between Stations</p>
	</div>
	<div class="form-container">
		<form action="fare" method="post">
			<label for="trainNumber">Train Number:</label> <input type="text"
				id="trainNumber" name="trainnumber" required>
			<!-- 
            <label for="source">Source Station:</label>
            <input type="text" id="source" name="source" required>

            <label for="destination">Destination Station:</label>
            <input type="text" id="destination" name="destination" required>
 -->
			<input type="submit" value="SEARCH TRAIN">
		</form>
		</div>
</body>
</html>