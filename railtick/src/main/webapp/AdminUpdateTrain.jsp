<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: auto;
}

.title {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
	font-size: 2em;
}

.content {
	margin: 20px;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

table {
	width: 100%;
	border-collapse: collapse;
	/* 	margin-top: 20px; */
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background-color: #333;
	color: #fff;
}

.me {
	font-size: 1.5em;
	margin-bottom: 10px;
	margin-top: 10px;
}

/* Highlight alternate rows in the table */
tr:nth-child(even) {
	background-color: #f9f9f9;
}

/* Style for the 'Not Available' message */
.error-message {
	color: #e74c3c;
	font-size: 1.2em;
}

/* Add a subtle hover effect to the table rows */
tr:hover {
	background-color: #f2f2f2;
	transition: background-color 0.3s ease-in-out;
}

.goback-btn {
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

h1 {
	color: #333;
}

.train-search {
	max-width: 400px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #555;
	font-weight: bold;
}

input {
	width: calc(100% - 16px);
	padding: 12px;
	margin-bottom: 16px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.search-button {
	background-color: #4caf50;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.search-button:hover {
	background-color: #45a049;
}

@media ( max-width : 600px) {
	form {
		max-width: 100%;
	}
}
</style>
<title>RT-UpdateTrain</title>
</head>
<body>

	<div class="title">
		<p class="me">Search Trains</p>
	</div>
	<form id="trainUpdateForm" class="train-search"
		action="adminupdatetrain" method="post">
		<label for="trainNumber">Enter Train Number:</label> <input
			type="text" id="trainNumber" name="trainnumber" required>
		<button type="submit" class="search-button">SEARCH TRAIN</button>
	</form>

</body>
</html>