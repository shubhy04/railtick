<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.goback-btn {
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 10px;
}

.goback-btn:hover {
	background-color: #2980b9;
}
</style>

<title>RT-CancelTrain</title>
</head>
<body>
	<div class='main'>
		<p class='menu'>Train Cancellation</p>
	</div>
	<form class="tab" action="admincancletrain" method="post">
		Train Number:<input type="text" name="trainno"><br />
		<br /> <input type="submit" value=" CANCLE TRAIN ">
	</form>
	<a href="AdminHome.jsp"
			class="goback-btn">HOME</a>

</body>
</html>