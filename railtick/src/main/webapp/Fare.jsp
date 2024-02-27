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
	<form action="fareenq" class="tab red" method="post">
		From Station: <input type="text" name="fromstation"><br /> <br />
		To Station: <input type="text" name="tostation"><br /> <br />
		Select Class <select name='class' required>
			<option value='Sleeper(SL)'>Sleeper(SL)</option>
			<option value='Second Sitting(2S)'>Second Sitting(2S)</option>
			<option value='AC First Class(1A)'>AC First Class(1A)</option>
			<option value='AC 2 Tier(2A)'>AC 2 Tier(2A)</option>
		</select> <input type="submit" value=" Get Fare "><br />
	</form>
	<br />


</body>
</html>