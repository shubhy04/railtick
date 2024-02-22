<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RailTick - Train Enquiry</title>
<%@include file="global/global_css.jsp"%>
<style type="text/css">
body {
	background-color: #f0f0f0; /* Light gray */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
}

.form-container {
	background-color: #ffffff; 
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin: 20px auto;
	width: 300px;
}

.form-container label {
	display: block;
	text-align: left;
	margin-bottom: 8px;
	font-weight: bold;
}

.form-container input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
}


.form-container input[type="submit"] {
	background-color: #27374D; /* Dark blue */
	color: #ffffff;
	padding: 12px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 5px;
	
}
.form-container input[type="submit"]:hover {
	background-color: #ffc107; /* Yellow color  */
}
</style>
</head>
<body>
<%@include file="global/navbar_home.jsp"%>
	<div class="form-container">
		<form action="searchtrainservlet" method="post">
			<label for="trainNumber">Train Number:</label> <input type="text"
				id="trainNumber" name="trainnumber" required>
			<!-- 
            <label for="source">Source Station:</label>
            <input type="text" id="source" name="source" required>

            <label for="destination">Destination Station:</label>
            <input type="text" id="destination" name="destination" required>
 -->
			<input
				type="submit" value="SEARCH TRAIN">
		</form>
	</div>
</body>
</html>
