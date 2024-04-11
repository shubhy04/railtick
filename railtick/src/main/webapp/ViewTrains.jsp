<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="Admin.css"> -->
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

.goback-btn:hover {
	background-color: #2980b9;
}

</style>
<meta charset="UTF-8">
<title>RT-AdminViewTrains</title>
</head>
<body>
<%@include file="global/AdminNavbar.jsp"%>

</body>
</html>