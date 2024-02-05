<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-Index</title>
<%@include file="global/global_css.jsp"%>
<style>
body {
	margin: 0;
	padding: 0;
	background-image: url('images/image.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	font-family: 'Arial', sans-serif;
}
.content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	padding: 100px;
	color: #fff;
}
</style>
</head>
<body>
	<%@include file="global/navbar.jsp"%>
	<div class="content">
		<h1>Welcome to RailTick</h1>
		<p>Book your ticket anywhere</p>
	</div>
</body>
</html>

